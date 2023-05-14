import 'package:flutter/material.dart';


const List<Color> _colorThemes = [
  Colors.blue,
  Colors.orange,
  Colors.red,
  Colors.yellow,
  Colors.purple,
  Colors.pink,
];

class AppTheme {

final int selectedColor;

AppTheme({
   this.selectedColor = 0
}) : assert(selectedColor >= 0 && selectedColor<6, 'Colors must be 0 to 5');

  ThemeData theme(){
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor],
    );
  }
}