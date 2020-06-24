import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Controller/ControllerCep.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: GetX<ControllerStateCEP>(
              init: ControllerStateCEP(),
              builder: (_) {
                print("REBUILDDDDD");
                return Column(
                    children: <Widget>[
                  FlatButton(
                      child: Text(_.cepFieldState.value.toString()),
                      onPressed: null,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)),
                          labelText: "CEP",
                          hintText: "CEP",
                        ),
                        onChanged: (cep) {
                          if(cep.length == 9){
                          }
                        },
                      ),
                      TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                      labelText: _.cepFieldState.value.toString(),
                      hintText: _.cepFieldState.value.toString(),
                    ),
                  ),
                      FlatButton(
                          onPressed: (){
                            print(_.cepstate);
                            if(_.cepstate == CepFieldState.ZERADO){
                              print("AQUI");
                              _.cepFieldState.value = CepFieldState.BUSCANDO;
                              _.cepstate = CepFieldState.BUSCANDO;
                            } else {
                              _.cepstate = CepFieldState.ZERADO;
                            }
                          },
                          child: Text("Muda Estado")
                      )
                ]);
              },
            ),
          ),
        ),
      ),
    );
  }
}
