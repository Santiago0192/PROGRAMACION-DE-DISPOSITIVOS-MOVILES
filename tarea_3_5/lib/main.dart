import 'package:flutter/material.dart';
import 'page2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ImageListPage(),
    );
  }
}

class ImageListPage extends StatelessWidget {
  final List<String> imageUrls = [
    'assets/parmesan-crumbed-chicken.jpg',
    'assets/chorizo-mozarella-gnocchi-bake-cropped.jpg',
    'assets/1980-crunchy-chicken-twisties-drumsticks-951509-1.jpg',
    'assets/default-pasta.jpg',
  ];

  final List<String> food = [
    'Crumbed Chiken',
    'Curry Chiken with Veggies',
    'Parmesan Crumbed Chiken',
    'Pasta with Tomato Sauce',
  ];

  final List<String> time = [
    ' 10 min',
    ' 20 min',
    ' 30 min',
    ' 40 min',
  ];

  final List<String> complex = [
    ' Simple',
    ' Medium',
    ' Simple',
    ' Simple',
  ];

  final List<String> price = [
    ' Affordable',
    ' Affordable',
    ' Affordable',
    ' Affordable',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 31, 23, 23),
        title: const Center( child: Text('Quick & Easy')),
      ),
      backgroundColor: Color.fromARGB(255, 31, 23, 23),
      body: ListView.builder(
        itemCount: imageUrls.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Page2(imageUrl: imageUrls[index],food: food[index],index: index),
                ),
              );
            },
            child: Card(
              margin: const EdgeInsets.all(6.0),
              child: Stack(
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 16 / 8,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        imageUrls[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      color: Colors.black.withOpacity(0.6),
                      child: Column(
                        children: [
                          Text(
                            food[index],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.schedule, color: Colors.white, size: 15),
                              Text(time[index], style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300)),
                              SizedBox(width: 16.0),
                              Icon(Icons.work, color: Colors.white, size: 15),
                              Text(complex[index], style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300)),
                              SizedBox(width: 16.0),
                              Icon(Icons.attach_money, color: Colors.white, size: 15),
                              Text(price[index], style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}