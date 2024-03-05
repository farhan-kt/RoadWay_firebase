import 'package:car_sale_firebase/widget/settings_screen_widgets.dart';
import 'package:car_sale_firebase/widget/textstyle_widget.dart';
import 'package:flutter/material.dart';

class HelpCenter extends StatelessWidget {
  const HelpCenter({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: size.height * .045),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios)),
                SizedBox(
                  width: size.width * .2,
                ),
                textPoppins(
                    name: 'Help Center',
                    color: Color(0xFF00246B),
                    fontsize: 25,
                    fontweight: FontWeight.bold)
              ],
            ),
            ListView(
              children: [],
            )
            // ListView(
            //   children: const [
            //     SizedBox(height: 20),
            //     Text(
            //       'Frequently Asked Questions',
            //       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            //     ),
            //     SizedBox(height: 10),
            //     FAQItem(
            //       question: 'How do I create an account?',
            //       answer:
            //           'To create an account, click on the "Sign Up" button...',
            //     ),
            //     FAQItem(
            //       question: 'How can I track my order?',
            //       answer:
            //           'Once your order is shipped, you will receive a tracking number...',
            //     ),
            //     FAQItem(
            //       question: 'What payment methods do you accept?',
            //       answer:
            //           'We accept credit/debit cards, PayPal, and bank transfers...',
            //     ),
            //     SizedBox(height: 20),
            //     Text(
            //       'Contact Information',
            //       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            //     ),
            //     SizedBox(height: 10),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
