
import 'package:flutter/material.dart';
import 'package:popi/models/Compte.dart';
import 'package:popi/models/Diplome.dart';

import '../constraints.dart';

class DiplomeList extends StatefulWidget {
  const DiplomeList({ 
    this.compte,
    Key key 
  }) : super(key: key);

  final Compte compte;

  @override
  _DiplomeListState createState() => _DiplomeListState();
}

class _DiplomeListState extends State<DiplomeList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: 
      showDiplomes()
    );     
  }

  showDiplomes() {

    Compte compte = widget.compte;

    // Widget list containing diplomas
    List<Widget> diplomeWidgetList = new List();

    diplomeWidgetList.add(Align(
      alignment: Alignment.centerLeft,
      child: Container(
        child: Text("Diplômes :")
      ),
    ),);
    diplomeWidgetList.add(SizedBox(height: 20));

    // Compte diplomes list
    List<Diplome> diplomesList = widget.compte.getDiplomes();

      for(var i=0; i < widget.compte.getDiplomes().length; i++){

        String diplomeName = diplomesList[i].getDiplome();
        if(diplomeName.length > 25){
          diplomeName = diplomeName.substring(0,27) + "...";
        }

        diplomeWidgetList.add( 
          Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text("- " + diplomeName + ", " + diplomesList[i].annee ),
                  GestureDetector(
                    child: CircleAvatar(
                      child: ImageIcon(AssetImage('assets/icons/close.png'),color: Colors.white,size: 15.0,),
                      radius: 15.0,
                      backgroundColor: kPrimaryLightColor,
                    ),
                    onTap: () {
                     setState(() {
                       compte.deleteDiplome(i);
                     });
                    }
                  )
                ]),
                SizedBox(height: 20)
              ]
            )
          ),
        );
      }

    return diplomeWidgetList;
  }

}