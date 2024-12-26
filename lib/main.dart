import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/bloc/character_bloc.dart';
import 'package:presentation/constants/app_colors.dart';
import 'package:presentation/screens/character_screen.dart';
import 'package:rick_and_morty/core/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDI();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: AppColors.mainBackground,
      ),
      home: BlocProvider(
        create: (context) => sl<CharacterBloc>(),
        child: const CharacterScreen(),
      ),
    );
  }
}
