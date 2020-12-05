import 'package:flutter/material.dart';

import '../constraints.dart';

class AddDiplomaButton extends StatelessWidget {
  const AddDiplomaButton({
    this.onPressed,
    Key key,
  }) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FlatButton(

      // Button style
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: BorderSide(color: Colors.white)
      ),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: Text(
          "AJOUTER", 
          style: TextStyle(
            fontSize: 16, 
            fontWeight: FontWeight.w800
          )
        ),
      ),
      textColor: Colors.white,
      color: kPrimaryVeryLightColor,

      // Button event
      onPressed: onPressed
      
    );
  }
}