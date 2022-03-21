import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {
  String get i18n => localize(this, _t);
  static var _t = Translations.byLocale("en_us") +
      {
        "vi_vn": {
          'Home': 'Trang chủ',
          'Extension': 'Tiện ích',
          'Notifications': 'Thông báo',
          'Profile': 'Cá nhân',
          'Login': 'Đăng nhập',
          'Register': 'Đăng ký',
          "Email or password invalid": "Sai tài khoản hoặc mật khẩu",
          'This field cannot be empty.': 'Trường này không được bỏ trống',
          "Don't have an account?": "Bạn chưa có tài khoản?",
          'Register now!': "Đăng ký ngay!",
          'First name': "Tên",
          'Last name': 'Họ',
          'Password': "Mật khẩu",
          'Enter your Handicap': 'Nhập điểm Handicap của bạn',
          'Please enter the correct format': 'Vui lòng nhập đúng định dạng',
          'Have had an account yet?': 'Đã có tài khoản?',
          'Discount': 'Khuyến mãi',
          'Favorite': 'Yêu thích',
          'Nearest': 'Gần nhất',
          'Optional': 'Tùy chọn'
        }
      };
}
