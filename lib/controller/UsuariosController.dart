import 'package:firstapi/firstapi.dart';
import 'package:firstapi/model/Usuarios.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class UsuariosController extends ResourceController{

  UsuariosController(this.context);
  final ManagedContext context;
  /*
  @Operation.get()
  Future<Response> getAllUsuarios() async {
    final usuariosQuery = Query<Usuarios>(context);
    final usuarios = await usuariosQuery.fetch();
    return Response.ok(usuarios);
  }

   @Operation.get('idusuario')
  Future<Response> getUsuarioByID(@Bind.path('idusuario') int id) async{

    final usuarioQuery = Query<Usuarios>(context)..where((a)=>a.idUsuario).equalTo(id);
    final usuario = await usuarioQuery.fetch();

    if( usuario == null ){
      return Response.notFound();
    }

    return Response.ok(usuario);
  }
*/
  @Operation.post()
  Future<Response> insUsuario() async{
    final usuario = Usuarios()..read(await request.body.decode(), ignore: ["idUsuario"] );
    final query = Query<Usuarios>(context)..values = usuario;
    final insertedUsuario = await query.insert();
    return Response.ok(insertedUsuario);
  }
/*
  @Operation.put('idusuario')
  Future<Response> updUsuario(@Bind.path('idusuario') int id) async{
    final usuario = Usuarios()..read(await request.body.decode());
    final query = Query<Usuarios>(context)..where((a) => a.idUsuario).equalTo(id)..values = usuario;
    final updatedUsuario = await query.updateOne();
    return Response.ok(updatedUsuario);
  }

  @Operation.delete('idusuario')
  Future<Response> delUsuario(@Bind.path('idusuario') int id) async{
    final query = Query<Usuarios>(context)..where((a)=>a.idUsuario).equalTo(id);
    final deletedUsuario = await query.delete();
    return Response.ok(deletedUsuario);
    }*/

  /*@Operation.post()
  Future<Response> createUser(@Bind.body() Usuarios user) async {
    // Check for required parameters before we spend time hashing
    if (user.username == null || user.password == null) {
      return Response.badRequest(
        body: {"error": "username and password required."});
    }

  user
    ..salt = AuthUtility.generateRandomSalt()
    ..hashedPassword = authServer.hashPassword(user.password, user.salt);
  return Response.ok(await Query(context, values: user).insert());
  }*/

  @Operation.get('user','pwd')
  Future<Response> loginUser(@Bind.path('user') String usuario, @Bind.path('pwd') String pwd ) async {

    const clientID = "com.mancera.local";
    final body = "username=$usuario&password=$pwd&grant_type=password";

    // Note the trailing colon (:) after the clientID.
    // A client identifier secret would follow this, but there is no secret, so it is the empty string.
    final clientCredentials = Base64Encoder().convert("$clientID:".codeUnits);

    final response = await http.post(
      "https://web-dart.herokuapp.com/auth/token",
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        "Authorization": "Basic $clientCredentials"
        },
        body: body
        );

    final json = jsonDecode(response.body);
    /*if(json['error']!=null)
      return Response.unauthorized();
    else*/
      return Response.ok(json);

  }
}