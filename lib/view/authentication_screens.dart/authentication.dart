import 'package:car_sale_firebase/view/select_login.dart';
import 'package:car_sale_firebase/widget/bottom_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthenticationNavigate extends StatelessWidget {
  const AuthenticationNavigate({super.key});

  @override
  Widget build(BuildContext context) {
    User? currentUser = FirebaseAuth.instance.currentUser;
    return Scaffold(
      body: currentUser != null ? BottomScreen() : const SelectLoginScreen(),
    );
  }
}
