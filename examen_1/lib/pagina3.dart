import 'package:flutter/material.dart';
import 'main.dart';

class Pagina3 extends StatelessWidget {
  const Pagina3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Página 3'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop('༼ つ ◕_◕ ༽つ');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
                child: const Text('༼ つ ◕_◕ ༽つ', style: TextStyle(color: Colors.black)),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop('( ͡° ͜ʖ ͡°)');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
                child: const Text('( ͡° ͜ʖ ͡°)', style: TextStyle(color: Colors.black)),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop('(~˘▾˘)~');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
                child: const Text('(~˘▾˘)~', style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
