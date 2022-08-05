import 'dart:js';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok/constant.dart';

class addVideoScreen extends StatelessWidget {
  addVideoScreen({Key? key}) : super(key: key);

  videoPick(ImageSource src) async {
    final video = await ImagePicker().pickVideo(source: src);
    if (video != null) {
      Get.snackbar("Video Selected", video.path);
    }else{
      Get.snackbar("Error in selecting video", "Please Select Video");
    }
  }

  showDialogOpt(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        children: [
          SimpleDialogOption(
            child: const Text("Gallery"),
            onPressed: () =>videoPick(ImageSource.gallery),
          ),
          SimpleDialogOption(
            onPressed: () =>videoPick(ImageSource.camera),
            child: const Text("Camera"),
          ),
          SimpleDialogOption(
            onPressed: () {},
            child: const Text("Close"),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () => showDialogOpt(context),
          child: Container(
            width: 190,
            height: 50,
            decoration: BoxDecoration(color: buttonColor),
            child: Center(
              child: Text(
                "Add Video",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
