import 'package:flutter/material.dart';
import 'package:presentation/app/bloc/app_bloc.dart';
import 'package:presentation/app/bloc/app_data.dart';
import 'package:presentation/base/bloc/bloc_data.dart';
import 'package:presentation/base/bloc/bloc_state.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends BlocState<App, AppBloc> {
  @override
  void initState() {
    super.initState();
    bloc.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Laba App',
      navigatorKey: bloc.globalRootNavKey,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _home(),
    );
  }

  StreamBuilder _home() => StreamBuilder<BlocData>(
        stream: bloc.dataStream,
        builder: (context, result) {
          final blocData = result.data;
          final appData = blocData?.data;
          if (appData is AppData) {
            return _content(context, blocData, appData);
          } else {
            return Container();
          }
        },
      );

  Navigator _content(
    BuildContext context,
    BlocData? blocData,
    AppData appData,
  ) =>
      Navigator(
        key: bloc.navigatorKey,
        onPopPage: (route, result) {
          bloc.handleRemoveRouteSettings(route.settings);
          return route.didPop(result);
        },
        pages: appData.pages.toList(),
      );
}
