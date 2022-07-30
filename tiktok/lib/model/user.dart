import 'package:cloud_firestore/cloud_firestore.dart';

class myUser {
  String name;
  String profilePhoto;
  String email;
  String uid;

  myUser(
      {
      required this.name,
      required this.profilePhoto,
      required this.email,
      required this.uid});


//App to Firebase
      Map<String, dynamic> toJson() =>{
      
          'name': name,
          'profilePhoto': profilePhoto,
          'email': email,
          'uid': uid
        };
      //Firebase(Map) to App(User)
      static myUser fromSnap(DocumentSnapshot snap){
        var snapshot =snap.data() as Map<String, dynamic>;
        return myUser(
          name: snapshot['name'],
          profilePhoto: snapshot['profilePhoto'],
          email: snapshot['email'],
          uid: snapshot['uid'],
        );
      }
        
}
