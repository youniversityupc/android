import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/app_colors.dart';
import '../../components/cover_widget.dart';

class ProfileSettingScreen extends StatefulWidget {
  const ProfileSettingScreen({Key? key}) : super(key: key);

  @override
  State<ProfileSettingScreen> createState() => _ProfileSettingScreenState();
}

class _ProfileSettingScreenState extends State<ProfileSettingScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController telephoneController = TextEditingController();
  TextEditingController centerOfStudiesController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Get.height * 0.4,
              child: Stack(
                children: [
                  coverWidgetWithoutLogo(),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: 120,
                        height: 120,
                        margin: const EdgeInsets.only(bottom: 20),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Color(0xffD6D6D6)),
                        child: const Center(
                          child: Icon(
                            Icons.camera_alt_outlined,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                      )),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 23),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    _createTextFieldWidget(
                        'Name', Icons.person_sharp, nameController,
                        (String? input) {
                      if (input!.isEmpty) {
                        return 'Name is required!';
                      }
                      if (input.length < 5) {
                        return 'Please enter a valid name!';
                      }
                      return null;
                    }),
                    const SizedBox(
                      height: 10,
                    ),
                    _createTextFieldWidget(
                        'Email', Icons.email_sharp, emailController,
                        (String? input) {
                      if (input!.isEmpty) {
                        return 'Email Address is required!';
                      }
                      return null;
                    }),
                    const SizedBox(
                      height: 10,
                    ),
                    _createTextFieldWidget(
                        'Telephone number',
                        Icons.phone_sharp,
                        telephoneController, (String? input) {
                      if (input!.isEmpty) {
                        return 'Phone number is required!';
                      }
                      return null;
                    }),
                    const SizedBox(
                      height: 10,
                    ),
                    _createTextFieldWidget(
                        'Center of studies',
                        Icons.school_sharp,
                        centerOfStudiesController, (String? input) {
                      if (input!.isEmpty) {
                        return 'Center of studies is required!';
                      }
                      return null;
                    }),
                    const SizedBox(
                      height: 20,
                    ),
                    _createDarkBlueButton('Submit', () {
                      if (!formKey.currentState!.validate()) {
                        return;
                      }
                    })
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _createTextFieldWidget(String title, IconData iconData,
      TextEditingController controller, Function validator) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.darkBlueColor),
        ),
        const SizedBox(
          height: 6,
        ),
        Container(
          width: Get.width,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    spreadRadius: 1,
                    blurRadius: 1)
              ],
              borderRadius: BorderRadius.circular(8)),
          child: TextFormField(
            validator: (input) => validator(input),
            controller: controller,
            style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.darkBlueColor),
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Icon(
                  iconData,
                  color: AppColors.darkBlueColor,
                ),
              ),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }

  Widget _createDarkBlueButton(String title, Function onPressed) {
    return MaterialButton(
      minWidth: Get.width,
      height: 50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      color: AppColors.darkBlueColor,
      onPressed: () => onPressed(),
      child: Text(
        title,
        style: GoogleFonts.poppins(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}
