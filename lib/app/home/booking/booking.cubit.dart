// import 'package:equatable/equatable.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_modular/flutter_modular.dart';
//
// class BookingCubit extends Cubit<BookingState> {
//   BookingServiceAPIS _bookingServiceAPIS = BookingServiceAPIS();
//
//   late List<Booking> bookingList;
//   int startIndex = 0;
//   Position? currentPosition;
//
//   BookingCubit() : super(BookingInitial()) {
//   }
//
//   Future<bool> getProductLocation() async {
//     try {
//       await getCurrentLocation();
//       startIndex = 0;
//       emit(Loading());
//       bookingList = await _bookingServiceAPIS.getProducts(startIndex, currentPosition!.longitude, currentPosition!.latitude);
//       emit(Loaded());
//       return true;
//     } on NetworkException {
//       emit(NetworkError());
//       return false;
//     }
//   }
//
//   Future<void> getCurrentLocation() async {
//     currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
//   }
//
//   Future<bool> loadMoreProduct() async {
//     try {
//       startIndex += 10;
//       List<Booking> res = await _bookingServiceAPIS.getProducts(startIndex, currentPosition!.longitude, currentPosition!.latitude);
//       bookingList.addAll(res);
//       emit(Loading());
//       emit(Loaded());
//       return true;
//     } on NetworkException {
//       emit(NetworkError());
//       return false;
//     }
//   }
//
//   Future<bool> checkLike(String id, int index) async {
//     try {
//       await _bookingServiceAPIS.checkLike(id).then((value) => value ? setLike(index) : Application.toast.showToastFailed("Network Exception".i18n));
//       return true;
//     } on NetworkException {
//       emit(NetworkError());
//       return false;
//     }
//   }
//
//   void setLike(int index) {
//     emit(LikeChanging());
//     bookingList[index].isFavorite = !bookingList[index].isFavorite!;
//     emit(LikeChanged(bookingList[index].isFavorite));
//   }
//
//   void reLoad() {
//     emit(Loading());
//     emit(Loaded());
//   }
//
//   void transition(String? id, String? name, BookingCubit bookingCubit) {
//     Map<String, dynamic> params = {
//       "id": id,
//       "title": name,
//       "bookingCubit": bookingCubit,
//     };
//     Modular.to.pushNamed(AppModule.home + HomeModule.booking + BookingModule.bookingField, arguments: params).whenComplete(() => reLoad());
//   }
// }
