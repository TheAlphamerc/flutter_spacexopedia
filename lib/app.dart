import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spacexopedia/bloc/launches/bloc.dart';
import 'package:flutter_spacexopedia/bloc/navigation/navigation_bloc.dart';
import 'package:flutter_spacexopedia/resources/repository/launch_repository.dart';
import 'package:flutter_spacexopedia/ui/theme/custom_theme.dart';
import 'package:get_it/get_it.dart';

class SpaceApp extends StatefulWidget {
  final Widget home;

  const SpaceApp({
    Key key,
    @required this.home,
  }) : super(key: key);

  static void setLocale(BuildContext context, Locale newLocale) {
    _AppState state = context.findAncestorStateOfType<_AppState>();
    state.setLocale(newLocale);
  }

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<SpaceApp> {
  // final _key = ErrorHandlerKey();
  final _navigatorKey = GlobalKey<NavigatorState>();
  // final _bloc = ErrorsBloc();

  @override
  void initState() {
    super.initState();

    // GetIt.instance<ErrorsProducer>().registerErrorHandler(
    // _key,
    // (error, stackTrace) {
    //   log(error, stackTrace:stackTrace,name: "KirajApp");
    // _bloc.add(OnError(error, stackTrace));
    // _navigatorKey.currentState.push(ErrorPageRoute());
    //   return false;
    // },
    // );
  }

  @override
  void dispose() {
    // GetIt.instance<ErrorsProducer>().unregisterErrorHandler(_key);
    // _bloc.close();
    super.dispose();
  }

  Locale _locale;
  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    // getLocale().then((locale) {
    //   setState(() {
    //     this._locale = locale;
    //   });
    // });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   statusBarColor: Colors.transparent, //top bar color
    //   statusBarIconBrightness: Brightness.dark, //top bar icons
    // ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: _navigatorKey,
      onGenerateTitle: (BuildContext context) => "",
      locale: _locale,
      supportedLocales: [
        const Locale('en'),
        const Locale('ar'),
      ],
      theme: CustomTheme.of(context),
      // home: widget.home,
      home: MultiBlocProvider(
        providers: [
          BlocProvider<NavigationBloc>(
            create: (BuildContext context) => NavigationBloc(),
          ),
          BlocProvider<LaunchBloc>(
            create: (BuildContext context) =>
                LaunchBloc(GetIt.instance<LaunchRepository>())
                  ..add(LaunchInitial()),
          ),
        ],
        child: widget.home,
      ),
    );
  }
}
