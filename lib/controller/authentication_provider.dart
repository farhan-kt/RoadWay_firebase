import 'package:car_sale_firebase/service/authentication_service.dart';
import 'package:car_sale_firebase/view/admin/admin_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthenticationProvider extends ChangeNotifier {
  TextEditingController adminController = TextEditingController();
  TextEditingController adminPassController = TextEditingController();
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController registerEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  TextEditingController registerPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool obscureText = true;
  bool isLoading = false;
  final loginFormkey = GlobalKey<FormState>();
  final registerFormkey = GlobalKey<FormState>();
  final adminFormkey = GlobalKey<FormState>();
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

  void clearAdminController() {
    adminController.clear();
    adminPassController.clear();
  }

  void clearLoginControllers() {
    loginEmailController.clear();
    loginPasswordController.clear();
  }

  void clearRegisterControllers() {
    registerEmailController.clear();
    registerPasswordController.clear();
    confirmPasswordController.clear();
  }

  Future<UserCredential> registerUser(String email, String password) async {
    return await authService.userEmailRegister(email, password);
  }

  Future<UserCredential> loginUser(String email, String password) async {
    return await authService.userEmailLogin(email, password);
  }

  Future<void> logOut() async {
    await authService.logOut();
  }

  Future<void> googleSignIn() async {
    await authService.googleSignIn();
    notifyListeners();
  }

  Future<void> googleSignOut() async {
    await authService.googleSignOut();
    notifyListeners();
  }

  gitHubSignIn() async {
    try {
      await authService.gitHubSignIn();
    } catch (e) {
      throw Exception('Exception $e');
    }
    notifyListeners();
  }

  void obscureChange() {
    obscureText = !obscureText;
    notifyListeners();
  }
}
