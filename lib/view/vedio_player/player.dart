import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';



/// Stateful widget to fetch and then display video content.
class VideoApp extends StatefulWidget {
  String videoFile;
 bool isPreview ;

   VideoApp({super.key, required this.videoFile,required this.isPreview });

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;
  File? galleryFile;
  final picker = ImagePicker();

  Future getVideo(ImageSource img,) async {
    final pickedFile = await picker.pickVideo(
        source: img,
        preferredCameraDevice: CameraDevice.front,
        maxDuration: const Duration(minutes: 10));
    XFile? xfilePick = pickedFile;

    print("xfilePick  ${xfilePick!.path.toString()}");
    setState(
          () {
        galleryFile = File(pickedFile!.path);
            },
    );
  }


  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(File(widget.videoFile))
      ..initialize().then((_) {

        setState(() {});
        _controller.play();
      });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:widget.isPreview == true?null: AppBar(),
      body:

      Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
          aspectRatio:widget.isPreview ==true?1/1.2: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        )
            : Container(),
      ),
      floatingActionButton:widget.isPreview ==true?null: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}