extension NumX on num {
  String neglectFractionZero([int fractionDigits = 2]) {
    if (fractionDigits < 0) {
      return toString();
    }
    final resultString = toStringAsFixed(fractionDigits);
    try {
      return num.tryParse(resultString.split(".").last) == 0
          ? resultString.split(".").first
          : resultString;
    } on StateError {
      return resultString;
    }
  }
}
