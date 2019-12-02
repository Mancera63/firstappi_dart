import 'package:aqueduct/managed_auth.dart';
import 'package:firstapi/controller/RegisterController.dart';
import 'package:firstapi/model/Usuarios.dart';

import 'controller/AreasClienteController.dart';
import 'controller/AreasController.dart';
import 'controller/ClientesController.dart';
import 'controller/DetallePedidoController.dart';
import 'controller/EmpleadosController.dart';
import 'controller/PedidosController.dart';
//import 'controller/ProductosAreasClienteController.dart';
import 'controller/ProductosController.dart';
import 'controller/UsuariosController.dart';
import 'firstapi.dart';

/// This type initializes an application.
///
/// Override methods in this class to set up routes and initialize services like
/// database connections. See http://aqueduct.io/docs/http/channel/.
class FirstapiChannel extends ApplicationChannel {
  /// Initialize services in this method.
  ///
  /// Implement this method to initialize services, read values from [options]
  /// and any other initialization required before constructing [entryPoint].
  ///
  /// This method is invoked prior to [entryPoint] being accessed.
  
  // Contexto para las conexiones a la base de datos
  ManagedContext context;

  AuthServer authServer;
  
  @override
  Future prepare() async {
    logger.onRecord.listen((rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));
  
    final dataModel = ManagedDataModel.fromCurrentMirrorSystem();
    //final persistenStore = PostgreSQLPersistentStore.fromConnectionInfo("root", "passroot", "127.0.0.1", 5432, "epp_db");
    final persistenStore = PostgreSQLPersistentStore.fromConnectionInfo("wqicaqnkirqekv", "030dbd3417da4ad8f0b36e49cda3d02780b42f0da8bc73867bee39021fddbeec", "ec2-107-20-239-47.compute-1.amazonaws.com", 5432, "d55d6kkmsjk3jg");
    context = ManagedContext(dataModel,persistenStore);

    final authStorage = ManagedAuthDelegate<Usuarios>(context);
    authServer = AuthServer(authStorage);
  }

  /// Construct the request channel.
  ///
  /// Return an instance of some [Controller] that will be the initial receiver
  /// of all [Request]s.
  ///
  /// This method is invoked after [prepare].
  @override
  Controller get entryPoint {
    final router = Router();

    // Prefer to use `link` instead of `linkFunction`.
    // See: https://aqueduct.io/docs/http/request_controller/
    router.route("/productos[/:idproducto]").link( () => ProductosController(context) ); 
    router.route("/pedidos[/:idpedido]").link( () => PedidosController(context) ); 
    router.route("/clientes[/:idcliente]").link( () => ClientesController(context) );
    router.route("/areas[/:idarea]").link( () => AreasController(context) );
    router.route("/detallepedido[/:iddetped]").link( () => DetallePedidoController(context) );
    router.route("/areascliente[/:idareacliente]").link( () => AreasClienteController(context) );
    //router.route("/productosareascliente[/:idproductoareacliente]").link( () => ProductosAreasClienteController(context) );
    //router.route("/auth/token").link( () => AuthController(authServer) );
    router.route("/register").link(() => RegisterController(context,authServer));
    router.route("/auth/token").link(() => AuthController(authServer));
    router.route("/usuarios[/:user/:pwd]").link( () => UsuariosController(context) );
    return router;
  }
}