import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/di.dart';
import 'package:presentation/app/app_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDI();
  runApp(const App());
}
