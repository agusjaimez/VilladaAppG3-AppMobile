import 'package:comunicacion/utils/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:convert' show utf8;
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'dart:io';
import 'package:http/http.dart' as http;

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFromFirebase(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebase);
  }

  Future registerEmailPassword(
      String email, String password, String name) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      FirebaseUser _firebaseuser = result.user;
      UserUpdateInfo userInfo = UserUpdateInfo();
      userInfo.displayName = name;
      await _firebaseuser.updateProfile(userInfo);
      await _firebaseuser.reload();

      return _firebaseuser.uid;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signInEmailPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}

// ignore: non_constant_identifier_names
Upload(uploadURL, File imageFile) async {
  var stream =
      // ignore: deprecated_member_use
      new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
  var length = await imageFile.length();

  var uri = Uri.parse(uploadURL);

  var request = new http.MultipartRequest("POST", uri);
  var multipartFile = new http.MultipartFile('file', stream, length,
      filename: basename(imageFile.path));
  //contentType: new MediaType('image', 'png'));

  request.files.add(multipartFile);
  var response = await request.send();
  print(response.statusCode);
  response.stream.transform(utf8.decoder).listen((value) {
    print(value);
  });
}
