class FormValidation {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'هذا الحقل مطلوب';
    }
    String pattern = r'^[\w-]+@([\w-]+\.)+[\w-]{2,4}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'البريد الإلكتروني غير صالح';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'كلمة المرور مطلوبة';
    }
    if (value.length < 6) {
      return 'يجب أن تتكون كلمة المرور من 6 أحرف على الأقل';
    }
    return null;
  }
}
