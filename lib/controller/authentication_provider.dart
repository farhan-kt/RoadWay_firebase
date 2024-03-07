import 'package:car_sale_firebase/service/authentication_service.dart';
import 'package:car_sale_firebase/view/admin/admin_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthenticationProvider extends ChangeNotifier {
  TextEditingController adminController = TextEditingController();
  TextEditingController adminPassController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final loginFormkey = GlobalKey<FormState>();
  final RegisterFormkey = GlobalKey<FormState>();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final AuthenticationService authService = AuthenticationService();

  void adminLogin(context) {
    if (adminController.text == 'farhan' && adminPassController.text == '123') {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => AdminAddDataScreen()));
      adminController.clear();
      adminPassController.clear();
    }
  }

  void clearControllers() {
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
  }

  Future<UserCredential> registerUser(String email, String password) async {
    return await authService.userRegisterEmail(email, password);
  }

  Future<UserCredential> loginUser(String email, String password) async {
    return await authService.userLoginEmail(email, password);
  }

  Future<void> logOut() async {
    await authService.logOut();
  }
}
