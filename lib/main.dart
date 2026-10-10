import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shoply_app/core/local/local_storage.dart';
import 'package:shoply_app/features/app/view/shoply_app.dart';
import 'package:shoply_app/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await LocalStorage.instance.initSharedPreferences();
  runApp(const ShoplyApp());
}
