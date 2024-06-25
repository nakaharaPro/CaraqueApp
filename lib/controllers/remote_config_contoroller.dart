//firebaseのremote_config(メンテナンスモードの設定)
import 'package:caraqueprod/constant/remote_config_constant.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:get/get.dart';


class RemoteConfigController extends GetxController {
  final rxIsMaintenenanceMode = false.obs;

  @override
  void onInit() async {
    final remoteConfig = FirebaseRemoteConfig.instance;
    //オブジェクトを取得

    final remoteConfigSettings = RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1), //リモート設定のフェッチ操作がタイムアウトするまでの時間を指定
      minimumFetchInterval:const Duration(seconds: 15), //15秒間隔でremoteConfigの値を見る？
    );

   //Remote Configの設定を適用
    await remoteConfig.setConfigSettings(remoteConfigSettings);

    const key = RemoteConfigConstant.maintenanceModeKey; //定数(maintenance_mode)

    //デフィオルトの設定　　
    await remoteConfig.setDefaults({
      key: false, //firebaseのmaintenance_modeの初期値はfalse
    });

   //リモート設定をフェッチしてアクティブにする
    await remoteConfig.fetchAndActivate();

//15秒間隔でfirebaseのremoteconfigを観測し、値を取ってくる
    rxIsMaintenenanceMode.value = remoteConfig.getBool(key);

    super.onInit();
  }
}
