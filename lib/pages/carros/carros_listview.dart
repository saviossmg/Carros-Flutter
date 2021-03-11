import 'package:cached_network_image/cached_network_image.dart';
import 'package:carros/pages/carros/carro.dart';
import 'package:carros/pages/carros/carro_page.dart';
import 'package:carros/utils/nav.dart';
import 'package:flutter/material.dart';

import 'package:share/share.dart';

class CarrosListView extends StatelessWidget {
  List<Carro> carros;

  CarrosListView(this.carros);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView.builder(
        itemCount: carros.length,
        itemBuilder: (context, index) {
          Carro c = carros[index];

          return InkWell(
            onTap: () {
              print("Click On Tap");
              _onClickCarro(context, c);
            },
            onLongPress: () {
              print("Click On Long Press");
              _onLongClickCarro(context, c);
            },
            child: Card(
              color: Colors.grey[100],
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: CachedNetworkImage(
                        imageUrl: c.urlFoto ??
                            //"http://www.livroandroid.com.br/livro/carros/esportivos/Ferrari_FF.png",
                            "https://image.freepik.com/free-vector/sport-car-side-view_73313-182.jpg",
                        width: 250,
                      ),
                    ),
                    Text(
                      c.nome,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(
                      "Descricao ",
                      style: TextStyle(fontSize: 16),
                    ),
                    ButtonTheme.bar(
                      // make buttons use the appropriate styles for cards
                      child: ButtonBar(
                        children: <Widget>[
                          FlatButton(
                            child: const Text('DETALHES'),
                            onPressed: () => _onClickCarro(context, c),
                          ),
                          FlatButton(
                            child: const Text('SHARE'),
                            onPressed: () {
                              /* ... */
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  _onClickCarro(context, Carro c) {
    push(context, CarroPage(c));
  }

  _onLongClickCarro(context, Carro c) {

    showModalBottomSheet(context: context, builder: (context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(c.nome, style: TextStyle (
              fontSize: 22, fontWeight: FontWeight.bold,
            ),),
          ),
          ListTile(
            title: Text("Detalhes"),
            leading: Icon(Icons.directions_car),
            onTap: () {
              pop(context);
              _onClickCarro(context, c);
            },
          ),
          ListTile(
            title: Text("Share"),
            leading: Icon(Icons.share),
            onTap: () {
              pop(context);
              _onCLickShare(context, c);
            },
          )
        ],
      );
    });
  }

  void _onCLickShare(BuildContext context, Carro c) {
    Share.share(c.urlFoto);
  }
}
