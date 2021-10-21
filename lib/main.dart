import "package:flutter/material.dart";
import 'package:personal_expenses/screen/home.dart';
// import "package:flutter/services.dart"; //To not desactivate the landscape mode

void main() {
  /**These towe first lines of code allow us to disable the landscape mode. 
   *   WidgetsFlutterBinding.ensureInitialized();
   *   SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
   */

  return runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Personal Expenses",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: "Quicksand",
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText2: const TextStyle(
                fontFamily: "OpenSans",
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              headline6: const TextStyle(
                fontFamily: "Quicksand",
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      home: const MyHomePage(),
    );
  }
}
