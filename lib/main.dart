import 'package:flutter/material.dart';
import 'package:note_app/screens/Home_screen.dart';
import 'package:note_app/screens/Page1.dart';
import 'package:note_app/screens/page2.dart';
import 'package:note_app/services/db_helper.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.dbHelper.initDB();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute:'/' ,
      routes: {
       '/':(context) => HomeScreen(),
       '/page1':(context) => Page1(),
       '/Page2':(context) => Page2()
      },

      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
