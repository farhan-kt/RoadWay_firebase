import 'package:car_sale_firebase/view/admin_data.dart';
import 'package:flutter/material.dart';

class AuthenticationProvider extends ChangeNotifier {
  TextEditingController adminController = TextEditingController();
  TextEditingController adminPassController = TextEditingController();

  void adminLogin(context) {
    if (adminController.text == 'farhan' && adminPassController.text == '123') {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => AdminAddDataScreen()));
      adminController.clear();
      adminPassController.clear();
    }
  }
}
