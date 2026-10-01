
  import 'package:cinemax/core/networking/api_constants.dart';
import 'package:dio/dio.dart';
  import 'package:flutter_dotenv/flutter_dotenv.dart';

class DioFactory {
  static Dio getDio(){
    const duration = Duration(seconds: 30);
    final token = dotenv.env['TMDB_READ_ACCESS_TOKEN'];

    if (token == null || token.isEmpty){
      throw StateError('TMDB_READ_ACCESS_TOKEN is missing');
    }
    return Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: duration,
        sendTimeout: duration,
        receiveTimeout: duration,
        headers: {
          'Authorization': 'Bearer $token',
          'accept': 'application/json',
        }
      )
    );
  }
  }