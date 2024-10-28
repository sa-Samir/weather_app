class ValidationHelper {
  static String? checkEmptyField(String? value) {
    if (value?.trim().isEmpty ?? true) {
      return 'Please Enter A Value';
    }
    return null;
  }
}
