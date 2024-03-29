import 'package:firstapi/firstapi.dart';
import 'package:firstapi/model/Clientes.dart';
import 'package:firstapi/model/Pedidos.dart';

class PedidosController extends ResourceController{

  PedidosController(this.context);
  final ManagedContext context;
  
  @Operation.get()
  Future<Response> getAllPedidos() async {
    final pedidosQuery = Query<Clientes>(context)..join(set: (c) => c.pedido );
    final pedidos = await pedidosQuery.fetch();
    return Response.ok(pedidos);
  }

   @Operation.get('idpedido')
  Future<Response> getPedidoByID(@Bind.path('idpedido') int id) async{

    final pedidosQuery = Query<Pedidos>(context)..where((a)=>a.idPedido).equalTo(id);
    final pedido = await pedidosQuery.fetch();

    if( pedido == null ){
      return Response.notFound();
    }

    return Response.ok(pedido);
  }

  @Operation.post()
  Future<Response> insPedido() async{
    final pedido = Pedidos()..read(await request.body.decode(), ignore: ["idPedido"] );
    final query = Query<Pedidos>(context)..values = pedido;
    final insertedPedido = await query.insert();
    return Response.ok(insertedPedido);
  }

  @Operation.put('idpedido')
  Future<Response> updPedido(@Bind.path('idpedido') int id) async{
    final pedido = Pedidos()..read(await request.body.decode());
    final query = Query<Pedidos>(context)..where((a) => a.idPedido).equalTo(id)..values = pedido;
    final updatedPedido = await query.updateOne();
    return Response.ok(updatedPedido);
  }

  @Operation.delete('idpedido')
  Future<Response> delPedido(@Bind.path('idpedido') int id) async{
    final query = Query<Pedidos>(context)..where((a)=>a.idPedido).equalTo(id);
    final deletedPedido = await query.delete();
    return Response.ok(deletedPedido);
  }

}