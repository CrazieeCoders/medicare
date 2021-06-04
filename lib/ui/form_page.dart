import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicare/Themes/size_config.dart';
import 'package:medicare/Themes/style.dart';
import 'package:medicare/bloc/register_bloc.dart';

import 'form_widget.dart';


class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {

  double h = SizeConfig.heightMultiplier;
  double w = SizeConfig.widthMultiplier;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Medical Information Request Form', style: Style.appBarStyle),
          backgroundColor: Style.paleYellow,
          elevation: 0.0,
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Style.paleYellow,
                    Style.palePurple,
                  ],
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.fromLTRB(w*3.91, 0.0, w*3.91, h*1.95),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.white,
                ),
                child: ListView(
                  children: [
                     BlocProvider<RegisterBloc>(
                         create: (context) => RegisterBloc(),
                         child: AppForm()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
