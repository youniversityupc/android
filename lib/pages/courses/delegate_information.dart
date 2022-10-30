import 'package:flutter/material.dart';
import 'package:youniversity_app/components/course_card.dart';
import 'package:youniversity_app/utils/app_colors.dart';

class DelegateInformation extends StatelessWidget {
  const DelegateInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 16.0),
            child: Column(
              children: [
                Container(
                  width: 150,
                  height: 150,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/dalb.jpg'),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.all(Radius.circular(120)),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: InformationCard(
                    color: Color.fromARGB(255, 32, 160, 117),
                    name: 'Diego Albitres Blondet',
                    email: 'u202015652@upc.edu.pe',
                    phone: '999 999 999',
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
