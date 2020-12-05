import 'package:flutter/material.dart';
import 'package:popi/models/Compte.dart';
import 'package:popi/Styles/styles.dart';

import 'AccountForms/diplomas_form.dart';

class AccountDiplomasScreen extends StatelessWidget {

  final Compte compte;

  AccountDiplomasScreen({
    Key key,
    @required this.compte,
  }) : super(key: key);

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
            child: ListView(
              children: <Widget>[
                // Title
                Text("Créer un compte", style: screenTitle),
                SizedBox(height: 30),

                // Subtitle
                Text("Entrez un à un vos diplômes"),
                SizedBox(height: 30),
                
                // Diploma form
                DiplomaForm(compte: compte),
                
              ]
            )
          ) 
        )
      )
    );
  }
}

