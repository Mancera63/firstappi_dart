import 'package:firstapi/firstapi.dart';
//import 'package:firstapi/model/Productos.dart';
//import 'package:firstapi/model/AreasCliente.dart';
//import 'package:firstapi/model/ProductosAreasCliente.dart';

class ProductosAreasCliente extends ResourceController{

  ProductosAreasCliente(this.context);
  final ManagedContext context;
  /*
  @Operation.get()
  Future<Response> getAllProductosAreasCliente() async {
    final productosAreasClienteQuery = Query<ProductosAreasCliente>(context);
    final productosAreasCliente = await productosAreasClienteQuery.fetch();
    return Response.ok(productosAreasCliente);
  }

   @Operation.get('idproductoAreaCliente')
  Future<Response> getProductoAreaClienteByID(@Bind.path('idproductoAreaCliente') int id) async{

    final productoAreaClienteQuery = Query<ProductosAreasCliente>(context)..where((a)=>a.idProdAreaCliente).equalTo(id);
    final productoAreaCliente = await productoAreaClienteQuery.fetch();

    if( productoAreaCliente == null ){
      return Response.notFound();
    }

    return Response.ok(productoAreaCliente);
  }

  @Operation.post()
  Future<Response> insProductoAreaCliente() async{
    final productoAreaCliente = ProductosAreasCliente()..read(await request.body.decode(), ignore: ["idProdAreaCliente"] );
    final query = Query<ProductosAreasCliente>(context)..values = productoAreaCliente;
    final insertedProductoAreaCliente = await query.insert();
    return Response.ok(insertedProductoAreaCliente);
  }

  @Operation.put('idproductoAreaCliente')
  Future<Response> updProductoAreaCliente(@Bind.path('idproductoAreaCliente') int id) async{
    final productoAreaCliente = ProductosAreasCliente()..read(await request.body.decode());
    final query = Query<ProductosAreasCliente>(context)..where((a) => a.idProdAreaCliente).equalTo(id)..values = productoAreaCliente;
    final updatedProductoAreaCliente = await query.updateOne();
    return Response.ok(updatedProductoAreaCliente);
  }

  @Operation.delete('idproductoAreaCliente')
  Future<Response> delProductoAreaCliente(@Bind.path('idproductoAreaCliente') int id) async{
    final query = Query<ProductosAreasCliente>(context)..where((a)=>a.idProdAreaCliente).equalTo(id);
    final deletedProductoAreaCliente = await query.delete();
    return Response.ok(deletedProductoAreaCliente);
  }*/

}