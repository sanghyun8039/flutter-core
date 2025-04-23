import 'package:dartz/dartz.dart';
import 'package:flutter_core/core/errors/failures.dart';

typedef DataMap = Map<String, dynamic>;
typedef ResultFuture<T> = Future<Either<AppFailure, T>>;
typedef ResultVoid = ResultFuture<void>;
