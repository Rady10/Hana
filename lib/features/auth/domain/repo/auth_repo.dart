import '../../../../core/failure/failure.dart';
import '../../../../core/model/either.dart';
import '../models/user_model.dart';

abstract class AuthRepo{
  Future<Either<Failure, UserModel>> loginWithGoogle();
}