import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import '../../core/constants/storage_keys.dart';
@lazySingleton
class SecureStorageService{
   final FlutterSecureStorage _storage =FlutterSecureStorage() ;

    Future<void> saveToken(String token) async{
      await _storage.write(
          key: StorageKeys.tokenKey,
          value: token
      );
    }

    Future<String?> getToken() async{
      return await _storage.read(
          key:StorageKeys.tokenKey
      );
    }
   Future<void> deleteToken() async {
     await _storage.delete(key: StorageKeys.tokenKey);
   }

   Future<void> clear() async {
     await _storage.deleteAll();
   }




}