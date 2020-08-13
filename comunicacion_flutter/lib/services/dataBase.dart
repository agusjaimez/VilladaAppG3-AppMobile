import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference userData =
      Firestore.instance.collection('dataUser');

  Future updatUserData(String nombre, String apellido) async {
    return await userData
        .document(uid)
        .setData({'nombre': nombre, 'apellidd': apellido});
  }
}
