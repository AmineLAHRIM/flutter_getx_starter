import 'package:dartz/dartz.dart';
import 'package:flutter_getx_starter/app/core/error/exceptions.dart';
import 'package:flutter_getx_starter/app/core/error/failures.dart';
import 'package:flutter_getx_starter/app/core/network/network_info.dart';
import 'package:flutter_getx_starter/app/data/datasources/local/repos/local_example_repo.dart';
import 'package:flutter_getx_starter/app/data/datasources/remote/repos/remote_example_repo.dart';
import 'package:flutter_getx_starter/app/data/models/dto/example_dto.dart';
import 'package:flutter_getx_starter/app/data/models/example.dart';
import 'package:flutter_getx_starter/app/data/utils/pagination.dart';
import 'package:injectable/injectable.dart';

abstract class ExampleRepo {
  Future<Either<Failure, Pagination<Example>>> getExamples({ExampleDto? exampleDto});
}

@Injectable(as: ExampleRepo)
class ExampleRepoImpl implements ExampleRepo {
  NetworkInfo? networkInfo;
  LocalExampleRepo? localExampleRepo;
  RemoteExampleRepo? remoteExampleRepo;

  ExampleRepoImpl({this.networkInfo, this.localExampleRepo, this.remoteExampleRepo,});

  @override
  Future<Either<Failure, Pagination<Example>>> getExamples({ExampleDto? exampleDto})async {
    // TODO: implement getExamples
    if (await networkInfo!.isConnected) {
      try {
        Pagination<Example> paginationExample=Pagination<Example>();
        // HERE call RemoteExampleRepo that call Rest API
        return Right(paginationExample);
      } on HttpException catch (httpException) {
        return Left(HttpFailure(httpException.remoteMessageError));
      } on ServerException {
        return Left(ServerFailure());
      } on TokenException {
        return Left(TokenFailure());
      }
    } else {
      // TODO: implement local user repo
      return Left(ConnectionFailure());
    }
  }



}

