import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/globals/app_buttons.dart';
import 'package:my_portfolio/helper%20class/helper_class.dart';
import '../globals/app_colors.dart';
import '../globals/app_text_styles.dart';
import '../globals/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  // Form key for validation
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> sendData() async {
    // Validate the form
    if (!_formKey.currentState!.validate()) {
      return; // Stop if the form is invalid
    }

    const String sheetdbUrl = "https://sheetdb.io/api/v1/ro2auto76nc39";

    final DateTime now = DateTime.now();
    final String formattedDateTime = "${now.year}-${now.month}-${now.day} ${now.hour}:${now.minute}:${now.second}";

    final Map<String, String> data = {
      "Full Name": fullNameController.text,
      "Email": emailController.text,
      "Mobile": mobileController.text,
      "Subject": subjectController.text,
      "Message": messageController.text,
      "Time": formattedDateTime,
    };

    try {
      final response = await http.post(
        Uri.parse(sheetdbUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(data),
      );

      print('Body: ${response.body}');
      print('Status: ${response.statusCode}');

      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            content: const Row(
              children: [
                Icon(Icons.check_circle, color: Colors.white),
                SizedBox(width: 10),
                Text(
                  "Message sent successfully",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
            duration: const Duration(seconds: 3),
            behavior: SnackBarBehavior.floating,
            margin: const EdgeInsets.all(20),
          ),
        );

        // Clear the form fields
        fullNameController.clear();
        emailController.clear();
        mobileController.clear();
        subjectController.clear();
        messageController.clear();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Failed to send message.")),
        );
      }
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return HelperClass(
      mobile: buildForm(),
      tablet: buildForm(),
      desktop: buildForm(),
      paddingWidth: size.width * 0.2,
      backgroundColor: AppColors.backgroundColor,
      backgroundColor2: AppColors.backgroundColor2,
    );
  }

  Widget buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          buildContactText(),
          Constants.sizedBox(height: 40.0),
          buildInputField(fullNameController, 'Full Name'),
          Constants.sizedBox(height: 20.0),
          buildInputField(emailController, 'Email Address'),
          Constants.sizedBox(height: 20.0),
          buildInputField(mobileController, 'Mobile Number'),
          Constants.sizedBox(height: 20.0),
          buildInputField(subjectController, 'Email Subject'),
          Constants.sizedBox(height: 20.0),
          buildInputField(messageController, 'Your Message', maxLines: 5),
          Constants.sizedBox(height: 40.0),
          AppButtons.buildMaterialButton(
            buttonName: 'Send Message',
            onTap: sendData,
          ),
          Constants.sizedBox(height: 30.0),
        ],
      ),
    );
  }

  Widget buildInputField(TextEditingController controller, String hintText, {int maxLines = 1}) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      color: Colors.transparent,
      elevation: 8,
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        cursorColor: AppColors.white,
        style: AppTextStyles.normalStyle(),
        decoration: buildInputDecoration(hintText: hintText),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'required';
          }
          return null;
        },
      ),
    );
  }

  FadeInDown buildContactText() {
    return FadeInDown(
      duration: const Duration(milliseconds: 1200),
      child: RichText(
        text: TextSpan(
          text: 'Contact ',
          style: AppTextStyles.headingStyles(fontSize: 30.0),
          children: [
            TextSpan(
              text: 'Me!',
              style: AppTextStyles.headingStyles(
                fontSize: 30,
                color: AppColors.robinEdgeBlue,
              ),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration buildInputDecoration({required String hintText}) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: AppTextStyles.comfortaaStyle(),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      filled: true,
      fillColor: AppColors.backgroundColor4,
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      errorStyle: const TextStyle(color: Colors.red),
    );
  }
}

