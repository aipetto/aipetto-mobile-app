class ValidationMixin {
  String validateName(String value) =>
      value.isEmpty ? 'Please add a name' : null;
  String validatePattern(String value) {
    if (!value.contains('')) {
      return 'The pattern was not matched';
    }
    return null;
  }
}
