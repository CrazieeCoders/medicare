import 'package:flutter/material.dart';
import 'package:medicare/Themes/size_config.dart';

class Style{

  Style._();

  static const Color inkBlueColor = const Color(0xFF1B1C77);
  static const Color whiteColor = const Color(0xFFFFFFFF);
  static const Color paleYellow = const Color(0xFFFFBE69);
  static const Color palePurple = const Color(0xFFAA7DFF);
  static const Color blackTextColor = const Color(0xFF686868);


  static double h = SizeConfig.heightMultiplier;
  static double w = SizeConfig.widthMultiplier;

  static final TextStyle appBarStyle =  TextStyle(
      fontFamily: 'Poppins',
      fontSize: 1.70*h,
      letterSpacing: 0.15,
      color: const Color(0xFF1B1C77),
      decoration: TextDecoration.none
  );


  static final TextStyle headerTextStyle = TextStyle(
      fontFamily: 'Poppins',
      fontSize:2.43*h,
      color: Color(0xFF32338C),
      decoration: TextDecoration.none
  );
  static final TextStyle subHeaderTextStyle = TextStyle(
      fontFamily: 'Poppins',
      fontSize: 2.07*h,
      color: Color(0xFF32338C),
      decoration: TextDecoration.none
  );
  static final TextStyle desc2TextStyle = TextStyle(
      fontFamily: 'Roboto',
      fontSize:  1.70*h,
      color: Color(0xFF828282)
  );

  static final TextStyle input2TextStyle = TextStyle(
      fontFamily: 'Roboto Bold',
      fontSize: 1.95*h,
      color: Color(0xFF262222)
  );

  static final TextStyle radioTextStyle = TextStyle(
      fontFamily: 'Roboto Bold',
      fontSize: 1.95*h,
      color: Color(0xFF262222)
  );
  static final TextStyle dropdownTextStyle = TextStyle(
    fontFamily: 'Roboto Bold',
    fontSize: 1.46*h,
    color: Color(0xFF262222),
  );


  static final TextStyle purpleHintTextStyle =  TextStyle(
      fontFamily: 'Roboto',
      fontSize: 1.31*h,
      color: const Color(0xFF1B1C77),
      decoration: TextDecoration.none
  );

  // Button Text Style

  static final TextStyle button2TextStyle =TextStyle(
      color:whiteColor,
      fontFamily:'Poppins',
      fontSize:1.95*h,
      decoration: TextDecoration.none

  );

  static final TextStyle button1TextStyle =TextStyle(
      color:whiteColor,
      fontFamily:'Poppins',
      fontSize:1.25*h,
      decoration: TextDecoration.none

  );



}