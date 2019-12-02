import 'dart:async';
import 'package:aqueduct/aqueduct.dart';
import 'package:firstapi/model/Usuarios.dart';

class RegisterController extends ResourceController{
  RegisterController(this.context,this.authServer);

  final ManagedContext context;
  final AuthServer authServer;

  @Operation.post()
  Future<Response> createUser(@Bind.body() Usuarios user) async {
    if (user.username == null || user.password == null){
      return Response.badRequest(
        body: {'error':'username and password required.'}
      );
    }

    user..salt = AuthUtility.generateRandomSalt()..hashedPassword = authServer.hashPassword(user.password, user.salt);
    return Response.ok(await Query(context, values:user).insert());
  }
}