import 'package:firstapi/firstapi.dart';
import 'package:firstapi/model/Pedidos.dart';
import 'package:firstapi/model/Productos.dart';

class DetallePedido extends ManagedObject<tblDetallePedido> implements tblDetallePedido{}
class tblDetallePedido{
  @primaryKey
  int idDetalle;

  @Relate(#detalle)
  Productos producto;

  @Relate(#detalle)
  Pedidos pedido;

  double precio;
  double descuento;
  double cantidad;
}