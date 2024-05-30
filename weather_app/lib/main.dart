import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';
import 'package:permission_handler/permission_handler.dart';
import 'ubicacion.dart';

Color selectedPrimaryColor = Colors.blue;
Color selectedAccentColor = Colors.red;

Future<void> requestDownloadPermission() async {
  final dio = Dio();
  if (await Permission.storage.request().isGranted) {
    Directory savePath = await getApplicationDocumentsDirectory();
    //String filePath = '${appDocDir.path}/mi_archivo;

    final response = await dio.get('https://github.com/flutter/assets-for-api-docs/blob/main/assets/videos/butterfly.mp4');
    try {
      await dio.download('https://github.com/flutter/assets-for-api-docs/blob/main/assets/videos/butterfly.mp4', "$savePath/api_json_file.txt");
      print('Video descargado y guardado en: $savePath');
    } catch (error, stacktrace) {
      print('Error al descargar el video: $error');
    }
  } else {
    // El usuario denegó el permiso, muestra un mensaje
    openAppSettings();
  }
}

Future<void> downloadFile() async {
  // Aquí puedes realizar la descarga del archivo
  // Asegúrate de implementar la lógica de descarga
}

Future<void> _checkLocationPermission(BuildContext context) async {
  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.always || permission == LocationPermission.whileInUse) {
    // Si ya tiene permisos, navega a LocationPage
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => LocationPage(),
    ));
  } else {
    // Si no tiene permisos, muestra el diálogo de solicitud de permisos
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return LocationPermissionDialog();
      },
    );
  }
}

void main() {
  runApp(MyWeatherApp());
}

class MyWeatherApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return MaterialApp(
      title: 'Weather App',
      home: ResidenceList(),
      theme: ThemeData(
        primaryColor: selectedPrimaryColor,
        colorScheme: theme.colorScheme.copyWith(secondary: selectedAccentColor),
      ),
    );
  }
}
class ResidenceList extends StatefulWidget {
  @override
  _ResidenceListState createState() => _ResidenceListState();
}

class _ResidenceListState  extends State<ResidenceList> {
  final List<String> residences = ["Hotel", "Casa en Playa", "Casa en Centro"];
  Color pickerColor = Color(0xff443a49);
  Color currentColor = Color(0xff443a49);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Residencias'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: residences.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.home),
                  title: Text(residences[index]),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResidenceDetails(residences[index]),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ThemeConfigPage(),
              ),
            );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.secondary,
            ),
            child: Text('Tema'),
          ),
          ElevatedButton(
            onPressed: () async {
              await _checkLocationPermission(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.secondary,
            ),
            child: Text('Mostrar Ubicación'),
          ),
        ],
      ),
    );
  }
}

class ResidenceDetails extends StatelessWidget {
  final String residenceName;
  final dio = Dio();

  bool downloading = false;
  double downloadProgress = 0;

  ResidenceDetails(this.residenceName);

  void _showSnackBar(BuildContext context, String cityName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$residenceName ubicación: $cityName'),
      ),
    );
  }

  void getHttp() async {
    Directory savePath = await getApplicationDocumentsDirectory();
    //String filePath = '${appDocDir.path}/mi_archivo;

    final response = await dio.get('https://github.com/flutter/assets-for-api-docs/blob/main/assets/videos/butterfly.mp4');
    try {
      await dio.download('https://github.com/flutter/assets-for-api-docs/blob/main/assets/videos/butterfly.mp4', "$savePath/api_json_file.txt");
      print('Video descargado y guardado en: $savePath');
    } catch (error, stacktrace) {
      print('Error al descargar el video: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles de $residenceName'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Ubicación de la residencia $residenceName'),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _showSnackBar(context, 'Guadalajara');
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                  ),
                  child: Text('Guadalajara'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _showSnackBar(context, 'Vallarta');
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                  ),
                  child: Text('Vallarta'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _showSnackBar(context, 'Zapopan');
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                  ),
                  child: Text('Zapopan'),
                ),
              ],
            ),
            ElevatedButton( 
              onPressed: () async {
                await requestDownloadPermission();
              },
              child: Text('Descargar'),
            ),
          ],
        ),
      ),
    );
  }
}

//Color Config
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
                  // Guardar los colores seleccionados en la configuraci�n
                  final appThemeConfig = AppThemeConfig(
                    primaryColor: selectedPrimaryColor,
                    accentColor: selectedAccentColor,
                  );
                  // Guardar appThemeConfig en alg�n lugar, por ejemplo, en Shared Preferences
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