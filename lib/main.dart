import 'package:car_sale_firebase/controller/authentication_provider.dart';
import 'package:car_sale_firebase/controller/bottombar_provider.dart';
import 'package:car_sale_firebase/controller/car_provider.dart';
import 'package:car_sale_firebase/firebase_options.dart';
import 'package:car_sale_firebase/view/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BottomProvider()),
        ChangeNotifierProvider(create: (context) => CarProvider()),
        ChangeNotifierProvider(create: (context) => AuthenticationProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: WelcomeScreen(),
        // home: BottomScreen(),
      ),
    );
  }
}
