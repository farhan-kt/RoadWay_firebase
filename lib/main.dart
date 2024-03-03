import 'package:car_sale_firebase/controller/bottombar_provider.dart';
import 'package:car_sale_firebase/view/admin_data.dart';
import 'package:car_sale_firebase/view/admin_login.dart';
import 'package:car_sale_firebase/view/welcome_screen.dart';
import 'package:car_sale_firebase/widget/bottom_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BottomProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: WelcomeScreen(),
        home: BottomScreen(),
      ),
    );
  }
}
