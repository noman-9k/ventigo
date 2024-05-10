import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ventigo/firebase_options.dart';
import 'app/routes/app_pages.dart';
import 'app_bindings.dart';
import 'config/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await MySharedPref.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Ventigo',
          theme: AppTheme().appThemeDate,
          initialBinding: AppBindings(),
          debugShowCheckedModeBanner: false,
          getPages: AppPages.routes,
          initialRoute: AppPages.INITIAL,
        );
      },
    );
  }
}
