import 'package:dartz/dartz.dart';
import 'package:degdeg/data/model/member_model.dart';
import '../providers/datasources/local_data_source.dart';
import '../providers/datasources/remote_data_source.dart';
import '../providers/error/exception.dart';
import '../providers/error/failure.dart';
import '../remote_urls.dart';

abstract class MemberRepository {
  Future<Either<Failure, MemberModel>> addMember(Map<String, dynamic> body);
}

class MemberRepositoryImp extends MemberRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;
  MemberRepositoryImp(
      {required this.remoteDataSource, required this.localDataSource});

  @override
  Future<Either<Failure, MemberModel>> addMember(
      Map<String, dynamic> body) async {
    try {
      final resp = await remoteDataSource.httpPost(
          url: RemoteUrls.addMember, body: body);
      final mapList = resp['data'];
      final result = MemberModel.fromMap(mapList);
      localDataSource.cacheUserResponse(result);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }
}
