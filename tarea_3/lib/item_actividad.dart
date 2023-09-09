import 'package:flutter/material.dart';

class ItemActividad extends StatelessWidget {
  final int Day;
  final String Name;
  final String Imagen;
  
  ItemActividad({
    required this.Day,
    required this.Name,
    required this.Imagen
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.network(
            Imagen, // Use the provided image URL
            height: 120,
            width: 120,
            fit: BoxFit.cover,
          ),
          Text("Day $Day", style: TextStyle(fontSize: 11)),
          Text(Name),
        ],
      ),
    );
  }
}
