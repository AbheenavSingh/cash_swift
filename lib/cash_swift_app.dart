import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:cash_swift/modules/barcode_scanner/barcode_scanner_page.dart';
import 'package:cash_swift/modules/home/home_page.dart';
import 'package:cash_swift/modules/insert_upi/insert_upi_page.dart';
import 'package:cash_swift/modules/login/login_page.dart';
import 'package:cash_swift/modules/splash/splash_page.dart';
import 'package:cash_swift/shared/models/user_model.dart';
import 'package:cash_swift/shared/themes/app_colors.dart';

class PayFlowApp extends StatelessWidget {
  const PayFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: AppColors.primary),
    );

    return MaterialApp(
      title: 'PayFlow',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        primaryColor: AppColors.primary,
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashPage(),
        '/home': (context) => HomePage(
              user: ModalRoute.of(context)?.settings.arguments as UserModel,
            ),
        '/login': (context) => const LoginPage(),
        '/barcode_scanner': (context) => const BarcodeScannerPage(),
        '/insert_upi': (context) => InsertUpiPage(
              barcode: ModalRoute.of(context)?.settings.arguments.toString() ??
                  '123456',
            ),
      },
    );
  }
}
