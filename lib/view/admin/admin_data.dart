// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:car_sale_firebase/controller/car_provider.dart';
import 'package:car_sale_firebase/model/car_model.dart';
import 'package:car_sale_firebase/widget/button_widget.dart';
import 'package:car_sale_firebase/widget/textformfield_widget.dart';
import 'package:car_sale_firebase/widget/textstyle_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AdminAddDataScreen extends StatelessWidget {
  AdminAddDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final carProvider = Provider.of<CarProvider>(context, listen: false);
    const OutlineInputBorder inputBorderColor = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black),
    );
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back_ios)),
                    SizedBox(width: size.width * .19),
                    textPoppins(
                      name: 'RoadWay',
                      fontsize: 25,
                      fontweight: FontWeight.w600,
                    ),
                  ],
                ),
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
                          builder: (context, value, child) => GestureDetector(
                            onTap: () {
                              pickImage(context);
                            },
                            child: Container(
                              height: size.height * .2,
                              width: size.width * .9,
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                border:
                                    Border.all(color: Colors.black, width: 2),
                                image: value.pickedImage != null
                                    ? DecorationImage(
                                        image: FileImage(value.pickedImage!),
                                        fit: BoxFit.cover,
                                      )
                                    : null,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * .5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomTextFormField(
                        labelText: 'Car Name',
                        controller: carProvider.carNameController,
                        enabledBorder: inputBorderColor,
                        focusedBorder: inputBorderColor,
                        focusErrorBorder: inputBorderColor,
                      ),
                      CustomTextFormField(
                        labelText: 'Description',
                        controller: carProvider.descriptionController,
                        enabledBorder: inputBorderColor,
                        focusedBorder: inputBorderColor,
                        focusErrorBorder: inputBorderColor,
                      ),
                      CustomTextFormField(
                        labelText: 'Car body style',
                        controller: carProvider.categoryController,
                        enabledBorder: inputBorderColor,
                        focusedBorder: inputBorderColor,
                        focusErrorBorder: inputBorderColor,
                      ),
                      CustomTextFormField(
                        labelText: 'Price',
                        controller: carProvider.priceController,
                        enabledBorder: inputBorderColor,
                        focusedBorder: inputBorderColor,
                        focusErrorBorder: inputBorderColor,
                      ),
                      ButtonWidgets().rectangleButton(size, name: 'ADD CAR',
                          onPressed: () {
                        addData(context);
                        carProvider.uploadImage(carProvider.downloadUrl);
                      }, bgColor: Colors.black, fgColor: Colors.white),
                    ],
                  ),
                )
              ],
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

  addData(context) async {
    final carProvider = Provider.of<CarProvider>(context, listen: false);
    final getwidgetProvider = Provider.of<CarProvider>(context, listen: false);
    carProvider.uploadImage(File(getwidgetProvider.pickedImage!.path));

    final cars = CarModel(
      carName: carProvider.carNameController.text,
      description: carProvider.descriptionController.text,
      price: int.parse(carProvider.priceController.text),
      category: carProvider.categoryController.text,
      image: carProvider.downloadUrl,
      wishList: [],
    );
    carProvider.addCar(cars);
    Navigator.pop(context);
  }
}
