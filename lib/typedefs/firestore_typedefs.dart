import 'package:cloud_firestore/cloud_firestore.dart';


typedef LSDMap = List<Map<String,dynamic>>;
typedef SDMap = Map<String, dynamic>;
typedef QSnapshot = QuerySnapshot<SDMap>; // QuerySnapshot<Map<String,dynamic>>
typedef MapQuery = Query<SDMap>; // Query<Map<String,dynamic>>
typedef QDoc = QueryDocumentSnapshot<SDMap>; // QueryDocumentSnapshot<Map<String,dynamic>>

 //ドキュメントの型
typedef Doc = DocumentSnapshot<SDMap>; // DocumentSnapshot<Map<String,dynamic>>
 

 //フィールドの型
typedef FutureQSnapshot= Future<QSnapshot>; // Future<QuerySnapshot<Map<String,dynamic>>>
typedef FutureDoc = Future<Doc>; // Future<DocumentSnapshot<Map<String,dynamic>>>
 //ドキュメントを指定する型
typedef DocRef= DocumentReference<SDMap>; // DocumentReference<Map<String,dynamic>>
//コレクションを指定する型
typedef ColRef = CollectionReference<SDMap>; // CollectionReference<Map<String,dynamic>>