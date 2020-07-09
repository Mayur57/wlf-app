import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

/// This file contains the necessary processing for the app UI to be scalable
/// across different screen sizes and orientations. In short, the file takes the
/// screen constraint values and divides it into 100 parts. Consequently, the
/// screen area gets divided into blocks of size one tenth the size of the screen.
///
/// Multipliers hold this value and therefore scale the object that they are used with
///
/// To know more about this technique and to learn how to use multipliers,
/// visit the following links to the tutorial and github link to the original creator:
///
/// YOUTUBE TUTORIAL: https://youtu.be/afBmGC63iIQ
///
/// GITHUB LINK: https://github.com/TechieBlossom/learning_platform_app


class SizeConfig{
  static double _screenWidth;
  static double _screenHeight;
  static double _blockWidth;
  static double _blockHeight;

  //Multipliers are the variables that hold the value for the factors by which
  //a said widget will be scaled.
  static double textSizeMultiplier;
  static double imageSizeMultiplier;
  static double heightSizeMultiplier;
  static double widthSizeMultiplier;

  void initScaler(BoxConstraints constraints, Orientation orientation){
    if(orientation == Orientation.portrait){
      ///User screen is in Portrait mode
      _screenWidth = constraints.maxWidth;
      _screenHeight = constraints.maxHeight;
    } else{
      ///User screen is in Landscape mode
      _screenWidth = constraints.maxHeight;
      _screenHeight = constraints.maxWidth;
    }

    ///Divide the screen space into blocks of heights and widths scaled down to 10%
    ///Hence, screen is converted to a grid of said blocks
    _blockWidth = _screenWidth * 0.01;
    _blockHeight = _screenHeight * 0.01;


    ///The multiplier values are assigned after processing the screen constraints
    textSizeMultiplier = _blockHeight;
    imageSizeMultiplier = _blockWidth;
    heightSizeMultiplier = _blockHeight;
    widthSizeMultiplier = _blockWidth;

    ///Printing the block sizes to get an idea for multiplier values
    print(_blockHeight);
    print(_blockWidth);
  }
}

