//doc_ref_coreで使用
import 'package:caraqueprod/typedefs/firestore_typedefs.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class ColRefCore{
  static ColRef publicUsersColRef() => FirebaseFirestore.instance.collection('public_users'); 
}