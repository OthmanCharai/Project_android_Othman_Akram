import 'package:dio/dio.dart';

class LoginDio {
  static Dio dio = Dio();
  // initialise dio
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: "http://10.4.79.220:8000/",
        receiveDataWhenStatusError: true,
        //responseType : ResponseType.json,
      ),
    );
    //
  }
/*
// Login
 */
  static Future<Response> userLogin({
    required String url,
    required Map info,
  }) async {
    return await dio.post(
      url,
      data: info,
    );
  }
/*
// get User
 */
  static Future<Response> getUser({
    required String url,
    required String token,
  }) async {
    return await dio.get(url, options: Options(headers: {"Authorization":"Bearer $token"}));
  }
  /*
// Register
 */
static Future<Response> Register({
    required String url,
    required Map info,
  }) async {
    return await dio.post(
      url,
      data: info,
    );
  }

}
