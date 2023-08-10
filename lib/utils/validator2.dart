extension EmailValidator on String {
  bool isValidNumber() {
    return RegExp(
        '[0-9+]+[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
        .hasMatch(this);
  }
}


