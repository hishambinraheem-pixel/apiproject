import 'package:dio/dio.dart';
import 'package:flutter_application_1/models.dart';


  class ApiPost {
  final Dio dio = Dio();

  Future<String?> createpost(Postmodel poster) async {
    try {
      final response = await dio.post(
        "https://api.escuelajs.co/api/v1/auth/login",
        data: poster.toJson(),
      );

      final token = response.data["access_token"];
      print(token);

      return token;
    } catch (e) {
      print("Login error: $e");
      return null;
    }
  }
}

class ApiGet {
  final Dio dio = Dio();

  Future<Map<String, dynamic>?> getdetails(String token) async {
    try {
      final response = await dio.get(
        "https://api.escuelajs.co/api/v1/auth/profile",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      print(response.data);
      return response.data;
    } catch (e) {
      print("Profile error: $e");
      return null;
    }
  }
}

