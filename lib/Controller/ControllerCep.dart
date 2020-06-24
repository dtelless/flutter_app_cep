import 'package:flutterappcep/model/ClienteModel.dart';
import 'package:flutterappcep/repositories/RepoCep.dart';
import 'package:get/get.dart';

enum CepFieldState { ZERADO, BUSCANDO, INCOMPLETO, INVALIDO, SUCESSO }

class ControllerStateCEP extends RxController {

  var cepFieldState = Rx<CepFieldState>();
  var endereco = Rx<Endereco>();
  var cep = "".obs;

  ControllerStateCEP({CepFieldState cepState, String codigoPostal, Endereco endereco});


  CepFieldState get cepstate => cepFieldState.value;
  set cepstate(CepFieldState value) => cepFieldState.value = value;

  void searchCep(String cep) async {
    final CepResponse cepResponse = await getAddressFromAPI(cep);

    if (cepResponse.success) {
      print("SUCESSO CEP");
      //cepFieldState.value = CepFieldState.SUCESSO;
      ControllerStateCEP(
        cepState: CepFieldState.SUCESSO,
        codigoPostal: cep,
        endereco: cepResponse.result,
      );
    } else {
      ControllerStateCEP(
        //cepFieldState: cepFieldState,
        codigoPostal: cep,
      );
    }
  }
}
