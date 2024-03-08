import 'package:car_sale_firebase/model/car_model.dart';
import 'package:flutter/material.dart';

class CarProvider extends ChangeNotifier {
  TextEditingController carNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController showRoomPlaceController = TextEditingController();

  TextEditingController searchController = TextEditingController();
  List<CarModel> searchedList = [];
  List<CarModel> allCarList = [];

  // void search(String value) {
  //   if (value.isEmpty) {
  //     searchedList = [];
  //   } else {
  //     searchedList = allCarList
  //         .where((CarModel car) =>
  //             car.title!.toLowerCase().contains(value.toLowerCase()))
  //         .toList();
  //   }
  //   notifyListeners();
  // }
}
