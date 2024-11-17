import 'package:farm_ed/components/video.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoDetails extends StatefulWidget {
  final String title;
  final String thumbnail;
  final String videoUrl;

  const VideoDetails({
    super.key,
    required this.title,
    required this.thumbnail,
    required this.videoUrl,
  });

  @override
  State<VideoDetails> createState() => _VideoDetailsState();
}

class _VideoDetailsState extends State<VideoDetails> {
  YoutubePlayerController? _youtubeController;
  FlickManager? _flickManager;
  VideoPlayerController? videoPlayerController;
  bool _isInitialized = false;
  bool _hasError = false;
  String _errorMessage = '';
  bool _isYoutubeVideo = false;

  @override
  void initState() {
    super.initState();
    _initializePlayer();
  }

  /// Extracts the YouTube video ID if the URL is valid.
  String? _getYoutubeId(String url) {
    try {
      // Handle full URLs and video IDs
      if (url.contains('youtu.be/') || url.contains('youtube.com/')) {
        return YoutubePlayer.convertUrlToId(url);
      }
      // Fallback: Check if it's a possible video ID
      if (url.length == 11) {
        return url;
      }
    } catch (e) {
      print('Error extracting YouTube ID: $e');
    }
    return null;
  }

  /// Initializes the video player (YouTube or regular video).
  Future<void> _initializePlayer() async {
    try {
      final String? youtubeId = _getYoutubeId(widget.videoUrl);

      if (youtubeId != null) {
        // Initialize YouTube player
        _youtubeController = YoutubePlayerController(
          initialVideoId: youtubeId,
          flags: const YoutubePlayerFlags(
            autoPlay: false,
            mute: false,
            controlsVisibleAtStart: true,
          ),
        );
        _isYoutubeVideo = true;
      } else {
        // Initialize non-YouTube video player
        videoPlayerController = VideoPlayerController.network(widget.videoUrl);
        await videoPlayerController!.initialize();
        _flickManager = FlickManager(
          videoPlayerController: videoPlayerController!,
          autoPlay: false,
        );
      }

      if (mounted) {
        setState(() {
          _isInitialized = true;
          _hasError = false;
        });
      }
    } catch (e) {
      print('Error initializing video player: $e');
      if (mounted) {
        setState(() {
          _hasError = true;
          _errorMessage = e.toString();
        });
      }
    }
  }

  /// Disposes of all controllers to free resources.
  @override
  void dispose() {
    _youtubeController?.dispose();
    _flickManager?.dispose();
    videoPlayerController?.dispose();
    super.dispose();
  }

  /// Builds the appropriate video player widget based on the video type.
  Widget _buildVideoPlayer() {
    if (_hasError) {
      return Container(
        height: 200,
        color: Colors.black87,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error_outline,
                color: Colors.white,
                size: 40,
              ),
              const SizedBox(height: 16),
              const Text(
                'Failed to load video',
                style: TextStyle(color: Colors.white),
              ),
              if (_errorMessage.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    _errorMessage,
                    style: const TextStyle(color: Colors.white70, fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                ),
            ],
          ),
        ),
      );
    }

    if (!_isInitialized) {
      return Container(
        height: 200,
        color: Colors.black87,
        child: const Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      );
    }

    if (_isYoutubeVideo && _youtubeController != null) {
      return YoutubePlayer(
        controller: _youtubeController!,
        showVideoProgressIndicator: true,
        progressColors: const ProgressBarColors(
          playedColor: Colors.red,
          bufferedColor: Colors.white70,
        ),
      );
    }

    if (_flickManager != null) {
      return AspectRatio(
        aspectRatio: videoPlayerController!.value.aspectRatio,
        child: FlickVideoPlayer(
          flickManager: _flickManager!,
          flickVideoWithControls: const FlickVideoWithControls(
            controls: FlickPortraitControls(),
          ),
          flickVideoWithControlsFullscreen: const FlickVideoWithControls(
            controls: FlickLandscapeControls(),
          ),
        ),
      );
    }

    return Container(); // Fallback for unexpected cases
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 150,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 3, 139, 28),
              ),
              child: Stack(
                children: [
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Container(
                        margin: const EdgeInsets.only(left: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: IconButton(
                          icon: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: Colors.green,
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 80.0),
                    child: Center(
                      child: Text(
                        'Videos',
                        style: TextStyle(
                          fontSize: 36,
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            _buildVideoPlayer(),
            Padding(
              padding: const EdgeInsets.all(25),
              child: Text(
                widget.title,
                style: const TextStyle(fontSize: 24, color: Colors.black),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Divider(),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 25.0),
                  child: Text(
                    'Other similar videos',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(height: 10),
                const MyVideos(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
