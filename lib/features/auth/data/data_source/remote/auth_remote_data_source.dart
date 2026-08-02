import '../../../../../config/base_response/base_response.dart';
import '../../models/request/login/login_request_dto.dart';
import '../../models/request/register/register_request_dto.dart';
import '../../models/response/auth_response_dto.dart';

abstract class AuthRemoteDataSource {
  Future<BaseResponse<AuthResponseDto>> login(LoginRequestDto loginRequestDto);
  Future<BaseResponse<AuthResponseDto>> register(RegisterRequestDto registerRequestDto);
}