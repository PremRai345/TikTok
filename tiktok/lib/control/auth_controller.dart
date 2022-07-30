import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_storage/firebase_storage.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok/model/user.dart';

class AuthControler extends GetxController {
  File? proimg;

  pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final img = File(image.path);
    this.proimg = img;
  }

  // For user register

  void SignUp(
      String username, String email, String password, File? image) async {
    try {
      if (username.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          image != null) {
        UserCredential credential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        String downloadUrl = await _uploadProPic(image);

        myUser user = myUser(
            name: username,
            profilePhoto: downloadUrl,
            email: email,
            uid: credential.user!.uid);

        await FirebaseFirestore.instance
            .collection('users')
            .doc(credential.user!.uid)
            .set(user.toJson());
      } else {
        Get.snackbar("Error in creating account",
            "Please enter all the required fields");
      }
    } catch (e) {
      print(e);
      Get.snackbar("Error is Occured", e.toString());
    }
  }

  Future<String> _uploadProPic(File image) async {
    Reference ref = FirebaseStorage.instance
        .ref()
        .child("profile pics")
        .child(FirebaseAuth.instance.currentUser!.uid);

    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot snapshot = await uploadTask;
    String imageDwonloadUrl = await snapshot.ref.getDownloadURL();
    return imageDwonloadUrl;
  }
}
