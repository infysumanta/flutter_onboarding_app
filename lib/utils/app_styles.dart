import 'package:flutter/material.dart';
import 'package:youtubeblog/utils/size_config.dart';

Color kPrimaryColor = const Color(0xfffc9d45);
Color kSecondaryColor = const Color(0xff573353);

final kTitle = TextStyle(
    color: kSecondaryColor,
    fontSize: SizeConfig.blockSizeH! * 7,
    fontFamily: 'Klasik');

final kTitle2 = TextStyle(
    color: kSecondaryColor,
    fontSize: SizeConfig.blockSizeH! * 6,
    fontFamily: 'Klasik');

final kBodyText1 = TextStyle(
    color: kSecondaryColor,
    fontSize: SizeConfig.blockSizeH! * 4.5,
    fontWeight: FontWeight.bold,
    fontFamily: 'Klasik');

final kBodyText2 = TextStyle(
    color: kSecondaryColor,
    fontSize: SizeConfig.blockSizeH! * 4,
    fontWeight: FontWeight.bold,
    fontFamily: 'Klasik');

final kBodyText3 = TextStyle(
    color: kSecondaryColor,
    fontSize: SizeConfig.blockSizeH! * 3.8,
    fontWeight: FontWeight.normal,
    fontFamily: 'Klasik');
