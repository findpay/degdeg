import 'package:dartz/dartz.dart';
import 'package:degdeg/data/model/acoount_model.dart';
import '../providers/datasources/remote_data_source.dart';
import '../providers/error/exception.dart';
import '../providers/error/failure.dart';
import '../remote_urls.dart';

abstract class AccountRepository {
  Future<Either<Failure, List<AccountsModel>>> getAccounts();
  Future<Either<Failure, dynamic>> saveAccounts(Map<String,dynamic> body);
}

class AccountRepositoryImp extends AccountRepository {
  final RemoteDataSource remoteDataSource;
  AccountRepositoryImp({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<AccountsModel>>> getAccounts() async {
    try {
      final resp = await remoteDataSource.httpGet(url: RemoteUrls.getSampleAccounts);
      final mapList = resp['data'] as List;
       final result =
          List<AccountsModel>.from(mapList.map((e) => AccountsModel.fromMap(e)));
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

   @override
  Future<Either<Failure, dynamic>> saveAccounts(Map<String,dynamic> body) async {
    try {
      final resp = await remoteDataSource.httpPost(url: RemoteUrls.saveAcounts,body: body);
      final mapList = resp['data'];
     
      return Right(mapList);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }
}
