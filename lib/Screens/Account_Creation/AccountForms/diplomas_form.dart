import 'package:flutter/material.dart';
import 'package:popi/Components/add_diploma_button.dart';
import 'package:popi/models/Compte.dart';
import 'package:popi/models/Diplome.dart';
import 'package:popi/Components/diplomes_list.dart';
import 'package:popi/Components/dropdown_field_container.dart';
import 'package:popi/Components/submit_button.dart';
import 'package:popi/Components/text_field_container.dart';
import 'package:popi/Styles/styles.dart';
import 'package:popi/data/form_data.dart';

import 'package:popi/api/AuthProvider.dart';
import 'package:popi/providers/UserProvider.dart';
import 'package:popi/shared_preferences/UserPreferences.dart';
import 'package:provider/provider.dart';

import '../../../constraints.dart';

class DiplomaForm extends StatefulWidget {
  final Compte compte;

  DiplomaForm({
    Key key,
    this.compte,
  }) : super(key: key);

  @override
  _DiplomaFormState createState() => _DiplomaFormState();
}

class _DiplomaFormState extends State<DiplomaForm> {
  // formKey will look at the current state of the form
  // and check if all fields are validated
  final _formKey = GlobalKey<FormState>();

  // Text editing controller will let us retrieve field value
  TextEditingController etAnnee = new TextEditingController();
  TextEditingController etDiplome = new TextEditingController();

  // variable with the dropdown field value
  String _selectedDiplome = '';

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey, child: Column(children: getFormWidget(widget.compte)));
  }

  List<Widget> getFormWidget(compte) {
    List<Widget> formWidget = new List();

    //Diplome dropdown
    formWidget.add(addDiplomeDropdown());
    formWidget.add(SizedBox(height: 30));

    //Diplome autre
    formWidget.add(addDiplomeTextfield());

    //Diplome year input + "AJOUTER" Row
    formWidget.add(Row(children: <Widget>[
      // Année input
      Expanded(
          child: TextFormFieldContainer(
              controller: etAnnee,
              text: "Année d'obtention",
              hidden: false,
              inputType: TextInputType.number)),
      SizedBox(width: 10),

      // Ajouter button
      Expanded(child: AddDiplomaButton(onPressed: (() {
        addDiplome();
      })))
    ]));
    formWidget.add(SizedBox(height: 30));

    // Display liste of added diplomes
    formWidget.add(DiplomeList(compte: compte));

    // Create account button
    formWidget.add(SubmitButton(
        text: "Créer",
        onPressed: (() {
          handleCreateButton();
        })));

    return formWidget;
  }

  //Form methods

  addDiplomeDropdown() {
    return DropdownFieldContainer(
        child: DropdownButtonFormField(
            dropdownColor: kPrimaryLightColor,
            decoration: dropdownUnderline,
            isExpanded: true,
            style: dropdownTextStyle,
            items: diplomeList,
            value: 'label',
            onChanged: (value) {
              setDiplome(value);
            },
            validator: (value) =>
                value == 'label' ? 'Champ obligatoire' : null));
  }

  addDiplomeTextfield() {
    return Visibility(
        visible: _selectedDiplome == 'diplomeAutre',
        child: Column(children: [
          TextFormFieldContainer(
            controller: etDiplome,
            text: "Précisez le diplôme",
            hidden: false,
            inputType: TextInputType.text,
          ),
          SizedBox(
            height: 30,
          )
        ]));
  }

  setDiplome(value) {
    setState(() {
      _selectedDiplome = value;
    });
  }

  addDiplome() {
    if (_formKey.currentState.validate()) {
      // Create diplome
      Diplome diplome = new Diplome(
          _selectedDiplome == 'diplomeAutre'
              ? etDiplome.text
              : _selectedDiplome,
          etAnnee.text);

      // Add diplome to list
      setState(() {
        widget.compte.addDiplome(diplome);
      });
    }
  }

  handleCreateButton() {
    // If diplomes list is empty
    if (widget.compte.getDiplomes().length == 0) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Aucun diplôme"),
              content: Text("Veuillez ajouter au moins un diplôme"),
              actions: [
                FlatButton(
                  child: Text("Fermer"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    } else {

      AuthProvider auth = Provider.of<AuthProvider>(context, listen: false);

      // Create account api call
      auth.register(widget.compte).then((registerResult) {
        if (registerResult['status']) {
          // On successful registration, login new user
          auth.login(widget.compte.email, widget.compte.motDePasse).then((loginResult) {

            Provider.of<UserProvider>(context, listen: false).setUser(widget.compte);
            UserPreferences().saveUser(widget.compte);
            Navigator.pushReplacementNamed(context, '/home');
          });
        } else {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Erreur"),
                  content: Text(registerFailedMessage),
                  actions: [
                    FlatButton(
                      child: Text("Fermer"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                );
              });
        }
      });
    }
  }
}
