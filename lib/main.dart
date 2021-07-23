import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:service_man/core/global/bloc/global_event.dart';
import 'package:service_man/core/global/provider/global_provider.dart';
import 'package:service_man/helpers/di/service_locator.dart';
import 'package:service_man/pages/details/details_screen.dart';
import 'package:service_man/pages/home/home_screen.dart';
import 'package:service_man/pages/splash/splash_screen.dart';

import 'core/global/bloc/global_bloc.dart';
import 'pages/auth/login_screen.dart';

void main() {
  setUpLocator();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]);
  runApp(
      ChangeNotifierProvider<GlobalProvider>(
        create: (context) => GlobalProvider(),
        child: BlocProvider<GlobalBloc>(
          create: (context) =>
          GlobalBloc(context)
            ..add(CheckStatus()),
          child: ServiceManApp(),
        ),
      ));
}

class ServiceManApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.light,
      child: ScreenUtilInit(
        designSize: Size(375, 812),
        builder: () =>
            MaterialApp(
              title: 'Flutter Demo',
              initialRoute: '/',
              onGenerateRoute: _getRoutes,
              theme: ThemeData(
                // This is the theme of your application.
                //
                // Try running your application with "flutter run". You'll see the
                // application has a blue toolbar. Then, without quitting the app, try
                // changing the primarySwatch below to Colors.green and then invoke
                // "hot reload" (press "r" in the console where you ran "flutter run",
                // or simply save your changes to "hot reload" in a Flutter IDE).
                // Notice that the counter didn't reset back to zero; the application
                // is not restarted.
                primarySwatch: Colors.blue,
              ),
            ),
      ),
    );
  }
}

Route<dynamic> _getRoutes(RouteSettings settings) {
  Widget builder = Container();
  bool fullScreenDialog = false;
  switch (settings.name) {
    case '/':
      builder = Scaffold(
        primary: false,
        resizeToAvoidBottomInset: false,
        body: NavigationPage(),
      );
      fullScreenDialog = false;
      break;

    default:
      throw Exception('ServiceManApp: Invalid route: ${settings.name}');
      break;
  }

  return MaterialPageRoute(
      builder: (_) => builder,
      fullscreenDialog: fullScreenDialog,
      settings: settings
  );
}

class NavigationPage extends StatefulWidget {
  static final GlobalKey<NavigatorState> navKey = GlobalKey<
      NavigatorState>();

  @override
  NavigationPageState createState() => NavigationPageState();
}

class NavigationPageState extends State<NavigationPage>
    with WidgetsBindingObserver {

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<GlobalBloc, GlobalState>(
      listener: (context, state) {
        if (state is NotSignedIn) {
          // navigate to login page
          NavigationPage.navKey.currentState.pushNamedAndRemoveUntil('navigation/login', (route) => false);
        }

        if (state is SignedIn) {
          // navigate to home page
          NavigationPage.navKey.currentState.pushNamedAndRemoveUntil('navigation/home', (route) => false);
        }

      },
      child: WillPopScope(
        onWillPop: () async {
          return !await NavigationPage.navKey.currentState.maybePop();
        },
        child: Navigator(
          key: NavigationPage.navKey,
          initialRoute: 'navigation',
          onGenerateRoute: _myRoutes,
        ),
      ),
    );
  }

  Route _myRoutes(RouteSettings settings) {
    Widget builder = Container();
    bool fullScreenDialog = false;
    switch (settings.name) {
      case 'navigation':
        builder = _Splash();
        break;

      case 'navigation/login':
        builder = LoginScreen();
        break;

      case 'navigation/home':
        builder = HomeScreen();
        break;

      case 'navigator/details':
        builder = DetailScreen();
        break;

      default:
        throw Exception('ServiceManApp: Invalid route: ${settings.name}');
        break;
    }

    return MaterialPageRoute(
        builder: (_) => builder,
        fullscreenDialog: fullScreenDialog,
        settings: settings
    );
  }

}

class _Splash extends StatefulWidget {
  @override
  __SplashState createState() => __SplashState();
}

class __SplashState extends State<_Splash> {

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreen();
  }
}




