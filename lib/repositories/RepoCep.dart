import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutterappcep/model/ClienteModel.dart';

Future<CepResponse> getAddressFromAPI(String postalCode) async {

  final String endpoint =
      'http://viacep.com.br/'
      'ws/${postalCode.replaceAll('.', '').replaceAll('-', '')}/json/';

  try {
    final Response response = await Dio().get<Map>(endpoint);

    if(response.data.containsKey('erro') && response.data['erro']){
      return CepResponse.error(
          error: CepError(
              code: -1,
              message: 'CEP inválido'
          )
      );
    }

    final Endereco endereco = Endereco(
      logradouro: response.data['logradouro'],
      bairro: response.data['bairro'],
      localidade: response.data['localidade'],
      cep: response.data['cep'],
      uf: response.data['uf'],
      complemento: response.data['complemento'],
      unidade: response.data['unidade'],
    );

    return CepResponse.success(result: endereco);
  } on DioError catch (e){
    return CepResponse.error(
        error: CepError(
            code: -1,
            message: 'Falha ao contactar VIACEP'
        )
    );
  }
}

class CepError{

  CepError({
    @required this.code,
    @required this.message
  });

  final int code;
  final String message;

}

class CepResponse {

  CepResponse.success({this.result}){
    success = true;
  }

  CepResponse.error({this.error}){
    success = false;
  }

  bool success;
  dynamic result;
  CepError error;

}