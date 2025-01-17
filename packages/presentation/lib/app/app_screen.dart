import 'package:flutter/material.dart';
import 'package:presentation/app/app_bloc.dart';
import 'package:presentation/app/app_tile.dart';
import 'package:presentation/bloc/bloc_screen.dart';
import 'package:presentation/bloc/bloc_tile.dart';
import 'package:presentation/constants/app_colors.dart';

final globalRootNavKey = GlobalKey<NavigatorState>();

class App extends BlocScreen {
  const App({super.key});

  @override
  _AppState createState() => _AppState();
}

class _AppState extends BlocScreenState<App, AppBloc> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      key: globalRootNavKey,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: AppColors.mainBackground,
      ),
      home: StreamBuilder<BlocTile>(
          stream: bloc.dataStream,
          builder: (context, snapshot) {
            final data = snapshot.data?.data;
            return data is AppTile
                ? _AppScreenContent(
                    bloc: bloc,
                    tile: data,
                    navigatorKey: _navigatorKey,
                  )
                : SizedBox();
          }),
    );
  }
}

class _AppScreenContent extends StatelessWidget {
  const _AppScreenContent({
    required this.bloc,
    required this.tile,
    required this.navigatorKey,
  });

  final AppBloc bloc;
  final AppTile tile;
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        key: navigatorKey,
        pages: tile.pages.toList(),
        onPopPage: (route, result) {
          tile.pages.remove(route.settings);
          return route.didPop(result);
        },
      ),
    );
  }
}
