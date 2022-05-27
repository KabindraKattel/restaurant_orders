extension NumX on num {
  String neglectFractionZero() {
    try {
      return toString().split(".").last == "0"
          ? toString().split(".").first
          : toString();
    } on StateError {
      return toString();
    }
  }
}
