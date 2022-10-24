import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced/pages/database_page.dart';
import 'package:flutter_advanced/pages/home_page.dart';
import 'package:flutter_advanced/pages/main_page.dart';
import 'package:flutter_advanced/pages/network_page.dart';
import 'package:flutter_advanced/pages/signin_page.dart';
import 'package:flutter_advanced/pages/signup_page.dart';
import 'package:flutter_advanced/pages/splash_page.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await Firebase.initializeApp();

  await Hive.initFlutter();
  await Hive.openBox('pdp_online');
  await GetStorage.init();

  runApp(
    EasyLocalization(
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('ru', 'RU'),
          Locale('uz', 'UZ')
        ],
        path: 'assets/translations', // <-- change patch to your
        fallbackLocale: const Locale('en', 'US'),
        child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashPage(),
      routes: {
        DatabasePage.id: (context) => const DatabasePage(),
        NetworkPage.id: (context) => const NetworkPage(),
        SplashPage.id: (context) => const SplashPage(),
        SignInPage.id: (context) => const SignInPage(),
        SignUpPage.id: (context) => const SignUpPage(),
        MainPage.id: (context) => const MainPage(),
      },
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
