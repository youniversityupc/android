import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GradesInformation extends StatefulWidget {
  const GradesInformation({Key? key}) : super(key: key);

  @override
  _GradesInformationState createState() => _GradesInformationState();
}

class _GradesInformationState extends State<GradesInformation> {
  TextEditingController? searchFieldController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final bodyText1 =
      TextStyle(fontSize: 14, color: Color(0xFF326A8C), fontFamily: 'Poppins');
  final title2 =
      TextStyle(fontSize: 22, color: Colors.black, fontFamily: 'Poppins');
  final title3 = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: Colors.white,
      fontFamily: 'Poppins');

  @override
  void initState() {
    super.initState();
    searchFieldController = TextEditingController();
  }

  @override
  void dispose() {
    searchFieldController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
  }
}
