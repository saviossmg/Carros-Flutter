import 'package:flutter/material.dart';
import 'carro.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class MapaPage extends StatelessWidget {

  final Carro carro;

  MapaPage(this.carro);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(carro.nome),
      ),
      body: _body(),
    );
  }

  _body() {
    return Container(
      child: GoogleMap(
        initialCameraPosition: CameraPosition(target: latLng(), zoom: 17) ,
      ),
    );
  }

  latLng() {
    return carro.latlng;
  }

  List<Marker> _getMarkers() {
    return [
      Marker(
        markerId: MarkerId("1"),
        position: carro.latlng,
        infoWindow: InfoWindow(
          title: carro.nome,
          snippet: "Carro ${carro.nome} está nesse local",
          onTap: (){
            print("clicou na janelinha");
          },
        ),
        onTap: () {
          print("clicou na marquinha");
        }
      )
    ];
  }

}
