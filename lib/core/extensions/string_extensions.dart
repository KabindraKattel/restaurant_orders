extension StringExtension on String {
  String? tryAppend(String? str) {
    return str == null ? this : this + str;
  }

  String? tryPrepend(String? str) {
    return str == null ? this : str + this;
  }
}
