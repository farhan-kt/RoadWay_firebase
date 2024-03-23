// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'dart:io';
import 'package:car_sale_firebase/view/admin/widgets/admin_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:car_sale_firebase/model/car_model.dart';
import 'package:car_sale_firebase/controller/car_provider.dart';
import 'package:car_sale_firebase/widget/button_widget.dart';
import 'package:car_sale_firebase/widget/snackbar_widget.dart';
import 'package:car_sale_firebase/widget/textformfield_widget.dart';
import 'package:car_sale_firebase/widget/textstyle_widget.dart';

class AdminAddDataScreen extends StatelessWidget {
  const AdminAddDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final carProvider = Provider.of<CarProvider>(context, listen: false);
    const OutlineInputBorder inputBorderColor = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black),
    );
    return Scaffold(
      body: Consumer<CarProvider>(
        builder: (context, value, child) => carProvider.isAddingData
            ? addingCircularIndicator(context)
            : Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                child: Center(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Form(
                      key: carProvider.carDataFormKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          popButtonAndRoadWay(context),
                          textAbel(
                            name: 'M  O  T  O  R  S',
                            fontsize: 17,
                            fontweight: FontWeight.w800,
                          ),
                          const SizedBox(height: 30),
                          SizedBox(
                            height: size.height * .25,
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Column(
                                children: [
                                  Consumer<CarProvider>(
                                    builder: (context, value, child) =>
                                        GestureDetector(
                                      onTap: () {
                                        pickImage(context);
                                      },
                                      child: Container(
                                        height: size.height * .2,
                                        width: size.width * .9,
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10)),
                                          border: Border.all(
                                              color: Colors.black, width: 2),
                                          image: value.pickedImage != null
                                              ? DecorationImage(
                                                  image: FileImage(
                                                      value.pickedImage!),
                                                  fit: BoxFit.contain,
                                                )
                                              : const DecorationImage(
                                                  image: AssetImage(
                                                      'assets/image_add.png'),
                                                  fit: BoxFit.contain,
                                                ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * .55,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CustomTextFormField(
                                  labelText: 'Car Name',
                                  controller: carProvider.carNameController,
                                  enabledBorder: inputBorderColor,
                                  focusedBorder: inputBorderColor,
                                  focusErrorBorder: inputBorderColor,
                                  validateMsg: 'Enter CarName',
                                ),
                                CustomTextFormField(
                                  labelText: 'Kms',
                                  keyboardType: TextInputType.number,
                                  controller: carProvider.kmController,
                                  enabledBorder: inputBorderColor,
                                  focusedBorder: inputBorderColor,
                                  focusErrorBorder: inputBorderColor,
                                  validateMsg: 'Enter Km',
                                ),
                                dateTextFormField(),
                                CustomTextFormField(
                                  labelText: 'Description',
                                  controller: carProvider.descriptionController,
                                  enabledBorder: inputBorderColor,
                                  focusedBorder: inputBorderColor,
                                  focusErrorBorder: inputBorderColor,
                                  validateMsg: 'Enter Description',
                                ),
                                CustomTextFormField(
                                  labelText: 'Price',
                                  controller: carProvider.priceController,
                                  keyboardType: TextInputType.number,
                                  enabledBorder: inputBorderColor,
                                  focusedBorder: inputBorderColor,
                                  focusErrorBorder: inputBorderColor,
                                  validateMsg: 'Enter price',
                                ),
                                const SizedBox(height: 10),
                                ButtonWidgets().rectangleButton(
                                  size,
                                  name: 'ADD CAR',
                                  onPressed: () async {
                                    if (carProvider.carDataFormKey.currentState!
                                        .validate()) {
                                      await addData(context, carProvider);
                                      Navigator.pop(context);
                                    }
                                  },
                                  bgColor: Colors.black,
                                  fgColor: Colors.white,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }

  Future<void> pickImage(BuildContext context) async {
    final pro = Provider.of<CarProvider>(context, listen: false);
    await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Camera'),
                onTap: () {
                  Navigator.pop(context);
                  pro.getImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: const Icon(Icons.image),
                title: const Text('Gallery'),
                onTap: () {
                  Navigator.pop(context);
                  pro.getImage(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> addData(BuildContext context, CarProvider carProvider) async {
    final pickedImage = carProvider.pickedImage;
    if (pickedImage != null) {
      carProvider.setIsAddingData(true);
      final image = await carProvider.uploadImage(
          File(pickedImage.path), carProvider.imageName);

      final cars = CarModel(
        carName: carProvider.carNameController.text,
        description: carProvider.descriptionController.text,
        price: int.parse(carProvider.priceController.text),
        km: carProvider.kmController.text,
        date: carProvider.dateController.text,
        image: image,
        wishList: [],
      );

      carProvider.addCar(cars);

      carProvider.clearCarControllers();

      SnackBarWidget().showSuccessSnackbar(context, 'Car Added Successfully');
    } else {
      SnackBarWidget()
          .showSuccessSnackbar(context, 'Failed to Add try once more');
      log('Error: pickedImage is null');
    }
    carProvider.setIsAddingData(false);
  }
}
