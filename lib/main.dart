import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nike_app_vendors/app/core/functions/simple_bloc_observer.dart';
import 'package:nike_app_vendors/app/core/tools/reg_imp.dart';
import 'Nike_Vendors_App.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = SimpleBlocObserver();
  runApp(const NikeStoreApp());
}
