import 'package:firstapi/firstapi.dart';
import 'package:firstapi/model/AreasCliente.dart';
import 'package:firstapi/model/Productos.dart';

class ProductosAreasCliente extends ManagedObject<tblProductosAreasCliente> implements tblProductosAreasCliente{}
class tblProductosAreasCliente{
  @primaryKey
  int idProdAreaCliente;
  int consumo;

  @Relate(#prodareacte)
  AreasCliente areascliente;

  @Relate(#prodareacte)
  Productos producto;
}