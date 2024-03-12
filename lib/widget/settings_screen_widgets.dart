import 'package:car_sale_firebase/widget/textstyle_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildSettingItem(BuildContext context,
    {required IconData icon,
    required String title,
    required VoidCallback onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 10),
            Text(
              title,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget buildKeyFeature({required String title, required String description}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      textPoppins(name: title, fontweight: FontWeight.w500, fontsize: 17),
      const SizedBox(height: 5.0),
      textAbel(name: description, fontweight: FontWeight.w600, fontsize: 15),
      const SizedBox(height: 10.0),
    ],
  );
}

Widget settingsTextAbel({name}) {
  return Text(name,
      style: GoogleFonts.abel(fontWeight: FontWeight.w600, fontSize: 17));
}

Widget settingsTextPoppins({name}) {
  return Text(name,
      style: GoogleFonts.poppins(
          fontWeight: FontWeight.w700,
          fontSize: 20,
          color: const Color(0xFF00246B)));
}

class FAQItem extends StatelessWidget {
  final String question;
  final String answer;

  const FAQItem({super.key, required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        question,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child:
              Text(answer, style: const TextStyle(fontWeight: FontWeight.w400)),
        ),
      ],
    );
  }
}
