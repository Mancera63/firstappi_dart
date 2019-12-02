import 'package:firstapi/firstapi.dart';
import 'package:firstapi/model/Empleados.dart';

class EmpleadosController extends ResourceController{

  EmpleadosController(this.context);
  final ManagedContext context;
  
  @Operation.get()
  Future<Response> getAllEmpleados() async {
    final empleadosQuery = Query<Empleados>(context);
    final empleados = await empleadosQuery.fetch();
    return Response.ok(empleados);
  }

   @Operation.get('idempleado')
  Future<Response> getEmpleadoByID(@Bind.path('idempleado') int id) async{

    final empleadoQuery = Query<Empleados>(context)..where((a)=>a.idEmpleado).equalTo(id);
    final empleado = await empleadoQuery.fetch();

    if( empleado == null ){
      return Response.notFound();
    }

    return Response.ok(empleado);
  }

  @Operation.post()
  Future<Response> insEmpleado() async{
    final empleado = Empleados()..read(await request.body.decode(), ignore: ["idEmpleado"] );
    final query = Query<Empleados>(context)..values = empleado;
    final insertedEmpleado = await query.insert();
    return Response.ok(insertedEmpleado);
  }

  @Operation.put('idempleado')
  Future<Response> updEmpleado(@Bind.path('idempleado') int id) async{
    final empleado = Empleados()..read(await request.body.decode());
    final query = Query<Empleados>(context)..where((a) => a.idEmpleado).equalTo(id)..values = empleado;
    final updatedEmpleado = await query.updateOne();
    return Response.ok(updatedEmpleado);
  }

  @Operation.delete('idempleado')
  Future<Response> delEmpleado(@Bind.path('idempleado') int id) async{
    final query = Query<Empleados>(context)..where((a)=>a.idEmpleado).equalTo(id);
    final deletedEmpleado = await query.delete();
    return Response.ok(deletedEmpleado);
  }

}