class Validation {
  String? defaultValidation(value) {
    if (value!.isEmpty) {
      return ('This Field must not be empty');
    } else
      return null;
  }
}
