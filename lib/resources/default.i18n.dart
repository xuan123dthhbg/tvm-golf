import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {
  String get i18n => localize(this, _t);
  static var _t = Translations.byLocale("en_us") +
      {
        "vi_vn": {
          "Email or password invalid" : "Sai tài khoản hoặc mật khẩu",
          "Invalid email" : "Email không khả dụng",
          'This field is required': 'Trường này không được bỏ trống'
        }
      };
}
