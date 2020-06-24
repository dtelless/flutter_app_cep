import 'package:flutter/material.dart';
import 'package:flutterappcep/Controller/ControllerCep.dart';
import 'package:get/get.dart';

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
      body: Container(
        child: Center(
          child: GetX<CepRX>(
            init: CepRX(),
            builder: (_) {
              return Column(
                  children: <Widget>[
                FlatButton(
                    child: Text(_.cepObj.value.cepFieldState.toString()),
                    onPressed: null,
                    ),
                //TextField(),
              ]);
            },
          ),
        ),
      ),
    );
  }
}
