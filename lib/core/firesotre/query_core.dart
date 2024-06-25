//フォロワー数が多い順に取得される


import 'package:caraqueprod/core/firesotre/col_ref_core.dart';
import 'package:caraqueprod/typedefs/firestore_typedefs.dart';

class QueryCore{
  static MapQuery publicUsersOrderByFollowerCount() => ColRefCore.publicUsersColRef().orderBy("followerCount",descending: true);
}