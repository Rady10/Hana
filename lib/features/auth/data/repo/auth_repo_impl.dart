import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/model/either.dart';
import '../../domain/models/user_model.dart';
import '../../domain/repo/auth_repo.dart';
import '../datasource/auth_remote_datasource.dart';

class AuthRepoImpl implements AuthRepo{

  final AuthRemoteDatasource authRemoteDatasource;

  AuthRepoImpl({
    required this.authRemoteDatasource,
  });

  @override
  Future<Either<Failure, UserModel>> loginWithGoogle() async {
   try{
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    final firebaseCredential = await FirebaseAuth.instance.signInWithCredential(credential);
    
    final firebaseToken = await firebaseCredential.user?.getIdToken();

    final request = await authRemoteDatasource.loginWithGoogle(firebaseToken!);

    return Either.right(request);

   } on DioException catch(e){
    return Either.left(AuthFailure(message: e.response?.data['error']));
   } on Exception catch(e){
    return Either.left(AuthFailure(message: 'Auth Failure'));
   }

  }

}