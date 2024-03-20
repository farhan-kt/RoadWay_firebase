import 'dart:io';
import 'dart:developer';
import 'package:car_sale_firebase/model/car_model.dart';
import 'package:car_sale_firebase/service/car_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class CarProvider extends ChangeNotifier {
  File? pickedImage;
  String imageName = DateTime.now().microsecondsSinceEpoch.toString();
  String? downloadUrl;
  bool isLoading = false;

  final carDataFormKey = GlobalKey<FormState>();

  CarService carService = CarService();
  final ImagePicker imagePicker = ImagePicker();
  final FirebaseStorage storage = FirebaseStorage.instance;
  TextEditingController carNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController kmController = TextEditingController();
  TextEditingController searchController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  List<CarModel> searchList = [];
  List<CarModel> allCarList = [];

  Future<void> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      dateController.text = DateFormat('dd-MM-yyyy').format(pickedDate);
    }
    notifyListeners();
  }

  void clearCarControllers() {
    carNameController.clear();
    kmController.clear();
    descriptionController.clear();
    priceController.clear();
    pickedImage = null;
  }

  void addCar(CarModel data) async {
    await carService.addCar(data);
    getAllCar();
  }

  void deleteCar(String id) async {
    await carService.deleteCar(id);
    getAllCar();
  }

  void getAllCar() async {
    isLoading = true;

    allCarList = await carService.getAllCars();
    isLoading = false;
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

  void search(String value) {
    if (value.isEmpty) {
      searchList = [];
    } else {
      searchList = allCarList
          .where((CarModel car) =>
              car.carName!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

  Future<void> wishlistClicked(String id, bool status) async {
    await carService.wishListClicked(id, status);
    notifyListeners();
  }

  bool wishListCheck(CarModel product) {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      final user = currentUser.email ?? currentUser.phoneNumber;
      if (product.wishList.contains(user)) {
        getAllCar();
        return false;
      } else {
        getAllCar();
        return true;
      }
    } else {
      return true;
    }
  }
}
