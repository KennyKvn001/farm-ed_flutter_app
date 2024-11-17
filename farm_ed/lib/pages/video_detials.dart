// video_details.dart
import 'package:farm_ed/components/video.dart';
import 'package:farm_ed/components/video_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flick_video_player/flick_video_player.dart';

class VideoDetails extends StatelessWidget {
  final String title;
  final String thumbnail;
  final String videoUrl;

  const VideoDetails({
    Key? key,
    required this.title,
    required this.thumbnail,
    required this.videoUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => VideoState()..initializePlayer(videoUrl),
      child: VideoDetailsView(title: title),
    );
  }
}

class VideoDetailsView extends StatelessWidget {
  final String title;

  const VideoDetailsView({Key? key, required this.title}) : super(key: key);

  Widget _buildVideoPlayer(BuildContext context, VideoState videoState) {
    if (videoState.hasError) {
      return Container(
        height: 200,
        color: Colors.black87,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, color: Colors.white, size: 40),
              const SizedBox(height: 16),
              const Text(
                'Failed to load video',
                style: TextStyle(color: Colors.white),
              ),
              if (videoState.errorMessage.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    videoState.errorMessage,
                    style: const TextStyle(color: Colors.white70, fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                ),
            ],
          ),
        ),
      );
    }

    if (!videoState.isInitialized) {
      return Container(
        height: 200,
        color: Colors.black87,
        child: const Center(
          child: CircularProgressIndicator(color: Colors.white),
        ),
      );
    }

    if (videoState.isYoutubeVideo && videoState.youtubeController != null) {
      return YoutubePlayer(
        controller: videoState.youtubeController!,
        showVideoProgressIndicator: true,
        progressColors: const ProgressBarColors(
          playedColor: Colors.red,
          bufferedColor: Colors.white70,
        ),
      );
    }

    if (videoState.flickManager != null) {
      return AspectRatio(
        aspectRatio: 16 / 9,
        child: FlickVideoPlayer(
          flickManager: videoState.flickManager!,
          flickVideoWithControls: const FlickVideoWithControls(
            controls: FlickPortraitControls(),
          ),
          flickVideoWithControlsFullscreen: const FlickVideoWithControls(
            controls: FlickLandscapeControls(),
          ),
        ),
      );
    }

    return Container();
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
            Consumer<VideoState>(
              builder: (context, videoState, child) =>
                  _buildVideoPlayer(context, videoState),
            ),
            Padding(
              padding: const EdgeInsets.all(25),
              child: Text(
                title,
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
