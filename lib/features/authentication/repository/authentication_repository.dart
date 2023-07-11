import 'package:dio/dio.dart';

class AuthenticationRepository {
  final dio = Dio();
  Future<dynamic> sendOtp(String number) async {
    try {
      final response = await dio.get(
          "https://a131-103-164-204-243.ngrok-free.app/auth/send-otp?countryCode=+91&phoneNumber=$number");
      return response;
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> verifyOtp(String otp) async {
    try {
      final response = await dio.post(
          'https://a131-103-164-204-243.ngrok-free.app/auth/verify-otp?otp=$otp');
      print(otp);
      return response;
    } catch (e) {
      print(e);
    }
  }
}
