import 'package:golf/app/home/home.cubit.dart';
import 'package:golf/models/golfer/golfer.dart';
import 'package:golf/utils/api.dart';
import 'package:golf/utils/custom_toast.dart';
import 'package:golf/utils/share_preferences.dart';

class Application {
  static late SpUtil sharePreference;
  static late API api;
  static late Toastify toast;
  static Golfer? golfer;
  static late int countMessages = 0;
  static late int countNotifications = 0;
  // static late HubConnection connection;
  // static NewsfeedCubit? newsfeedCubit;
  static HomeCubit homeCubit = HomeCubit();
}
