import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() quandoSelecionado;

  Resposta(this.texto, this.quandoSelecionado);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Colors.blue, onPrimary: Colors.black),
          child: Text(texto),
          onPressed: quandoSelecionado),
    );
  }
}
