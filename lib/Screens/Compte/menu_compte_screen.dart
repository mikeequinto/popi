import 'package:flutter/material.dart';
import 'package:popi/constraints.dart';

class MenuCompte extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      GestureDetector(
        child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            child: Container(
                padding: EdgeInsets.all(20.0),
                child: ListTile(
                    leading: Container(
                      padding: EdgeInsets.only(right: 12.0),
                      child: Icon(Icons.autorenew, color: kPrimaryColor),
                    ),
                    title: Text("Informations générales",
                        style: TextStyle(color: Colors.black))))),
        onTap: () => {
          debugPrint("hey")
        },
      )
    ]);
  }
}
