import 'package:flutter/material.dart';
import 'package:servicosimp/model/servicos.dart';

class CartService extends StatefulWidget {
  CartService({Key? key, required this.item}) : super(key: key);

  Servicos item;

  @override
  State<CartService> createState() => _CartServiceState();
}

class _CartServiceState extends State<CartService> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text(widget.item.id.toString()),
            subtitle: Text('Cristiano'),
            trailing: IconButton(
              icon: Icon(Icons.expand_more),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          if (_expanded)
            Container(
              child: Column(children: [
                Row(
                  children: [
                    Text(
                      'Solicitante: ',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      widget.item.solicitante,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Data: ',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      widget.item.data,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Hora: ',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      widget.item.hora,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ]),
            )
        ],
      ),
    );
  }
}
