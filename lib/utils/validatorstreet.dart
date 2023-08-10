extension StreetValidator on String {
  bool isValidStreet() {
    return RegExp(r'^([a-zA-Z]+?\s\d+[a-zA-Z]$)|([a-zA-Z]+?\s\d+$)')
        .hasMatch(this);
  }
}

