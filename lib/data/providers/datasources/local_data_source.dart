
import 'package:degdeg/data/model/member_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/app_constants.dart';
import '../error/exception.dart';

abstract class LocalDataSource {
  MemberModel getUserResponseModel();
  Future<bool> cacheUserResponse(MemberModel userLoginResponseModel);
  Future<bool> clearUserProfile();
}

class LocalDataSourceImpl implements LocalDataSource {
  final SharedPreferences sharedPreferences;

  LocalDataSourceImpl({required this.sharedPreferences});

  @override
  MemberModel getUserResponseModel() {
    final jsonString =
        sharedPreferences.getString(cachedUserResponseKey);
    if (jsonString != null) {
      return MemberModel.fromJson(jsonString);
    } else {
      throw const DatabaseException('Not cached yet');
    }
  }

  @override
  Future<bool> cacheUserResponse(MemberModel userLoginResponseModel) {
    return sharedPreferences.setString(
      cachedUserResponseKey,
      userLoginResponseModel.toJson(),
    );
  }

  @override
  Future<bool> clearUserProfile() {
    return sharedPreferences.remove(cachedUserResponseKey);
  }
}
