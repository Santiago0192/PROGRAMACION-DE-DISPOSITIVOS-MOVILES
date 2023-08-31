import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 64, 119, 221)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'App ITESO'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool likeSelected = false;
  bool mailSelected = false;
  bool addcallSelected = false;
  bool directionsSelected = false;

  void _incrementCounter() {
      if (likeSelected) {
        _counter++;
      } else {
        _counter--;
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Image.network('https://medios.iteso.mx/boletines/seguridad/mapa_grande.jpg'),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'El ITESO, Universidad Jesuita de Guadalajara',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'San Pedro Tlaquepalque, Jal.',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                        isSelected: likeSelected,
                        iconSize: 20,
                        icon: const Icon(Icons.thumb_up, color: Colors.black),
                        selectedIcon: const Icon(Icons.thumb_up, color: Colors.indigo),
                        onPressed: () {
                          setState(() {
                            likeSelected = !likeSelected;
                            _incrementCounter();
                          });
                      },
                      ),
                    Text(
                          '$_counter',
                          style: const TextStyle(fontSize: 12),
                        ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    IconButton(
                      isSelected: mailSelected,
                      icon: const Icon(Icons.mail, color: Colors.black),
                      selectedIcon: const Icon(Icons.mail, color: Colors.indigo),
                      onPressed: () {
                        final snackBar = SnackBar(
                          content: Text('Puedes encontrar comida en sus cafeterías'),
                          duration: Duration(seconds: 2), // You can customize the duration
                        );
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        setState(() {
                          mailSelected = !mailSelected;
                        });
                      },
                        iconSize: 40,
                      ),
                    const Text(
                          'Correo',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                        isSelected: addcallSelected,
                        icon: const Icon(Icons.add_call, color: Colors.black),
                        selectedIcon: const Icon(Icons.add_call, color: Colors.indigo),
                        onPressed: () {
                          final snackBar = SnackBar(
                            content: Text('Puedes pedir información en rectoría'),
                            duration: Duration(seconds: 2), // You can customize the duration
                          );
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          setState(() {
                            addcallSelected = !addcallSelected;
                          });
                        },
                        iconSize: 40,
                      ),
                    const Text(
                          'Llamada',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      isSelected: directionsSelected,
                      icon: const Icon(Icons.directions, color: Colors.black),
                      selectedIcon: const Icon(Icons.directions, color: Colors.indigo),
                      onPressed: () {
                        final snackBar = SnackBar(
                          content: Text('Se encuentra ubicado en Periférico Sur 8585'),
                          duration: Duration(seconds: 2), // You can customize the duration
                        );
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        setState(() {
                          directionsSelected = !directionsSelected;
                        });
                      },
                        iconSize: 40,
                      ),
                    const Text(
                          'Ruta',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20,),
            Container(
              padding: const EdgeInsets.all(20),
              child: const Text('''El ITESO, Universidad Jesuita de Guadalajara (Instituto TecnolÃ³gico y de Estudios Superiores de Occidente) es una universidad privada ubicada en la Zona Metropolitana de Guadalajara, Jalisco, MÃ©xico, fundada en el aÃ±o 1957.
La instituciÃ³n forma parte del Sistema Universitario Jesuita (SUJ) que integra a ocho universidades en MÃ©xico. La universidad es nombrada como la Universidad Jesuita de Guadalajara''', 
                    textAlign: TextAlign.justify,),
            ),
          ],
        ),
      ),
    );
  }
}
