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
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 14, 56, 6)),
        useMaterial3: true,
      ),
      home: const HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
  
}

enum ServiceQuality { amazing, good, okay }

class _HomePageState extends State<HomePage> {
  double number = 0;
  String tipAmount = "Tip Amount: \$0.00";
  var costService = TextEditingController();
  bool _isSwitched = false;
  ServiceQuality? _selectedOption;

  void _tipAmount() {
    double cost = double.tryParse(costService.text) ?? 0.0;

    if (_selectedOption == ServiceQuality.amazing) {
      number = (cost * 0.2);
    } else if (_selectedOption == ServiceQuality.good) {
      number = (cost * 0.18);
    } else if (_selectedOption == ServiceQuality.okay) {
      number = (cost * 0.15);
    }

    if (_isSwitched) {
      number = double.parse(number.toStringAsFixed(0));
    } else {
      number = double.parse(number.toStringAsFixed(2));
    }
    tipAmount = "Tip Amount: \$$number";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text('Tip Time', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, top: 12),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 150),
              child: TextField(
                controller: costService,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  icon:  Icon(Icons.store,color: Colors.green),
                  labelText: "Cost of Service",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 24,),
            const Row(
              children: [
                Icon(Icons.room_service,color: Colors.green),
                SizedBox(width: 16,),
                Text(
                  'How was the service?',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 19.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              RadioListTile<ServiceQuality>(
                title: const Text('Amazing (20%)'),
                value: ServiceQuality.amazing,
                groupValue: _selectedOption,
                onChanged: (ServiceQuality? value) {
                  setState(() {
                    _selectedOption = value;
                  });
                },
              ),
              RadioListTile<ServiceQuality>(
                title: const Text('Good (18%)'),
                value: ServiceQuality.good,
                groupValue: _selectedOption,
                onChanged: (ServiceQuality? value) {
                  setState(() {
                    _selectedOption = value;
                  });
                },
              ),
              RadioListTile<ServiceQuality>(
                title: const Text('okay (15%)'),
                value: ServiceQuality.okay,
                groupValue: _selectedOption,
                onChanged: (ServiceQuality? value) {
                  setState(() {
                    _selectedOption = value;
                  });
                },
              ),
              ],
              ),
            ),
            Row(
              children: [
                const Icon(Icons.north_east,color: Colors.green),
                const SizedBox(width: 16,),
                const Text(
                  'Round up tip?',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(width: 150,),
                Switch(
                  value: _isSwitched,
                  onChanged: (bool value) {
                    setState(() {
                      _isSwitched = value;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 15,),
            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 43, 110, 45),
                borderRadius: BorderRadius.circular(8.0), // Adjust the radius as needed
              ),
              child: MaterialButton(
                child: const Text(
                                "CALCULATE",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white
                                ),
                              ),
                onPressed: (){
                  setState((){
                    _tipAmount ();
                  });
                }),
            ),
            const SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.only(left: 200.0),
              child: Text(
                tipAmount,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}