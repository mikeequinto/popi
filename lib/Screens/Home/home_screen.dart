import 'package:flutter/material.dart';
import 'package:popi/Screens/Compte/menu_compte_screen.dart';
import 'package:popi/Styles/styles.dart';
import 'package:popi/constraints.dart';
import 'package:popi/providers/UserProvider.dart';
import 'package:popi/shared_preferences/UserPreferences.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {

  int _selectedIndex = 0;
  String _title = _listScreens[0];

  static const List<String> _listScreens = <String>[
    "Cas",
    "Pathologies",
    "Compte",
  ];
  
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    MenuCompte(),
  ];


  @override
  Widget build(BuildContext context) {

    // Get size of device
    Size size = MediaQuery.of(context).size;

    final List<String> entries = <String>['A', 'B', 'C'];
    final List<int> colorCodes = <int>[600, 500, 100];

    return WillPopScope(
        //Prevent back button
        onWillPop: () async => false,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
          ),
          body:  Container(

            // Set width and height of container
            width: double.infinity, // As big as the parent
            height: size.height,
            color: kBackgroundColor,

            child: Column(children: [
              Container(
                color: kPrimaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(_title, style: screenTitle),
                  )
                ),
              ),
              
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: _widgetOptions.elementAt(_selectedIndex)
                  )
                )
              )
            ],)
            
            ),

          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home), 
                label: 'Cas'),
              BottomNavigationBarItem(
                icon: Icon(Icons.home), 
                label: 'Pathologies'),
              BottomNavigationBarItem(
                icon: Icon(Icons.home), 
                label: 'Compte')
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.amber[800],
            onTap: _onItemTapped,
          ),
        ));
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _title = _listScreens[index];
    });
  }

  void logout(context) {
    Navigator.pushReplacementNamed(context, '/login').then((result) {
      debugPrint('logging out...');
      UserPreferences().removeUser();
      Provider.of<UserProvider>(context, listen: false).removeUser();
    });
  }
}
