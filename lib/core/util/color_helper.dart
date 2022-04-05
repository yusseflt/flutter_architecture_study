import 'package:flutter/cupertino.dart';

abstract class ColorHelper {
  static const Map<String, Color> typeColors = {
    "bug": Color(0xFF9DC130),
    "dark": Color(0xFF5F606D),
    "dragon": Color(0xFF0773C7),
    "electric": Color(0xFFEDD53F),
    "fairy": Color(0xFFEF97E6),
    "fighting": Color(0xFFD94256),
    "fire": Color(0xFFF8A54F),
    "flying": Color(0xFF9BB4E8),
    "ghost": Color(0xFF6970C5),
    "grass": Color(0xFF5DBE62),
    "ground": Color(0xFFD78555),
    "ice": Color(0xFF7ED4C9),
    "normal": Color(0xFF9A9DA1),
    "poison": Color(0xFFB563CE),
    "psychic": Color(0xFFF87C7A),
    "rock": Color(0xFFCEC18C),
    "steel": Color(0xFF5596A4),
    "water": Color(0xFF559EDF),
  };

  static Color? getTypeColor(String typeName) {
    return typeColors[typeName];
  }
}
