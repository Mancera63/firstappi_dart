
import 'package:firstapi/firstapi.dart';
import 'package:firstapi/model/AreasCliente.dart';

class Areas extends ManagedObject<tblAreas> implements tblAreas{}
class tblAreas{
  @primaryKey
  int idArea;

  @Column(unique: true)
  String nomArea;

  ManagedSet<AreasCliente> areacte;
}