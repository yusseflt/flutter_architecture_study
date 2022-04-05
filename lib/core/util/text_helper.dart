abstract class TextHelper {
  static String padNumberLeft(int number) {
    return number.toString().padLeft(3, '0');
  }

  static String upperFirstLetter(String text) {
    return "${text[0].toUpperCase()}${text.substring(1, text.length)}";
  }

  static String kilogramToPoundsConverter(double kilograms) {
    return (kilograms * 2.2046226218).toStringAsFixed(2);
  }

  static String metersToInches(double meters) {
    return (meters * 39.37008).toStringAsFixed(2).replaceAll('.', "'");
  }
}
