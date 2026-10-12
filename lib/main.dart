import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shoply_app/core/local/local_storage.dart';
import 'package:shoply_app/features/app/view/shoply_app.dart';
import 'package:shoply_app/firebase_options.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Supabase.initialize(
    url: dotenv.env['supabase_url']!,
    publishableKey: dotenv.env['supabass_key']!,
  );
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await LocalStorages.instance.initSharedPreferences();

  runApp(const ShoplyApp());
}
