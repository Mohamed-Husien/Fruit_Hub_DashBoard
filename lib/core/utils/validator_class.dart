class Validators {
  /// Required
  static String? required(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'هذا الحقل مطلوب';
    }
    return null;
  }

  /// Email
  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'لا بد من إدخال البريد الإلكتروني';
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegex.hasMatch(value)) {
      return ' البريد الإلكتروني غير صالح';
    }

    return null;
  }

  /// Password
  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return ' كلمة المرور مطلوبة';
    }

    if (value.length < 8) {
      return 'كلمة المرور يجب أن تكون على الأقل 8 أحرف';
    }

    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'كلمة المرور يجب أن تحتوي على حرف كبير';
    }

    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'كلمة المرور يجب أن تحتوي على حرف صغير';
    }

    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'كلمة المرور يجب أن تحتوي على رقم';
    }

    return null;
  }

  /// Confirm Password
  static String? confirmPassword(String? value, String password) {
    if (value != password) {
      return 'كلمات المرور غير متطابقة';
    }
    return null;
  }

  /// Name
  static String? name(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'الاسم مطلوب';
    }

    if (value.length < 3) {
      return 'الاسم يجب أن يكون على الأقل 3 أحرف';
    }

    return null;
  }

  /// Phone
  static String? phone(String? value) {
    if (value == null || value.isEmpty) {
      return 'رقم الهاتف مطلوب';
    }

    final phoneRegex = RegExp(r'^\d{11}$');

    if (!phoneRegex.hasMatch(value)) {
      return 'رقم الهاتف غير صحيح';
    }

    return null;
  }

  /// Min Length (generic)
  static String? minLength(String? value, int length) {
    if (value == null || value.length < length) {
      return 'Minimum $length characters required';
    }
    return null;
  }
}
