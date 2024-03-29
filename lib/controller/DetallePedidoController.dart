import 'package:firstapi/firstapi.dart';
import 'package:firstapi/model/DetallePedido.dart';
import 'package:firstapi/model/Productos.dart';

class DetallePedidoController extends ResourceController{

  DetallePedidoController(this.context);
  final ManagedContext context;
  
  @Operation.get('idpedido')
  Future<Response> getAllDetallePedido(@Bind.path('idpedido') int id) async {
    var detpedidosQuery = Query<Productos>(context);

    var subquery = detpedidosQuery.join(set: (p)=>p.detalle)
    ..where((d)=>d.pedido.idPedido).equalTo(id);
    
    final detpedidos = await detpedidosQuery.fetch();
    return Response.ok(detpedidos);
  }

  @Operation.post()
  Future<Response> insDetPedido() async{
    final detpedido = DetallePedido()..read(await request.body.decode(), ignore: ["idDetalle"] );
    final query = Query<DetallePedido>(context)..values = detpedido;
    final insertedDetPedido = await query.insert();
    return Response.ok(insertedDetPedido);
  }
}
