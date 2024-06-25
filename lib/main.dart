import 'dart:async';
import 'package:caraqueprod/flavors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'app.dart';

import 'package:caraqueprod/gen/firebase_options_dev.dart' as dev;
import 'package:caraqueprod/gen/firebase_options_prod.dart' as prod;

FutureOr<void> main() async {
  final flavor = F.appFlavor!;
  final options = (flavor == Flavor.dev) ? dev.DefaultFirebaseOptions.currentPlatform : prod.DefaultFirebaseOptions.currentPlatform;
  WidgetsFlutterBinding.ensureInitialized();//frebaseの初期化
  await Firebase.initializeApp(options: options);

  runApp(const App());
}