
import 'package:flutter/material.dart';

import '../constraints.dart';

class TextFormFieldContainer extends StatelessWidget {
  const TextFormFieldContainer({
    this.controller,
    this.text,
    this.hidden,
    this.inputType,
    this.errorMessage,
    this.login,
    Key key,
  }) : super(key: key);

  final TextEditingController controller;
  final String text;
  final bool hidden;
  final TextInputType inputType;
  final String errorMessage;
  final bool login; //To know if we need to validate password

  @override
  Widget build(BuildContext context) {

    return TextFormField(

      // Text field controller (id)
      controller: controller,

      // Input text field style
      decoration: InputDecoration(
        labelText: text,
        labelStyle: TextStyle(
          color: Colors.white,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none
        ),
        filled: true,
        fillColor: kPrimaryLightColor,
        contentPadding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 20.0)
      ),
      style: TextStyle(
        color: Colors.white
      ),
      keyboardType: inputType,
      obscureText: hidden,
    
      // Input text validator
      validator: (value) {
        if (value == '') {
          return "*Champ obligatoire";
        }

        if(text != "Mot de passe" && value.length > 50)
          return "Le nombre de caractères maximum est 50";
        
        
        if(text == "Mot de passe"){
          if(login == null){
            if(value.length < 6) 
            return "Votre mot de passe doit comporter 6 caractères minimum";
          }
        }

        if(text == 'Année de naissance'){
          var now = new DateTime.now();
          //return int.parse(value).toString() + " " +now.year.toString();
          if(int.parse(value) < 1900 || int.parse(value) >= now.year)
            return "Votre date de naissance est incorrecte";
        }

        if(text == "Année d'obtention"){
          var now = new DateTime.now();
          //return int.parse(value).toString() + " " +now.year.toString();
          if(int.parse(value) < 1900 || int.parse(value) > now.year)
            return "Année non valide";
        }

        return null;
      },
    );
  }
}