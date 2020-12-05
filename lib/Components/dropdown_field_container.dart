import 'package:flutter/material.dart';

import '../constraints.dart';

class DropdownFieldContainer extends StatelessWidget {

  const DropdownFieldContainer({
    Key key,
    this.child
  }) : super(key: key);
  
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return  Container(
        padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
        decoration: BoxDecoration(
          color: kPrimaryLightColor,
          borderRadius: BorderRadius.circular(10)
        ),

        child : DropdownButtonHideUnderline(
          child: child
      )
    );
  }
}

int getDropdownListItem(list, value){

  for(var i=0; i < list.length; i++){
    int itemValue = list.elementAt(i).value;
    if(itemValue == value){
      return i;
    }
  }
  return null;
}