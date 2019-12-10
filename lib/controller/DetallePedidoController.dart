import 'package:firstapi/firstapi.dart';
import 'package:firstapi/model/DetallePedido.dart';
import 'package:firstapi/model/Productos.dart';

class DetallePedidoController extends ResourceController{

  DetallePedidoController(this.context);
  final ManagedContext context;
  
  @Operation.get()
  Future<Response> getAllDetallePedidos() async {
    final detalleQuery = Query<DetallePedido>(context);
    final detallepedidos = await detalleQuery.fetch();
    return Response.ok(detallepedidos);
  }
  
  @Operation.get('idpedido')
  Future<Response> getAllDetallePedido(@Bind.path('idpedido') int id) async {
    var detpedidosQuery = Query<Productos>(context);

    var subquery = detpedidosQuery.join(set: (p)=>p.detalle)
    ..where((d)=>d.pedido.idPedido).equalTo(id);
    
    final detpedidos = await detpedidosQuery.fetch();
    return Response.ok(detpedidos);
  }
  
  @Operation.get('iddetalle')
  Future<Response> getEmpleadoByID(@Bind.path('iddetalle') int id) async{

    final empleadoQuery = Query<DetallePedido>(context)..where((a)=>a.idDetalle).equalTo(id);
    final empleado = await empleadoQuery.fetch();

    if( empleado == null ){
      return Response.notFound();
    }

    return Response.ok(empleado);
  }


  @Operation.put('idDetalle')
  Future<Response> updEmpleado(@Bind.path('iddetalle') int id) async{
    final empleado = DetallePedido()..read(await request.body.decode());
    final query = Query<DetallePedido>(context)..where((a) => a.idDetalle).equalTo(id)..values = empleado;
    final updatedEmpleado = await query.updateOne();
    return Response.ok(updatedEmpleado);

  @Operation.post()
  Future<Response> insDetPedido() async{
    final detpedido = DetallePedido()..read(await request.body.decode(), ignore: ["idDetalle"] );
    final query = Query<DetallePedido>(context)..values = detpedido;
    final insertedDetPedido = await query.insert();
    return Response.ok(insertedDetPedido);
  }
}
