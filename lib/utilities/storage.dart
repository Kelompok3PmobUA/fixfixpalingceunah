// import 'dart:typed_data';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:uuid/uuid.dart';
// import './postSocial.dart/post.dart';

// belom dipake perlu connect firestore

// class storageMethod {
//   final FirebaseStorage _storage = FirebaseStorage.instance;
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   Future<String> uploadImageToStorage(
//       String childName, Uint8List file, bool isPost) async {
//     Reference ref =
//         _storage.ref().child(childName).child(_auth.currentUser!.uid);

//     if (isPost) {
//       String id = const Uuid().v1();
//       ref = ref.child(id);

//       UploadTask uploadTask = ref.putData(file);

//       TaskSnapshot snap = await uploadTask;
//       String downloadUrl = await snap.ref.getDownloadURL();
//       return downloadUrl;
//     }
//   }
// }

// class FirestoreMethod {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   Future<String> uploadPost(String description, Uint8List file, String uid,
//       String username, String profImage) async {
//     String res = "Some error happened";

//     try {
//       String photoUrl =
//           await storageMethod().uploadImageToStorage('post', file, true);

//       String postId = const Uuid().v1();

//       Post post = Post(
//         description: description,
//         uid: uid,
//         username: username,
//         postId: postId,
//         datePublished: DateTime.now(),
//         postUrl: photoUrl,
//         profImage: profImage,
//         likes: [],
//       );

//       _firestore.collection('posts').doc(postId).set(post.toJson());
//       res = "Success";
//     } catch (err) {
//       res = err.toString();
//     }
//   }
// }
