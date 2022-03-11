import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golf/config/application.dart';

part 'home.state.dart';

class HomeCubit extends Cubit<HomeState> {
  // MessengerService messengerService = MessengerService();
  // NotificationService notificationService = NotificationService();

  HomeCubit() : super(HomeInitial()) {
    // hubConnection();
  }

  // Future<void> reLoad() async {
  //   emit(Loading());
  //   Application.countMessages = await messengerService.getUnReadMessages();
  //   emit(HavingNotification());
  //   emit(HavingNotification());
  // }

  // Future<void> hubConnection() async {
  //   Application.connection.on('ReceiveNotification', (receive) async {
  //     emit(Loading());
  //     Application.countNotifications = await notificationService.countUnReadNotification();
  //     emit(HavingNotification());
  //   });
  //   Application.connection.on('receiverMessage', (receive) async {
  //     emit(Loading());
  //     print("tin nhan: $receive");
  //     Application.countMessages = await messengerService.getUnReadMessages();
  //     emit(HavingMess());
  //   });
  // }
}
