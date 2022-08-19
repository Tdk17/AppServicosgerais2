import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:servicosimp/model/cart_model_service.dart';
import 'package:servicosimp/model/serviceslist.dart';

class ConsutarOs extends StatefulWidget {
  ConsutarOs({Key? key}) : super(key: key);

  @override
  State<ConsutarOs> createState() => _ConsutarOsState();
}

class _ConsutarOsState extends State<ConsutarOs> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ServicesList list = Provider.of<ServicesList>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Consultar OS'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.2), BlendMode.dstATop),
            image: AssetImage(
              'assets/imagens/imagemFundo1.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
            itemCount: list.itemsCount,
            itemBuilder: ((context, index) {
              final item = list.servicos[index];
              return CartService(
                item: item,
              );
            })),
      ),
    );
  }
}
