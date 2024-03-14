import 'package:car_sale_firebase/view/settings/widgets/settings_screen_widgets.dart';
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
                    icon: const Icon(Icons.arrow_back_ios)),
                SizedBox(
                  width: size.width * .2,
                ),
                textPoppins(
                    name: 'Help Center',
                    color: const Color(0xFF00246B),
                    fontsize: 25,
                    fontweight: FontWeight.bold)
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ListView(
                  children: [
                    const SizedBox(height: 20),
                    const Text(
                      'Frequently Asked Questions',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    const FAQItem(
                      question: 'How do I create an account ?',
                      answer:
                          'To create an account, click on the "Register" button.',
                    ),
                    const FAQItem(
                      question:
                          'How can I contact with RoadWay customer service ?',
                      answer: 'settings -> Help Center -> Contact Information',
                    ),
                    const FAQItem(
                      question: 'What payment methods do you accept ?',
                      answer:
                          'We accept credit/debit cards, PayPal, and bank transfers...',
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Contact Information',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    ListTile(
                      leading: const Icon(Icons.email),
                      title: const Text('Email: RoadWay@gmail.com'),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(Icons.phone),
                      title: const Text('Phone: +91 702 564 61 62'),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
