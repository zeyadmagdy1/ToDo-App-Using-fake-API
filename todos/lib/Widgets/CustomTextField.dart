import 'package:flutter/material.dart';

class Customtextfield extends StatelessWidget {
  TextEditingController controllerr;
  String txt;
  Customtextfield({required this.controllerr,required this.txt,super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controllerr,
      decoration: InputDecoration(
        label: Text(txt,style: TextStyle(fontSize: 25),)
      ),
    );
  }
}
