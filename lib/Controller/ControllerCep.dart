import 'package:flutterappcep/model/ClienteModel.dart';
import 'package:flutterappcep/repositories/RepoCep.dart';
import 'package:get/get.dart';

enum CepFieldState { ZERADO, BUSCANDO, INCOMPLETO, INVALIDO, SUCESSO }

class CepRX extends RxController {
  var cepObj = Rx<ControllerCEP>();

  CepRX () {
    cepObj.value = new ControllerCEP();
  }
  // CepFieldState get teste => cepObj.value.cepFieldState;
  // set teste(CepFieldState value) => cepObj.value.cepFieldState = value;

  String testeobj() {
    cepObj.value = new ControllerCEP(cepFieldState: CepFieldState.ZERADO);
    return cepObj.value.cepFieldState.toString();
  }

  void ceP(String cep) {
    cepObj.value.searchCep(cep);
  }
}

class ControllerCEP {
  ControllerCEP({this.cepFieldState, this.cep, this.address}) {
    cepFieldState = CepFieldState.ZERADO;
  }

  CepFieldState cepFieldState;
  String cep;
  Endereco address;

  void searchCep(String cep) async {
    final CepResponse cepResponse = await getAddressFromAPI(cep);

    if (cepResponse.success) {
      print("SUCESSO CEP");
      //cepFieldState.value = CepFieldState.SUCESSO;
      ControllerCEP(
        cepFieldState: CepFieldState.SUCESSO,
        cep: cep,
        address: cepResponse.result,
      );
    } else {
      ControllerCEP(
        //cepFieldState: cepFieldState,
        cep: cep,
      );
    }
  }
}
