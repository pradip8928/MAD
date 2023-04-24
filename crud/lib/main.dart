 import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:crud/page/addPage.dart';


void main() async{

WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();
runApp(MyApp());
}

class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        title: "Crud app",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          brightness: Brightness.dark
        ),
          home: AddPage(),
      );
    }
  
}