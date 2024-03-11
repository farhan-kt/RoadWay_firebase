import 'dart:io';
import 'dart:developer';
import 'package:car_sale_firebase/model/car_model.dart';
import 'package:car_sale_firebase/service/car_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CarProvider extends ChangeNotifier {
  File? pickedImage;
  String imageName = DateTime.now().microsecondsSinceEpoch.toString();
  String? downloadUrl;

  CarService carService = CarService();
  final ImagePicker imagePicker = ImagePicker();
  final FirebaseStorage storage = FirebaseStorage.instance;
  TextEditingController carNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController searchController = TextEditingController();
  List<CarModel> searchList = [];
  List<CarModel> allCarList = [];

  void clearCarControllers() {
    carNameController.clear();
    descriptionController.clear();
    priceController.clear();
  }

  void addCar(CarModel data) async {
    await carService.addCar(data);
    getAllCar();
  }

  void getAllCar() async {
    allCarList = await carService.getAllCars();
    notifyListeners();
  }

  void search(String value) {
    searchList = allCarList
        .where((element) =>
            element.carName!.toLowerCase().contains(value.toLowerCase()))
        .toList();
    notifyListeners();
  }

  void uploadImage(image) async {
    try {
      if (image != null) {
        downloadUrl = await carService.uploadImage(imageName, image);
        notifyListeners();
        log(downloadUrl!);
      } else {
        log('image is null');
      }
    } catch (e) {
      log('got an error of $e');
      rethrow;
    }
    notifyListeners();
  }

  Future getImage(ImageSource source) async {
    final pickedFile = await imagePicker.pickImage(source: source);

    if (pickedFile != null) {
      pickedImage = File(pickedFile.path);
      log("Image picked");
      notifyListeners();
    }
  }
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

  Future<void> wishlistCliscked(String id, bool status) async {
    await carService.wishListClicked(id, status);
    notifyListeners();
  }

  bool wishlistCheck(CarModel car) {
    final currentUser = FirebaseAuth.instance.currentUser;
    final user = currentUser!.email ?? currentUser.phoneNumber;
    return !car.wishList.contains(user);
  }
}
