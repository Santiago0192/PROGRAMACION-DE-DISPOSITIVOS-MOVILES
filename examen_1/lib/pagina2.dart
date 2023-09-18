import 'package:flutter/material.dart';
import 'dart:math';
import 'main.dart';

class Pagina2 extends StatefulWidget {
  final String txt;

  const Pagina2({super.key, required this.txt});

  @override
  _Pagina2State createState() => _Pagina2State();
}

class _Pagina2State extends State<Pagina2> {
  int randomValue = 0;

  void RandomNum() {
    final random = Random();
    final randomNumber = random.nextInt(999) + 1;

    setState(() {
      randomValue = randomNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Página 2'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Colors.white],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 24.0),
              const Text(
                'Genere número random',
                style: TextStyle(
                  color: Color.fromARGB(255, 136, 48, 153),
                  fontSize: 19.0,
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                '$randomValue',
                style: const TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.red
                ),
              ),
              ElevatedButton(
                onPressed: RandomNum,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
                child: const Text('Generar', style: TextStyle(color: Colors.black)),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop('${widget.txt}$randomValue');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
                child: const Text('Guardar', style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}