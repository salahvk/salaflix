import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerDisplayPage extends StatefulWidget {
  const TrailerDisplayPage({Key? key, required this.videoId}) : super(key: key);
  final String videoId;
  @override
  State<TrailerDisplayPage> createState() => _TrailerDisplayPageState();
}

class _TrailerDisplayPageState extends State<TrailerDisplayPage> {
  late YoutubePlayerController _controller;
  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;
  bool _isPlayerReady = false;
  void initState() {
    // final provider = Provider.of<DataProvider>(context, listen: false);
    // final trail = provider.video?.results![0].key;
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);

    _videoMetaData = const YoutubeMetaData();
    _playerState = PlayerState.unknown;
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 300,
            child: YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              // videoProgressIndicatorColor: Colors.amber,
              progressColors: ProgressBarColors(
                playedColor: Colors.amber,
                handleColor: Colors.amberAccent,
              ),
              onReady: () {
                _isPlayerReady = true;
              },
            ),
          )
        ],
      ),
    );
  }
}
