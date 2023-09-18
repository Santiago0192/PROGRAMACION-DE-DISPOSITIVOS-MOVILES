import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'pagina2.dart';
import 'pagina3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 70, 150, 214)),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Tarea 1', pag2: '', pag3: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title, required this.pag2, required this.pag3});

  final String title;
  String pag2;
  String pag3;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   final TextEditingController _textFieldController = TextEditingController();

  @override
  void dispose() {
    _textFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(widget.title),
      ),
  body: Center(
          child: Column(
            children: [
              const Text(
                'Bienvenidos',
                style: TextStyle(
                  fontSize: 54.0,
                  fontFamily: 'Pacifico',
                  color: Color.fromARGB(255, 107, 107, 107)
                ),
              ),
              const SizedBox(height: 20.0),
              Image.asset('assets/dashdart.png'),
              const SizedBox(height: 40.0),
              const Text(
                'Seleccione la accion a realizar:',
                style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),
                
              ),
              const SizedBox(height: 80.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0.0),
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text(
                                    'Ingrese datos',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 20.0),
                                  TextField(
                                    controller: _textFieldController,
                                    inputFormatters: [LengthLimitingTextInputFormatter(10)],
                                    decoration: const InputDecoration(
                                      labelText: 'Ingrese palabra:',
                                    ),
                                  ),
                                  const SizedBox(height: 60.0),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(0),
                                          ),
                                        ),
                                        child: const Text('Cancelar'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          String enteredText = _textFieldController.text;
                                          Navigator.of(context).pop();
                                          Navigator.of(context)
                                              .push(MaterialPageRoute(builder: (context) => Pagina2(txt: enteredText)))
                                              .then((result) {
                                            if (result != null) {
                                              setState(() {
                                                widget.pag2 = result;
                                              });
                                            }
                                          })
                                          ;
                                        },
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(0),
                                          ),
                                        ),
                                        child: const Text('Aceptar'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                    ),
                    child: const Text('Pagina 2', style: TextStyle(color: Colors.white)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) => Pagina3()))
                            .then((result) {
                          if (result != null) {
                            setState(() {
                              widget.pag3 = result;
                            });
                          }
                        });
                      },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                    ),
                    child: const Text('Pagina 3', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
              const SizedBox(height: 60.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Pg.2 ==> ',
                    style: TextStyle(fontSize: 12.0),
                  ),
                  Text(
                    widget.pag2,
                    style: const TextStyle(fontSize: 12.0),
                  ),
                ],
              ),
              const SizedBox(height: 60.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Pg.3 ==> ',
                    style: TextStyle(fontSize: 12.0),
                  ),
                  Text(
                    widget.pag3,
                    style: const TextStyle(fontSize: 12.0),
                  ),
                ],
              ),
            ],
          ),
        ),
    );
  }
}
