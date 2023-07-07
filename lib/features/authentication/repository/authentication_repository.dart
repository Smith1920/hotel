import 'dart:math';

import 'package:dio/dio.dart';

class AuthenticationRepository {
  final dio = Dio();
  Future<dynamic> sendOtp(String number) async {
    try {
      final response = await dio.post(
          'https://9ea9-49-249-44-114.ngrok-free.app/send-otp',
          data: {'countryCode': '+91', 'phoneNumber': number});
      return response;
    } catch (e) {
      print(e);
    }
  }
}
