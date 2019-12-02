import 'package:firstapi/firstapi.dart';
import 'package:firstapi/model/Pedidos.dart';
import 'package:firstapi/model/Usuarios.dart';

class Empleados extends ManagedObject<tblEmpleados> implements tblEmpleados{}
class tblEmpleados{

   @primaryKey
   int idEmpleado;
   String nomEmpleado;
   String apePatEmp;
   String apeMatEmp;

  @Column(indexed: true)
  DateTime fechaNac;
  @Column(unique: true)
  String emailEmp;

  ManagedSet<Pedidos> empleado;
  //ManagedSet<Usuarios> users;
  Usuarios users;
}