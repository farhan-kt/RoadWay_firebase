import 'package:car_sale_firebase/widget/button_widget.dart';
import 'package:car_sale_firebase/widget/textformfield_widget.dart';
import 'package:car_sale_firebase/widget/textstyle_widget.dart';
import 'package:flutter/material.dart';

class AdminAddDataScreen extends StatelessWidget {
  AdminAddDataScreen({super.key});
  TextEditingController carNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController showRoomPlaceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                textPoppins(
                  name: 'RoadWay',
                  fontsize: 25,
                  fontweight: FontWeight.w600,
                ),
                textAbel(
                  name: 'M  O  T  O  R  S',
                  fontsize: 17,
                  fontweight: FontWeight.w800,
                ),
                const SizedBox(height: 30),
                SizedBox(
                  height: size.height * .3,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      children: [
                        Container(
                          height: size.height * .2,
                          width: size.width * .9,
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              border: Border.all(color: Colors.black, width: 2),
                              image: const DecorationImage(
                                  image: AssetImage('assets/RoadWay.png'))),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ButtonWidgets().imageButton(
                              size,
                              height: size.height * .05,
                              width: size.width * .35,
                              name: 'Camera',
                              onPressed: () {},
                            ),
                            ButtonWidgets().imageButton(
                              size,
                              height: size.height * .05,
                              width: size.width * .35,
                              name: 'Gallery',
                              onPressed: () {},
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                CustomTextFormField(
                  labelText: 'Car Name',
                  controller: carNameController,
                  enabledBorder: inputBorderColor,
                  focusedBorder: inputBorderColor,
                  focusErrorBorder: inputBorderColor,
                ),
                SizedBox(
                  height: size.height * .4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomTextFormField(
                        labelText: 'Description',
                        controller: descriptionController,
                        enabledBorder: inputBorderColor,
                        focusedBorder: inputBorderColor,
                        focusErrorBorder: inputBorderColor,
                      ),
                      CustomTextFormField(
                        labelText: 'Price',
                        controller: priceController,
                        enabledBorder: inputBorderColor,
                        focusedBorder: inputBorderColor,
                        focusErrorBorder: inputBorderColor,
                      ),
                      CustomTextFormField(
                        labelText: 'Car Type',
                        controller: showRoomPlaceController,
                        enabledBorder: inputBorderColor,
                        focusedBorder: inputBorderColor,
                        focusErrorBorder: inputBorderColor,
                      ),
                      ButtonWidgets().rectangleButton(size,
                          name: 'ADD CAR',
                          onPressed: () {},
                          bgColor: Colors.black,
                          fgColor: Colors.white),
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
}
