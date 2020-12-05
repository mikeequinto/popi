import 'package:flutter/material.dart';
import 'package:popi/Components/dropdown_field_container.dart';
import 'package:popi/Components/submit_button.dart';
import 'package:popi/Components/text_field_container.dart';
import 'package:popi/Screens/Account_Creation/account_diplomas_screen.dart';
import 'package:popi/Styles/styles.dart';
import 'package:popi/api/AuthProvider.dart';
import 'package:popi/data/form_data.dart';
import 'package:popi/models/Compte.dart';

import '../../../constraints.dart';

class NewAccountForm extends StatefulWidget {
  @override
  _NewAccountFormState createState() => new _NewAccountFormState();
}

class _NewAccountFormState extends State<NewAccountForm> {
  // formKey will look at the current state of the form
  // and check if all fields are validated
  final _formKey = GlobalKey<FormState>();

  // Text editing controllers will let us retrieve field values
  TextEditingController etEmail = new TextEditingController();
  TextEditingController etMotDePasse = new TextEditingController();
  TextEditingController etNom = new TextEditingController();
  TextEditingController etAnneeNaissance = new TextEditingController();
  TextEditingController etFonctionAutre = new TextEditingController();
  TextEditingController etInstitutionAutre = new TextEditingController();
  TextEditingController etNomInstitution = new TextEditingController();
  TextEditingController etCodePostal = new TextEditingController();
  TextEditingController etVille = new TextEditingController();
  TextEditingController etPays = new TextEditingController();

  // variables with the dropdown field values
  String _selectedSexe = '';
  String _selectedFonction = '';
  String _selectedInstituteType = '';

  @override
  Widget build(BuildContext context) {
    return Form(key: _formKey, child: new Column(children: getFormWidget()));
  }

  List<Widget> getFormWidget() {
    List<Widget> formWidget = new List();
    // Email
    formWidget.add(TextFormFieldContainer(
      controller: etEmail,
      text: "Email",
      hidden: false,
      inputType: TextInputType.emailAddress,
    ));
    formWidget.add(SizedBox(height: 30));

    // Mot de passe
    formWidget.add(TextFormFieldContainer(
      controller: etMotDePasse,
      text: "Mot de passe",
      hidden: true,
      inputType: TextInputType.text,
    ));
    formWidget.add(SizedBox(height: 30));

    // Nom
    formWidget.add(TextFormFieldContainer(
      controller: etNom,
      text: "Nom",
      hidden: false,
      inputType: TextInputType.text,
    ));
    formWidget.add(SizedBox(height: 30));

    // Sexe
    formWidget.add(addSexeDropdown());
    formWidget.add(SizedBox(height: 30));

    // Année de naissance
    formWidget.add(TextFormFieldContainer(
      controller: etAnneeNaissance,
      text: "Année de naissance",
      hidden: false,
      inputType: TextInputType.number,
    ));
    formWidget.add(SizedBox(height: 30));

    // Fonction
    formWidget.add(addFonctionDropdown());
    formWidget.add(SizedBox(height: 30));

    // Si fonction == autre, à préciser
    formWidget.add(addFonctionTextfield());

    // Type institution
    formWidget.add(addInstitutionDropdown());
    formWidget.add(SizedBox(height: 30));

    // Si fonction == autre, à préciser
    // Année de naissance
    formWidget.add(addInstitutionTextfield());

    // Nom de l'institution
    formWidget.add(TextFormFieldContainer(
      controller: etNomInstitution,
      text: "Nom de l'institution",
      hidden: false,
      inputType: TextInputType.text,
    ));
    formWidget.add(SizedBox(height: 30));

    // Code postal
    formWidget.add(TextFormFieldContainer(
      controller: etCodePostal,
      text: "Code postal de l'institution",
      hidden: false,
      inputType: TextInputType.number,
    ));
    formWidget.add(SizedBox(height: 30));

    // Ville
    formWidget.add(TextFormFieldContainer(
        controller: etVille,
        text: "Ville",
        hidden: false,
        inputType: TextInputType.text));
    formWidget.add(SizedBox(height: 30));

    // Pays
    formWidget.add(TextFormFieldContainer(
      controller: etPays,
      text: "Pays",
      hidden: false,
      inputType: TextInputType.text,
    ));
    formWidget.add(SizedBox(height: 30));

    // Suivant
    formWidget.add(SubmitButton(
      text: "SUIVANT",
      onPressed: (() {
        handleSubmitButton();
      }),
    ));
    formWidget.add(SizedBox(height: 30));

    return formWidget;
  }

  // Form methods

  addSexeDropdown() {
    return DropdownFieldContainer(
        child: DropdownButtonFormField(
            dropdownColor: kPrimaryLightColor,
            decoration: dropdownUnderline,
            isExpanded: true,
            style: dropdownTextStyle,
            items: sexeList,
            value: 'label',
            onChanged: (value) {
              setState(() {
                _selectedSexe = value;
              });
            },
            validator: (value) =>
                value == 'label' ? 'Champ obligatoire' : null));
  }

  addFonctionDropdown() {
    return DropdownFieldContainer(
        child: DropdownButtonFormField(
            dropdownColor: kPrimaryLightColor,
            decoration: dropdownUnderline,
            isExpanded: true,
            style: dropdownTextStyle,
            items: fonctionList,
            value: 'label',
            hint: Text('Fonction'),
            onChanged: (value) {
              setState(() {
                _selectedFonction = value;
              });
            },
            validator: (value) =>
                value == 'label' ? 'Champ obligatoire' : null));
  }

  addFonctionTextfield() {
    return Visibility(
        visible: _selectedFonction == 'fonctionAutre',
        child: Column(children: [
          TextFormFieldContainer(
            controller: etFonctionAutre,
            text: "Précisez la fonction",
            hidden: false,
            inputType: TextInputType.text,
          ),
          SizedBox(
            height: 30,
          )
        ]));
  }

  addInstitutionDropdown() {
    return DropdownFieldContainer(
        child: DropdownButtonFormField(
            dropdownColor: kPrimaryLightColor,
            decoration: dropdownUnderline,
            isExpanded: true,
            style: dropdownTextStyle,
            items: instituteTypeList,
            value: 'label',
            onChanged: (value) {
              setState(() {
                _selectedInstituteType = value;
              });
            },
            validator: (value) =>
                value == 'label' ? 'Champ obligatoire' : null));
  }

  addInstitutionTextfield() {
    return Visibility(
        visible: _selectedInstituteType == 'institutionAutre',
        child: Column(children: [
          TextFormFieldContainer(
            controller: etInstitutionAutre,
            text: "Précisez le type d'institution",
            hidden: false,
            inputType: TextInputType.text,
          ),
          SizedBox(
            height: 30,
          )
        ]));
  }

  handleSubmitButton() {
    if (_formKey.currentState.validate()) {
      //Verify if email is taken
      AuthProvider().verifyEmail(etEmail.text).then((result) {
        if (result['status'] == "OK") {
          if (result['taken'] == false) {
            //Create account
            Compte newAccount = new Compte(
                email: etEmail.text.trim(),
                motDePasse: etMotDePasse.text.trim(),
                nom: etNom.text.trim(),
                sexe: _selectedSexe,
                anneeNaissance: etAnneeNaissance.text,
                fonction: _selectedFonction == 'fonctionAutre'
                    ? etFonctionAutre.text.trim()
                    : _selectedFonction,
                typeInstitution: _selectedInstituteType == 'institutionAutre'
                    ? etInstitutionAutre.text.trim()
                    : _selectedInstituteType,
                nomInstitution: etNomInstitution.text.trim(),
                codePostal: etCodePostal.text.trim(),
                ville: etVille.text.trim(),
                pays: etPays.text.trim());

            //Continue to diplomes screen
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        AccountDiplomasScreen(compte: newAccount)));
          } else {
            //Email already exists

            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Attention"),
                    content: Text(emailExistsMessage),
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
        } else {
          //Server timeout
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Attention"),
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
    } else {
      //Some fields are not valid
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Attention"),
              content: Text(invalidFieldsMessage),
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
  }
}
