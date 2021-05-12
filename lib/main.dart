import 'package:flutter/material.dart';
import 'package:jijiapp/ui/App.dart';
import 'package:firebase_core/firebase_core.dart';
import 'app/locator.dart';

void main() async {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
