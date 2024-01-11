import 'package:flutter/material.dart';
import 'database.dart';
import 'home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Database.instance.inItHive();
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

