
import 'package:flutter/material.dart';

List<DropdownMenuItem> sexeList = [
  new DropdownMenuItem(child: new Text('Sexe'), value: 'label',),
  new DropdownMenuItem(child: new Text('Homme'), value: "0",),
  new DropdownMenuItem(child: new Text('Femme'), value: "1",),
];

List<DropdownMenuItem> fonctionList = [
  new DropdownMenuItem(child: new Text('Fonction'), value: 'label',),
  new DropdownMenuItem(child: new Text('Infirmier'), value: 'Infirmier',),
  new DropdownMenuItem(child: new Text('Infirmier (Etudiant)'), value: 'Infirmier (Etudiant)',),
  new DropdownMenuItem(child: new Text('Médecin'), value: 'Médecin',),
  new DropdownMenuItem(child: new Text('Médecin (Interne)'), value: 'Médecin (Interne)',),
  new DropdownMenuItem(child: new Text('Médecin (Etudiant)'), value: 'Médecin (Etudiant)',),
  new DropdownMenuItem(child: new Text('Pharmacien'), value: 'Pharmacien',),
  new DropdownMenuItem(child: new Text('Pharmacien (Interne)'), value: 'Pharmacien (Interne)',),
  new DropdownMenuItem(child: new Text('Pharmacien (Etudiant)'), value: 'Pharmacien (Etudiant)',),
  new DropdownMenuItem(child: new Text('Préparateur en pharmacie'), value: 'Préparateur en pharmacie',),
  new DropdownMenuItem(child: new Text('Préparateur en pharmacie (Etudiant)'), value: 'Préparateur en pharmacie (Etudiant)',),
  new DropdownMenuItem(child: new Text('Autre'), value: 'fonctionAutre',),
];

List<DropdownMenuItem> instituteTypeList = [
  new DropdownMenuItem(child: new Text("Type d'institution"), value: 'label',),
  new DropdownMenuItem(child: new Text('Centre Hospitalier'), value: 'Centre Hospitalier',),
  new DropdownMenuItem(child: new Text('Exercice libéral'), value: 'Exercice libéral',),
  new DropdownMenuItem(child: new Text('Maison de santé'), value: 'Maison de santé',),
  new DropdownMenuItem(child: new Text("Pharmacie d'officine"), value: "Pharmacie d'officine",),
  new DropdownMenuItem(child: new Text('Autre'), value: 'institutionAutre',),
];

List<DropdownMenuItem> diplomeList = [
  new DropdownMenuItem(child: new Text("Diplôme"), value: 'label',),
  new DropdownMenuItem(child: new Text('Brevet de préparateur en pharmacie'), value: 'Brevet de préparateur en pharmacie',),
  new DropdownMenuItem(child: new Text('Doctorat en médecine'), value: 'Doctorat en médecine',),
  new DropdownMenuItem(child: new Text('Doctorat en pharmacie'), value: 'Doctorat en pharmacie',),
  new DropdownMenuItem(child: new Text('Doctorat de sciences'), value: 'Doctorat de sciences',),
  new DropdownMenuItem(child: new Text('Master 1'), value: 'Master 1',),
  new DropdownMenuItem(child: new Text('Master 2'), value: 'Master 2',),
  new DropdownMenuItem(child: new Text('Autre'), value: 'diplomeAutre',),
];


