import 'dart:io';
import 'package:flutter/material.dart';
import 'package:tiktok/constant.dart';
import 'package:tiktok/view/widgets/text_input.dart';
import 'package:video_player/video_player.dart';

class addCaption extends StatefulWidget {
  File videoFile;
  String videoPath;
  addCaption({Key? key, required this.videoFile, required this.videoPath})
      : super(key: key);

  @override
  State<addCaption> createState() => _addCaptionState();
}

class _addCaptionState extends State<addCaption> {
  late VideoPlayerController videoPlayerController;
  TextEditingController songNameController = new TextEditingController();
  TextEditingController captionController = new TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      videoPlayerController = VideoPlayerController.file(widget.videoFile);
    });
    videoPlayerController.initialize();
    videoPlayerController.play();
    videoPlayerController.setVolume(0.7);
    videoPlayerController.setLooping(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 1.4,
              width: MediaQuery.of(context).size.width,
              child: VideoPlayer(videoPlayerController),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextInputField(
                      controller: songNameController,
                      myIcon: Icons.music_note_sharp,
                      myLabelText: "Song Name"),
                  const SizedBox(
                    height: 20,
                  ),
                  TextInputField(
                      controller: captionController,
                      myIcon: Icons.closed_caption,
                      myLabelText: "Caption"),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      child: Text("Upload"),
                      style: ElevatedButton.styleFrom(primary: buttonColor),
                      ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
