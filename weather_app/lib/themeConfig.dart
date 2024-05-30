import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class AppThemeConfig {
  Color primaryColor;
  Color accentColor;

  AppThemeConfig({this.primaryColor = Colors.blue, this.accentColor = Colors.red});
}

class ThemeConfigPage extends StatefulWidget {
  @override
  _ThemeConfigPageState createState() => _ThemeConfigPageState();
}

class _ThemeConfigPageState extends State<ThemeConfigPage> {
  Color selectedPrimaryColor = Colors.blue;
  Color selectedAccentColor = Colors.red;

  void updatePrimaryColor(Color color) {
    setState(() {
      selectedPrimaryColor = color;
    });
  }

  void updateAccentColor(Color color) {
    setState(() {
      selectedAccentColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurar Tema'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Color Primario:'),
              ColorPicker(
                pickerColor: selectedPrimaryColor,
                onColorChanged: updatePrimaryColor,
                colorPickerWidth: 300.0,
                pickerAreaHeightPercent: 0.7,
              ),
              Text('Color de Acento:'),
              ColorPicker(
                pickerColor: selectedAccentColor,
                onColorChanged: updateAccentColor,
                colorPickerWidth: 300.0,
                pickerAreaHeightPercent: 0.7,
              ),
              ElevatedButton(
                onPressed: () {
                  // Guardar los colores seleccionados en la configuración
                  final appThemeConfig = AppThemeConfig(
                    primaryColor: selectedPrimaryColor,
                    accentColor: selectedAccentColor,
                  );
                  // Guardar appThemeConfig en algún lugar, por ejemplo, en Shared Preferences
                  Navigator.of(context).pop();
                },
                child: Text('Guardar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
