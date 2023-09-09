import 'package:flutter/material.dart';
import 'package:info_lugar/info_lugar.dart';
import 'package:info_lugar/item_actividad.dart';

class HomePage extends StatelessWidget {
  
  HomePage({
    Key? key,
  }) : super(key: key);

  final List<Map<String, dynamic>> items = [
    {
      'name': 'Vallarta Hotel',
      'image': 'https://visitapuertovallarta.com.mx/uploads/static/puerto-vallarta-mexico-movil.webp',
    },
    {
      'name': 'Playa',
      'image': 'https://a.cdn-hotels.com/gdcs/production19/d838/4c51713b-2682-40da-8ae7-952de2abde4d.jpg?impolicy=fcrop&w=800&h=533&q=medium',
    },
    {
      'name': 'Casa Velas',
      'image': 'https://www.hotelcasavelas.com.mx/resourcefiles/attractionsmallimages/beaches-of-puerto-vallarta-mexico.jpg?version=9022023001220',
    },
    {
      'name': 'Malecon',
      'image': 'https://cdn.forbes.com.mx/2021/10/Puerto-Vallarta-caballito-1024x685.jpg',
    },
    {
      'name': 'Los Arcos',
      'image': 'https://www.mexicodesconocido.com.mx/sites/default/files/fichas-destino/jalisco_puerto_vallarta_malecon_dreamstime_0.jpg',
    },
    {
      'name': 'Hotel Lujoso',
      'image': 'https://media.viajando.travel/p/8e694d4c714a6ea0c515a1ed924ca7cf/adjuntos/236/imagenes/000/527/0000527852/1200x675/smart/puerto-vallarta-norocpng.png',
    },
    {
      'name': 'Resort',
      'image': 'https://assets.hyatt.com/content/dam/hyatt/hyattdam/images/2021/10/20/1722/SEVPV-P0001-Aerial-Exterior.jpg/SEVPV-P0001-Aerial-Exterior.16x9.jpg?imwidth=1920',
    },
    {
      'name': 'Angel',
      'image': 'https://i.pinimg.com/originals/bf/44/28/bf4428b840e2fd63df7c6fc6e2b975f1.jpg',
    },
    {
      'name': 'Bellas Artes',
      'image': 'https://blog.uber-cdn.com/cdn-cgi/image/width=2161,height=1081,quality=80,onerror=redirect,format=auto/wp-content/uploads/2018/12/MX_Vive-como-nunca-antes-Ciudad-de-M%C3%A9xico-con-estos-X-lugares-de-inter%C3%A9s.jpg',
    },
    {
      'name': 'CDMX',
      'image': 'https://cdn.forbes.com.mx/2017/06/CDMX-640x360.jpg',
    },
    // Add more items as needed
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reserva tu hotel'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            fit: StackFit.expand,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Image.network(
                      'https://a21.com.mx/sites/default/files/field/image/historic-downtown-3b7a2fd19a5870ff56eba44fdab43c23.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              // para poder poner column o listview en stack hay que encerrarlas en positioned y anclarla a todos lados
              Positioned(
                top: 64,
                bottom: 0,
                left: 0,
                right: 0,
                child: ListView(
                  children: [
                    InfoLugar(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("Details"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.grey[200],
                          ),
                        ),
                        Text("Walkthrough Flight Detail"),
                      ],
                    ),
                    Container(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int index) {
                          var item = items[index];

                          int day = index + 1;
                          String name = item['name'];
                          String imagen = item['image'];

                          // Create and return the ItemActividad widget
                          return ItemActividad(
                            Day: day,
                            Name: name,
                            Imagen: imagen,
                          );
                        },
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Reservación en progreso'),
                          ),
                        );
                      },
                      child: Text("Start booking",style: TextStyle(color: Colors.white)),
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
