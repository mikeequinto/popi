import 'package:flutter/material.dart';
import 'package:popi/Components/submit_button.dart';
import 'package:popi/Components/text_field_container.dart';

class PasswordRecoveryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // Get size of device
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Container(
        
        // Set width and height of container
        width: double.infinity, // As big as the parent
        height: size.height,
        
        child: Padding(
          padding: const EdgeInsets.all(20.0),

          child: Align (

            alignment: Alignment.topLeft,
            child: Column(

              children: <Widget>[

                // Title
                Text(
                  "Mot de passe oublié",
                  style: TextStyle(
                    fontSize: 25.0, 
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 30),

                // Subtitle
                Text(
                  "Entrez votre email pour recevoir un lien pour récupérer votre compte",
                ),
                SizedBox(height: 30),

                // Email input
                TextFormFieldContainer(text: "Email", hidden: false),
                SizedBox(height: 40),

                // Submit button
                SubmitButton(text: "VALIDER",
                  onPressed: () {
                    
                  },)

              ]
            ),
          ) 
        )
      )
    );
  }
}