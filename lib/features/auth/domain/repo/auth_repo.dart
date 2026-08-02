import '../../../../config/base_response/base_response.dart';
import '../entity/request/login/login_request.dart';
import '../entity/request/register/register_request.dart';
import '../entity/response/auth_response.dart';

abstract class AuthRepo {
  Future<BaseResponse<AuthResponse>> login(LoginRequest loginRequest);
  Future<BaseResponse<AuthResponse>> register(RegisterRequest registerRequest);

}