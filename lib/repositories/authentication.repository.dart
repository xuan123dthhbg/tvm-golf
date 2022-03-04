
import 'package:golf/config/application.dart';

class AuthenticationRepository {
  static Future<dynamic> login(Map<String, dynamic> params) {
    return Application.api.post('/api/Auth/login', params);
  }
}
