import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicare/Themes/size_config.dart';
import 'package:medicare/bloc/register_bloc.dart';
import 'package:medicare/ui/form_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Health Care',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: LayoutBuilder(
        builder: (context,constraints){
          return OrientationBuilder(
            builder: (context,orientation){
              SizeConfig().init(constraints,orientation);
              return  FormPage();
            },
          );
        },
      ),
    );
  }
}

