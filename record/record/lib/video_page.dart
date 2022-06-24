import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

// 일단은 스택으로 < || > full screen 위에 짜기

class VideoPage extends StatefulWidget {
  final String filePath;

  const VideoPage({Key? key, required this.filePath}) : super(key: key);

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late VideoPlayerController _videoPlayerController;
  Map<int,String> captions = {
    5:"First subtitle",
    20:"Second subtitle"
  };

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  Future _initVideoPlayer() async {
    _videoPlayerController = VideoPlayerController.file(File(widget.filePath));
    print('file path is here ${widget.filePath}');

    await _videoPlayerController.initialize();
    await _videoPlayerController.setLooping(true);
    await _videoPlayerController.play();
    print('video player value is here ${_videoPlayerController.value.isPlaying}');
  }

  // @override
  // void initState() {
  //   super.initState();
  //
  //   // Create and store the VideoPlayerController. The VideoPlayerController
  //   // offers several different constructors to play videos from assets, files,
  //   // or the internet.
  //   // _videoPlayerController = VideoPlayerController.network(
  //   //   'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
  //   // );
  //   _initVideoPlayer();
  //
  //   // _videoPlayerController = VideoPlayerController.file(File(widget.filePath));
  //   //
  //   // // Initialize the controller and store the Future for later use.
  //   // // _initializeVideoPlayerFuture = _videoPlayerController.initialize();
  //   //
  //   // // Use the controller to loop the video.
  //   // _videoPlayerController.setLooping(true);
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preview'),
        elevation: 0,
        backgroundColor: Colors.black26,
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              print('do something with the file');

            },
          )
        ],
      ),
      extendBodyBehindAppBar: true,
      body: FutureBuilder(
        future: _initVideoPlayer(),
        builder: (context, state) {
          if (state.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return
              Container(
                // height: MediaQuery.of(context).size.height/1.2,
                // width: MediaQuery.of(context).size.width,

                child: VideoControl(),

              );
          }
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // 재생/일시 중지 기능을 `setState` 호출로 감쌉니다. 이렇게 함으로써 올바른 아이콘이
      //     // 보여집니다.
      //     setState(() {
      //       // 영상이 재생 중이라면, 일시 중지 시킵니다.
      //       if (_videoPlayerController.value.isPlaying) {
      //         _videoPlayerController.pause();
      //       } else {
      //         // 만약 영상이 일시 중지 상태였다면, 재생합니다.
      //         _videoPlayerController.play();
      //       }
      //     });
      //   },
      //   // 플레이어의 상태에 따라 올바른 아이콘을 보여줍니다.
      //   child: Icon(
      //     _videoPlayerController.value.isPlaying ? Icons.pause : Icons.play_arrow,
      //   ),
      // ),
    );

  }

  VideoControl(){
    return Stack(
      children:[
        Container(
          // padding: EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: VideoPlayer(_videoPlayerController),
        ),

        // Positioned(
        //   bottom: 200,
        //   child: VideoProgressIndicator(
        //     _videoPlayerController,
        //     allowScrubbing: true,
        //     colors: VideoProgressColors(
        //         backgroundColor: Colors.red,
        //         bufferedColor: Colors.black,
        //         playedColor: Colors.blueAccent),
        //   ),
        // ),

        Positioned(
          bottom: 50,
          left: MediaQuery.of(context).size.width/3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:<Widget>[

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton( onPressed: (){
                    _videoPlayerController.pause();
                  }, child: Icon(Icons.pause)),
                  Padding(padding: EdgeInsets.all(2)),
                  ElevatedButton(onPressed: (){
                    _videoPlayerController.play();
                  }, child: Icon(Icons.play_arrow))
                ],
              ),

            ],
          ),
        ),
        // Button(),
        // Positioned(
        //   bottom: 10,
        //   child: Container(child: progressbar(),),
        // ),
        Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/1.2),
          // bottom: 100,
          // bottom: 100,
          // bottom: MediaQuery.of(context).size.width/3,
          child: Container(child: progressbar(),),
        ),
      ],
    );
  }

  progressbar(){
    return VideoProgressIndicator(
      _videoPlayerController,
      padding: EdgeInsets.all(2.0),
      // padding: EdgeInsets.only(top: MediaQuery.of(context).size.width/3),
      allowScrubbing: true,
      // padding: EdgeInsets.only(top: MediaQuery.of(context).size.width/2),
      colors: VideoProgressColors(
          backgroundColor: Colors.green,
          bufferedColor: Colors.yellow,
          playedColor: Colors.purple
      ),
    );
  }
}