import 'dart:async';
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ventigo/firebase_options.dart';
import 'app/app_services/local_storage_service.dart';
import 'app/routes/app_pages.dart';
import 'app_bindings.dart';
import 'config/app_theme.dart';
import 'generated/l10n.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await MySharedPref.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await MySharedPref.init();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final AppLifecycleListener _listener;
  Timer? _logoutTimer;
  final int _timeoutDuration = 30; // Timeout duration in seconds

  @override
  void initState() {
    super.initState();

    // Initialize the AppLifecycleListener class and pass callbacks
    _listener = AppLifecycleListener(onStateChange: _onStateChanged);
  }

  // @override
  // void didChangeAppLifecycleState(AppLifecycleState state) {
  //   if (state == AppLifecycleState.paused) {
  //     _startLogoutTimer();
  //   } else if (state == AppLifecycleState.resumed) {
  //     _cancelLogoutTimer();
  //   }
  // }

  void _startLogoutTimer() {
    _logoutTimer?.cancel();
    _logoutTimer = Timer(Duration(seconds: _timeoutDuration),
        () => Get.offAllNamed(Routes.LOGIN));
  }

  void _cancelLogoutTimer() {
    _logoutTimer?.cancel();
  }

  @override
  void dispose() {
    _listener.dispose();
    _logoutTimer?.cancel();
    super.dispose();
  }

  void _onStateChanged(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.detached:
        _onDetached();
      case AppLifecycleState.resumed:
        _onResumed();
      case AppLifecycleState.inactive:
        _onInactive();
      case AppLifecycleState.hidden:
        _onHidden();
      case AppLifecycleState.paused:
        _onPaused();
    }
  }

  void _onDetached() => log('detached');

  void _onResumed() => _cancelLogoutTimer();

  void _onInactive() => log('inactive');

  void _onHidden() => log('hidden');

  void _onPaused() => _startLogoutTimer();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        MySharedPref.getLanguage();

        return GetMaterialApp(
          title: 'Ventigo',
          theme: AppTheme().appThemeDate,
          initialBinding: AppBindings(),
          debugShowCheckedModeBanner: false,
          getPages: AppPages.routes,
          initialRoute: AppPages.INITIAL,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          locale: Locale(MySharedPref.getLanguage()),
          localeResolutionCallback: (deviceLocale, supportedLocales) {
            for (var locale in supportedLocales) {
              if (locale.languageCode == deviceLocale!.languageCode &&
                  locale.countryCode == deviceLocale.countryCode) {
                return deviceLocale;
              }
            }
            return supportedLocales.first;
          },
        );
      },
    );
  }
}
