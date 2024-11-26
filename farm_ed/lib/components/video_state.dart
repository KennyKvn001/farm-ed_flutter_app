// video_state.dart
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoState extends ChangeNotifier {
  YoutubePlayerController? _youtubeController;
  FlickManager? _flickManager;
  VideoPlayerController? _videoPlayerController;
  bool _isInitialized = false;
  bool _hasError = false;
  String _errorMessage = '';
  bool _isYoutubeVideo = false;

  // Getters
  YoutubePlayerController? get youtubeController => _youtubeController;
  FlickManager? get flickManager => _flickManager;
  bool get isInitialized => _isInitialized;
  bool get hasError => _hasError;
  String get errorMessage => _errorMessage;
  bool get isYoutubeVideo => _isYoutubeVideo;

  // Initialize video player
  Future<void> initializePlayer(String videoUrl) async {
    try {
      final String? youtubeId = _getYoutubeId(videoUrl);

      if (youtubeId != null) {
        await _initializeYoutubePlayer(youtubeId);
      } else {
        await _initializeVideoPlayer(videoUrl);
      }

      _isInitialized = true;
      _hasError = false;
      notifyListeners();
    } catch (e) {
      print('Error initializing video player: $e');
      _hasError = true;
      _errorMessage = e.toString();
      notifyListeners();
    }
  }

  Future<void> _initializeYoutubePlayer(String videoId) async {
    _youtubeController = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        controlsVisibleAtStart: true,
      ),
    );
    _isYoutubeVideo = true;
  }

  Future<void> _initializeVideoPlayer(String videoUrl) async {
    _videoPlayerController = VideoPlayerController.network(videoUrl);
    await _videoPlayerController!.initialize();
    _flickManager = FlickManager(
      videoPlayerController: _videoPlayerController!,
      autoPlay: false,
    );
    _isYoutubeVideo = false;
  }

  String? _getYoutubeId(String url) {
    try {
      if (url.contains('youtu.be/') || url.contains('youtube.com/')) {
        return YoutubePlayer.convertUrlToId(url);
      }
      if (url.length == 11) {
        return url;
      }
    } catch (e) {
      print('Error extracting YouTube ID: $e');
    }
    return null;
  }

  void dispose() {
    _youtubeController?.dispose();
    _flickManager?.dispose();
    _videoPlayerController?.dispose();
    super.dispose();
  }
}
