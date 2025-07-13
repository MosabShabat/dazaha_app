class AppRegex {
  // تحقق من صحة البريد الإلكتروني
  static bool isEmailValid(String email) {
    const emailPattern = r'^.+@[a-zA-Z]+\.[a-zA-Z]+(\.[a-zA-Z]+)?$';
    return RegExp(emailPattern).hasMatch(email);
  }

  // تحقق من صحة كلمة المرور
  static bool isPasswordValid(String password) {
    const passwordPattern =
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{9,}$';
    return RegExp(passwordPattern).hasMatch(password);
  }

  // تحقق من صحة رقم الهاتف
  static bool isPhoneNumberValid(String phoneNumber) {
    const phonePattern = r'^(010|011|012|015)\d{8}$';
    return RegExp(phonePattern).hasMatch(phoneNumber);
  }

  // تحقق من وجود حرف صغير في كلمة المرور
  static bool hasLowerCase(String password) {
    const lowerCasePattern = r'(?=.*[a-z])';
    return RegExp(lowerCasePattern).hasMatch(password);
  }

  // تحقق من وجود حرف كبير في كلمة المرور
  static bool hasUpperCase(String password) {
    const upperCasePattern = r'(?=.*[A-Z])';
    return RegExp(upperCasePattern).hasMatch(password);
  }

  // تحقق من وجود رقم في كلمة المرور
  static bool hasNumber(String password) {
    const numberPattern = r'(?=.*\d)';
    return RegExp(numberPattern).hasMatch(password);
  }

  // تحقق من وجود رمز خاص في كلمة المرور
  static bool hasSpecialCharacter(String password) {
    const specialCharacterPattern = r'(?=.*[@$!%*?&])';
    return RegExp(specialCharacterPattern).hasMatch(password);
  }

  // تحقق من طول كلمة المرور
  static bool hasMinLength(String password) {
    const minLengthPattern = r'^.{9,}$';
    return RegExp(minLengthPattern).hasMatch(password);
  }

  // تحقق من صحة اسم المستخدم (يجب أن يحتوي على حروف وأرقام فقط، والطول من 4 إلى 20 حرفًا)
  static bool isUsernameValid(String username) {
    const usernamePattern = r'^[a-zA-Z0-9]{4,20}$';
    return RegExp(usernamePattern).hasMatch(username);
  }

  // تحقق من صحة عنوان URL
  static bool isUrlValid(String url) {
    const urlPattern =
        r'^https?:\/\/[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,}(\/[^\s]*)?$';
    return RegExp(urlPattern).hasMatch(url);
  }

  // تحقق من صحة تاريخ (بتنسيق YYYY-MM-DD)
  static bool isDateValid(String date) {
    const datePattern = r'^\d{4}-\d{2}-\d{2}$';
    return RegExp(datePattern).hasMatch(date);
  }

  // تحقق من صحة ZIP Code (الرمز البريدي) - نموذج أمريكي (XXXXX أو XXXXX-YYYY)
  static bool isZipCodeValid(String zipCode) {
    const zipCodePattern = r'^\d{5}(?:-\d{4})?$';
    return RegExp(zipCodePattern).hasMatch(zipCode);
  }
}
