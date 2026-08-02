import 'package:dio/dio.dart';

import '../../core/constants/error_constants.dart';

class ErrorExtractors {
  ErrorExtractors._();
  static String extractErrorMessage(Exception error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.transformTimeout:
          return ErrorConstants.connectionTimeout;
        case DioExceptionType.connectionError:
          return ErrorConstants.noInternetConnection;
        case DioExceptionType.badCertificate:
          return ErrorConstants.invalidCertificate;
        case DioExceptionType.cancel:
          return ErrorConstants.requestCancelled;
        case DioExceptionType.badResponse:
          return _extractServerMessage(error.response?.statusCode,error.response?.data);
        default:
          return ErrorConstants.connectionError;
      }
    } else {
      return ErrorConstants.somethingWentWrong;
    }
  }

  static String _extractServerMessage(int? statusCode, dynamic data) {
    // switch (statusCode) {
    //   case 400:
    //   case 401:
    //   case 403:
    //   case 404:
    //   case 409:
    //     return 'Something went wrong, please try again.';
    //   case 422:
    //     return 'No Data Found. ';
    //   case 500:
    //   case 502:
    //   case 503:
    //     return 'Internal server error, please try again later.';
    //   default:
    //     return 'Something went wrong, please try again.';
    // }
    /////////////
    String message = ErrorConstants.somethingWentWrong;
    if(data is Map ){
       message = data['message']?? message;
    }
    return message;
  }
}