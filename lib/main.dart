import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:forex/common/helpers/appsflyer_helper.dart';
import 'package:forex/firebase_options.dart';

import 'presentation/application.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  AppsFlyerHelper.initialize(
    'AzWnsWyCCMm62pvuGGMPaB',
    '',
    true,
  );

  runApp(const Application());
}
