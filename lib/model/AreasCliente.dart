import 'package:firstapi/firstapi.dart';
import 'package:firstapi/model/Areas.dart';
import 'package:firstapi/model/Clientes.dart';
import 'package:firstapi/model/ProductosAreasCliente.dart';

class AreasCliente extends ManagedObject<tblAreasCliente> implements tblAreasCliente{}
class tblAreasCliente{
  @primaryKey
  int idAreaCliente;
  int noEmpleados; 

  @Relate(#areacte)
  Areas area;

  @Relate(#areacte)
  Clientes cliente;

  ManagedSet<ProductosAreasCliente> prodareacte;
}