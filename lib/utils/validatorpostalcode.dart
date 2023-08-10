extension PostcodeValidator on String {
  bool isValidPostalCode() {
    return RegExp(r'^[0-9]{5}$')
        .hasMatch(this);
  }
}
