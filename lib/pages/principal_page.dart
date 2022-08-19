import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'package:globalchaveimp/Components/expandable_fab.dart';
import 'package:globalchaveimp/Data/store.dart';

import '../components/app_drawer.dart';
import '../utils/constantes.dart';
import 'abrirOrdemdeServico_page.dart';
import 'consultarOs.dart';

class PrincipalPage extends StatefulWidget {
  const PrincipalPage({Key? key}) : super(key: key);

  @override
  State<PrincipalPage> createState() => _PrincipalPageState();
}

class _PrincipalPageState extends State<PrincipalPage> {
  final _formKey = GlobalKey<FormState>();
  final _formData = <String, String>{};
  final _numeroComandaController = TextEditingController();

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    Store.getMap('configuracoes').then(
      (configuracoes) {},
    );
  }

  /*void _iniciarNovaComanda() {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) {
      return;
    }

    _formKey.currentState?.save();

    Provider.of<Carrinho>(
      context,
      listen: false,
    ).iniciarConta(
        int.tryParse(_formData['numeroComanda'] ?? '') ?? -1,
        Provider.of<Autenticacao>(
              context,
              listen: false,
            ).cdColaborador ??
            0);
    Navigator.of(context).pushNamed(AppRoutes.gruposProduto);
  }
*/
  /* void _abrirComanda() {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) {
      return;
    }

    _formKey.currentState?.save();

    Provider.of<Conta>(
      context,
      listen: false,
    ).carregarConta(int.tryParse(_formData['numeroComanda'] ?? '') ?? -1);
    Navigator.of(context).pushNamed(AppRoutes.conta);
  }
*/
  /*void _consultarComanda(BuildContext context) async {
    return _pedirComanda(context, _abrirComanda);
  }*/

  /*void _novaComanda(BuildContext context) async {
    return _pedirComanda(context, _iniciarNovaComanda);
  }*/
  void _pedirComanda(BuildContext context, Function() onSubmitForm) async {
    _numeroComandaController.clear();
    await showDialog(
        context: context,
        builder: (_) {
          return SafeArea(
            child: Dialog(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  width: 280.0,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: TextFormField(
                                autofocus: true,
                                onFieldSubmitted: (_) => onSubmitForm,
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                controller: _numeroComandaController,
                                decoration: const InputDecoration(
                                  isDense: true,
                                  hintText: 'Nº da Comanda',
                                ),
                                textInputAction: TextInputAction.done,
                                onSaved: (numeroComanda) =>
                                    _formData['numeroComanda'] =
                                        numeroComanda ?? '',
                                validator: (value) {
                                  final numeroComanda = value ?? '';
                                  if (numeroComanda.isEmpty) {
                                    return 'Informe o Nº da Comanda.';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            TextButton.icon(
                              onPressed: () async {
                                String numeroComanda =
                                    await FlutterBarcodeScanner.scanBarcode(
                                        '#ff6666',
                                        'Cancelar',
                                        true,
                                        ScanMode.BARCODE);
                                if (numeroComanda != '-1') {
                                  _numeroComandaController.text = numeroComanda;
                                }
                              },
                              icon: const Icon(
                                Icons.qr_code_scanner,
                                size: 40.0,
                                color: Color(0xffBDBFC1),
                              ),
                              label: const Text(''),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6.0),
                        ElevatedButton(
                          onPressed: onSubmitForm,
                          style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                            horizontal: 30.0,
                            vertical: 8.0,
                          )),
                          child: const Text('CONFIRMA'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Constantes.tituloApp),
        actions: [
          IconButton(
            onPressed: () => {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => AbriOSPage()))
            }, //_novaComanda(context),
            icon: const Icon(Icons.add),
            tooltip: Constantes.novoPedido,
          ),
          IconButton(
            onPressed: () => {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => ConsutarOs()))
            }, //_consultarComanda(context),
            icon: const Icon(Icons.search),
            tooltip: Constantes.consultarComanda,
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/imagens/imagemFundo1.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
      floatingActionButton: ExpandableFab(
        distance: 112.0,
        children: [
          ActionButton(
            icon: const Icon(Icons.add),
            onPressed: () => {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => AbriOSPage()))
            }, // _novaComanda(context),
            tooltip: Constantes.novoPedido,
          ),
          ActionButton(
            icon: const Icon(Icons.search),
            onPressed: () => {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => ConsutarOs()))
            }, // _consultarComanda(context),
            tooltip: Constantes.consultarComanda,
          ),
        ],
      ),
    );
  }
}
