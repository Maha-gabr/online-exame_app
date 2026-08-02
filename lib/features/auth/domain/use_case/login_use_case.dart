import 'package:injectable/injectable.dart';

import '../../../../config/base_response/base_response.dart';
import '../entity/request/login/login_request.dart';
import '../entity/response/auth_response.dart';
import '../repo/auth_repo.dart';
@lazySingleton
class LoginUseCase {
  final AuthRepo _authRepo;
 const LoginUseCase(this._authRepo);

  Future<BaseResponse<AuthResponse>> call(LoginRequest loginRequest) async {
   return await _authRepo.login(loginRequest);


 }



}