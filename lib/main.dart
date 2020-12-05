import 'package:flutter/material.dart';
import 'package:popi/Screens/Account_Creation/account_creation_screen.dart';
import 'package:popi/Screens/Home/home_screen.dart';
import 'package:popi/Screens/Login/login_screen.dart';
import 'package:popi/Screens/Password_Recovery/passowrd_recovery_screen.dart';
import 'package:popi/api/AuthProvider.dart';
import 'package:popi/constraints.dart';
import 'package:popi/models/Compte.dart';
import 'package:popi/providers/UserProvider.dart';
import 'package:popi/shared_preferences/UserPreferences.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    Future<Compte> getUserData() => UserPreferences().getUser();

    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AuthProvider()),
          ChangeNotifierProvider(create: (_) => UserProvider()),
        ],
        child: MaterialApp(
          title: 'POPI app',

          // Remove debug banner
          debugShowCheckedModeBanner: false,

          home: FutureBuilder(
            future: getUserData(),
            builder: (context, snapshot) {

              if(snapshot.connectionState == ConnectionState.done){
                if(snapshot.hasError){
                  debugPrint('Error: ${snapshot.error}');
                }else if(snapshot.data.email == null){
                  return LoginScreen();
                }else{
                  return HomeScreen();
                }
              }
              return CircularProgressIndicator();
              

              /*switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return CircularProgressIndicator();
                default:
                  if (snapshot.hasError)
                    return Text('Error: ${snapshot.error}');
                  else if (snapshot.data.email == null)
                    return LoginScreen();
                  else
                    UserPreferences().removeUser();
                  return HomeScreen(user: snapshot.data);
              }*/
            },
          ),

          // App routes
          routes: {
            // Set routes for using the Navigator.
            '/login': (context) => LoginScreen(),
            '/recoverPassword': (context) => PasswordRecoveryScreen(),
            '/accountCreation': (context) => AccountCreationScreen(),
            '/home': (context) => HomeScreen()
          },

          // Default theme styles
          theme: ThemeData(
            // Default font family
            fontFamily: 'OpenSans',

            // Setting the default fontSizes
            textTheme: TextTheme(
                bodyText2: TextStyle(fontSize: 18.0, color: Colors.white)),

            // Setting the default colors
            primaryColor: kPrimaryColor,
            scaffoldBackgroundColor: kPrimaryColor,
          ),
        ));
  }
}
