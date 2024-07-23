//doc_ref_coreで使用
import 'package:caraqueprod/typedefs/firestore_typedefs.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class ColRefCore{
  static ColRef publicUsersColRef(String mail) => FirebaseFirestore.instance.collection(mail); //public_user
}