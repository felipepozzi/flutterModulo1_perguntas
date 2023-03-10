import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questionario.dart';
import './resultado.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaselecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor Favorita?',
      'respostas': [
        {'texto': 'Preto', 'pontuacao': '10'},
        {'texto': 'Vermelho', 'pontuacao': '5'},
        {'texto': 'Verde', 'pontuacao': '3'},
        {'texto': 'Branco', 'pontuacao': '1'},
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Coelho', 'pontuacao': '10'},
        {'texto': 'Cobra', 'pontuacao': '5'},
        {'texto': 'Elefante', 'pontuacao': '3'},
        {'texto': 'Leão', 'pontuacao': '1'},
      ],
    },
    {
      'texto': 'Qual é a sua cor Favorita?',
      'respostas': [
        {'texto': 'Maria', 'pontuacao': '10'},
        {'texto': 'João', 'pontuacao': '5'},
        {'texto': 'Leo', 'pontuacao': '3'},
        {'texto': 'Pedro', 'pontuacao': '1'},
      ],
    },
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaselecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaselecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaselecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Perguntas'),
          ),
          body: temPerguntaSelecionada
              ? Questionario(
                  perguntas: _perguntas,
                  perguntaSelecionada: _perguntaselecionada,
                  quandoResponder: _responder,
                )
              : Resultado(_pontuacaoTotal, _reiniciarQuestionario)),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
