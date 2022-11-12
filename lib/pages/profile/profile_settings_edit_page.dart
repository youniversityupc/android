import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:youniversity_app/pages/profile/models/student_model.dart';
import 'package:youniversity_app/utils/user_preferences.dart';
import 'package:youniversity_app/widgets/text_input_widget.dart';

import '../../widgets/profile_widget.dart';

class ProfileSettingsEditPage extends StatefulWidget {
  const ProfileSettingsEditPage({super.key});

  @override
  State<ProfileSettingsEditPage> createState() =>
      _ProfileSettingsEditPageState();
}

class _ProfileSettingsEditPageState extends State<ProfileSettingsEditPage> {
  late StudentModel user;
  @override
  void initState() {
    super.initState();

    user = UserPreferences.getUser();
  }

  @override
  Widget build(BuildContext context) {
    ImagePicker picker = ImagePicker();
    XFile? image;
    return Builder(
        builder: (context) => Scaffold(
              body: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                physics: const BouncingScrollPhysics(),
                children: [
                  ProfileWidget(
                    photoPath: user.photoPath,
                    isEdit: true,
                    onClicked: () async {
                      image =
                          await picker.pickImage(source: ImageSource.gallery);
                      //if (image == null) return;
                      //final directory = await getApplicationDocumentsDirectory();
                      //final name = File(image.path);
                      //final imageFile = File('${directory.path}/$name');
                      //final newImage = await File(image.path).copy(imageFile.path);
                      setState(
                          () {} /* => user = user.copy(photoPath: Image.file(File(image.path)))*/);
                    },
                  ),
                  const SizedBox(height: 24),
                  TextInputWidget(
                    label: 'Nombre completo',
                    text: user.studentFullName,
                    onChanged: (studentFullName) =>
                        user = user.copy(studentFullName: studentFullName),
                  ),
                  const SizedBox(height: 24),
                  TextInputWidget(
                    label: 'Correo electrónico',
                    text: user.email,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (email) => user = user.copy(email: email),
                  ),
                  const SizedBox(height: 24),
                  TextInputWidget(
                    label: 'Teléfono',
                    text: user.tel,
                    keyboardType: TextInputType.phone,
                    onChanged: (tel) => user = user.copy(tel: tel),
                  ),
                  const SizedBox(height: 24),
                  TextInputWidget(
                    label: 'Universidad',
                    text: user.college,
                    onChanged: (college) => user = user.copy(college: college),
                  ),
                ],
              ),
            ));
  }
}
