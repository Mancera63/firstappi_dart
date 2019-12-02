import 'package:aqueduct/managed_auth.dart';
import 'package:firstapi/firstapi.dart';
import 'package:firstapi/model/Empleados.dart';

class Usuarios extends ManagedObject<Usuario> implements Usuario, ManagedAuthResourceOwner<Usuario>{
  @Serialize(input: true, output: false)
  String password;
}
class Usuario extends ResourceOwnerTableDefinition{
  @Relate(#users)
  Empleados empleado;
}