import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:service_man/core/global/bloc/global_event.dart';
import 'package:service_man/core/global/provider/global_provider.dart';
import 'package:service_man/helpers/assets/routes.dart';
import 'package:service_man/helpers/assets/strings.dart';
import 'package:service_man/helpers/di/service_locator.dart';
import 'package:service_man/pages/bill/category_screen.dart';
import 'package:service_man/pages/bill/equipment_screen.dart';
import 'package:service_man/pages/bill/parts_screen.dart';
import 'package:service_man/pages/bill/preview_screen.dart';
import 'package:service_man/pages/bill/servicing_screen.dart';
import 'package:service_man/pages/bill/success_screen.dart';
import 'package:service_man/pages/booking/details_screen.dart';
import 'package:service_man/pages/booking/summary_screen.dart';
import 'package:service_man/pages/home/home_screen.dart';
import 'package:service_man/pages/splash/splash_screen.dart';

import 'core/global/bloc/global_bloc.dart';
import 'main_bloc_observer.dart';
import 'pages/auth/login_screen.dart';

void main() {

  Bloc.observer = MainBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  setUpLocator();
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
              debugShowCheckedModeBanner: false,
              title: 'Service Man',
              initialRoute: '/',
              onGenerateRoute: _getRoutes,
              theme: ThemeData(
                fontFamily: AppStrings.fontFamily,
                textTheme: TextTheme(
                ),
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
          NavigationPage.navKey.currentState.pushNamedAndRemoveUntil(AppRoutes.toLoginScreen, (route) => false);
        }

        if (state is SignedIn) {
          // navigate to home page
          NavigationPage.navKey.currentState.pushNamedAndRemoveUntil(AppRoutes.toHomeScreen, (route) => false);
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

      case AppRoutes.toLoginScreen:
        builder = LoginScreen();
        break;

      case AppRoutes.toHomeScreen:
        builder = HomeScreen();
        break;

      case AppRoutes.toDetailScreen:
        DetailScreenArgument args = settings.arguments;
        builder = DetailScreen(getBookingResponse: args.getBookingResponse);
        break;

      case AppRoutes.toSummaryScreen:
        builder = SummaryScreen();
        break;

      case AppRoutes.toEquipmentScreen:
        EquipmentScreenArgument args = settings.arguments;
        builder = EquipmentScreen(service: args.service);
        break;

      case AppRoutes.toBillCategoryScreen:
        CategoryScreenArguments args = settings.arguments;
        builder = CategoryScreen(equipment: args.equipment);
        break;

      case AppRoutes.toBillPartsScreen:
        PartsScreenArguments args = settings.arguments;
        builder = PartsScreen(equipment: args.equipment);
        break;

      case AppRoutes.toBillServiceScreen:
        ServiceScreenArguments args = settings.arguments;
        builder = ServicingScreen(equipment: args.equipment);
        break;

      case AppRoutes.toBillPreviewScreen:
        PreviewScreenArguments args = settings.arguments;
        print(args.serviceName);
        builder = PreviewScreen(equipment: args.equipments, serviceName: args.serviceName);
        break;

      case AppRoutes.toBillSuccessScreen:
        builder = SuccessScreen();
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




