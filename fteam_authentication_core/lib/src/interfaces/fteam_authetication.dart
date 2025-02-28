import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:fteam_authentication_core/src/domain/usecases/verify_sms_code.dart';
import '../../fteam_authentication_core.dart';
import '../domain/entities/logged_user.dart';
import '../domain/models/email_credencials.dart';
import '../infra/datasource/auth_datasource.dart';

abstract class FteamAuthetication {
  Future<Either<AuthFailure, Unit>> deleteAccount();
  Future<Either<AuthFailure, LoggedUser?>> getLoggedUser();
  Future<Either<AuthFailure, LoggedUser?>> linkAccount(ProviderLogin provider);
  Future<Either<AuthFailure, LoggedUser?>> login(ProviderLogin provider);
  Future<Either<LogoutFailure, Unit>> logout();
  Future<Either<AuthFailure, LoggedUser?>> unLinkAccount(
      ProviderLogin provider);
  Future<Either<AuthFailure, LoggedUser?>> verifySmsCode(PhoneModel phone);
  Future<Either<AuthFailure, Unit>> sendEmailVerification();
  Future<Either<AuthFailure, Unit>> recoveryPassword(String email);
  Future<Either<AuthFailure, LoggedUser?>> signupWithEmail(
      {required EmailCredencials credencials});
  void registerAuthDatasource(AuthDatasource datasource);
  void changeRegister<T>(T instance);
}
