// To parse this JSON data, do
//
//     final clienteModel = clienteModelFromJson(jsonString);

import 'dart:convert';

ClienteModel clienteModelFromJson(String str) => ClienteModel.fromJson(json.decode(str));

String clienteModelToJson(ClienteModel data) => json.encode(data.toJson());

class ClienteModel {
  ClienteModel({
    this.nomeCompleto,
    this.cpf,
    this.datanascimento,
    this.email,
    this.celular,
    this.endereo,
  });

  String nomeCompleto;
  String cpf;
  String datanascimento;
  String email;
  String celular;
  Endereco endereo;

  factory ClienteModel.fromJson(Map<String, dynamic> json) => ClienteModel(
    nomeCompleto: json["nome completo"],
    cpf: json["cpf"],
    datanascimento: json["datanascimento"],
    email: json["email"],
    celular: json["celular"],
    endereo: Endereco.fromJson(json["endereço"]),
  );

  Map<String, dynamic> toJson() => {
    "nome completo": nomeCompleto,
    "cpf": cpf,
    "datanascimento": datanascimento,
    "email": email,
    "celular": celular,
    "endereço": endereo.toJson(),
  };
}

class Endereco {
  Endereco({
    this.cep,
    this.logradouro,
    this.complemento,
    this.bairro,
    this.localidade,
    this.uf,
    this.unidade,
    this.ibge,
    this.gia,
  });

  String cep;
  String logradouro;
  String complemento;
  String bairro;
  String localidade;
  String uf;
  String unidade;
  String ibge;
  String gia;

  factory Endereco.fromJson(Map<String, dynamic> json) => Endereco(
    cep: json["cep"],
    logradouro: json["logradouro"],
    complemento: json["complemento"],
    bairro: json["bairro"],
    localidade: json["localidade"],
    uf: json["uf"],
    unidade: json["unidade"],
    ibge: json["ibge"],
    gia: json["gia"],
  );

  Map<String, dynamic> toJson() => {
    "cep": cep,
    "logradouro": logradouro,
    "complemento": complemento,
    "bairro": bairro,
    "localidade": localidade,
    "uf": uf,
    "unidade": unidade,
    "ibge": ibge,
    "gia": gia,
  };
}
