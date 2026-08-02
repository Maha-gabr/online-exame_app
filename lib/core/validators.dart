import 'constants/validation_constant.dart';

class AppValidators {
  AppValidators._();

  static final _emailRegex = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  );
  static final _uppercaseRegex = RegExp(r'[A-Z]');
  static final _lowercaseRegex = RegExp(r'[a-z]');
  static final _numberRegex = RegExp(r'[0-9]');
  static final _specialRegex = RegExp(r'[#?!@$%^&*-]');
  static final _usernameRegex = RegExp(r'^[a-zA-Z0-9,.-]+$');
  static final _egyptianPhoneRegex = RegExp(r'^01[0-2,5][0-9]{8}$');

  static String? validateEmail(String? val) {
    if (val == null || val.isEmpty) {
      return ValidationConstants.emailRequired;
    }

    if (!_emailRegex.hasMatch(val)) {
      return ValidationConstants.invalidEmail;
    }

    return null;
  }
  static String? validatePassword(String? val) {
    if (val == null || val.isEmpty) {
      return ValidationConstants.passwordRequired;
    }

    if (val.length < 8) {
      return ValidationConstants.passwordMinLength;
    }

    if (!_uppercaseRegex.hasMatch(val)) {
      return ValidationConstants.passwordUppercase;
    }

    if (!_lowercaseRegex.hasMatch(val)) {
      return ValidationConstants.passwordLowercase;
    }

    if (!_numberRegex.hasMatch(val)) {
      return ValidationConstants.passwordNumber;
    }

    if (!_specialRegex.hasMatch(val)) {
      return ValidationConstants.passwordSpecialCharacter;
    }

    return null;
  }
  static String? validateConfirmPassword(
      String? val,
      String? password,
      ) {
    if (val == null || val.isEmpty) {
      return ValidationConstants.fieldRequired;
    }

    if (val != password) {
      return ValidationConstants.passwordsDoNotMatch;
    }

    return null;
  }

  static String? validateUsername(String? val) {
    if (val == null || val.isEmpty) {
      return ValidationConstants.fieldRequired;
    }

    if (!_usernameRegex.hasMatch(val)) {
      return ValidationConstants.invalidUsername;
    }

    return null;
  }
  static String? validateFullName(String? val) {
    if (val == null || val.isEmpty) {
      return ValidationConstants.fullNameRequired;
    }

    return null;
  }


  // static String? validatePhoneNumber(String? val) {
  //   if (val == null) {
  //     return 'this field is required';
  //   } else if (int.tryParse(val.trim()) == null) {
  //     return 'enter numbers only';
  //   } else if (val.trim().length != 11) {
  //     return 'enter value must equal 11 digit';
  //   } else {
  //     return null;
  //   }
  // }

  static String? validatePhoneNumber(String? val) {
    final phone = val?.trim();

    if (phone == null || phone.isEmpty) {
      return ValidationConstants.phoneRequired;
    }

    if (int.tryParse(phone) == null) {
      return ValidationConstants.numbersOnly;
    }

    if (phone.length != 11) {
      return ValidationConstants.phoneLength;
    }

    if (!_egyptianPhoneRegex.hasMatch(phone)) {
      return ValidationConstants.invalidEgyptianPhone;
    }

    return null;
  }




}