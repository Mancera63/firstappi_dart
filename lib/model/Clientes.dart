import 'package:firstapi/firstapi.dart';
import 'package:firstapi/model/AreasCliente.dart';
import 'package:firstapi/model/Pedidos.dart';



class Clientes extends ManagedObject<tblClientes> implements tblClientes{}
class tblClientes{
  @primaryKey
  int idCliente;
  String nomCliente;
  String dirCliente;
  @Column(unique: true)
  String emailCliente;
  @Column(unique: true)
  String telCliente;

  ManagedSet<Pedidos> pedido;
  ManagedSet<AreasCliente> areacte;
}