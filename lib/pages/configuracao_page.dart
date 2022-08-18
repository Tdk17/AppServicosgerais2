import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:globalchaveimp/Data/store.dart';

import '../components/app_drawer.dart';
import '../utils/app_routes.dart';
import 'autenticacao_page.dart';

class ConfiguracaoPage extends StatefulWidget {
  const ConfiguracaoPage({Key? key}) : super(key: key);

  @override
  State<ConfiguracaoPage> createState() => _ConfiguracaoPageState();
}

class _ConfiguracaoPageState extends State<ConfiguracaoPage> {
  final _formKey = GlobalKey<FormState>();
  final _formData = <String, String>{};

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    Store.getMap('configuracoes').then((configuracoes) {
      setState(() {
        if (configuracoes.isNotEmpty) {
          _formData['caminhoIP'] = configuracoes['caminhoIP'];
          _formData['porta'] = configuracoes['porta'];
        }

        _isLoading = false;
      });
    });
  }

  Future<void> _submitForm(bool estaAutenticado) async {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) {
      return;
    }

    _formKey.currentState?.save();

    setState(() => _isLoading = true);

    try {
      await Store.saveMap('configuracoes', _formData);
      if (!estaAutenticado) {
        if (!mounted) return;
        Navigator.of(context).pushReplacementNamed(AppRoutes.home);
      }
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Column _grupoConfiguracao(
      BuildContext context, String titulo, double espacamento) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titulo,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const Divider(height: 5.0, thickness: 1.0, color: Colors.black),
        SizedBox(height: espacamento),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // final autenticacao = Provider.of<Autenticacao>(
    //  context,
    // listen: false,
    //);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
        actions: [
          IconButton(
            onPressed: () => {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (e) => AutenticacaoPage())),
            }, // _submitForm(autenticacao.estaAutenticado),
            icon: const Icon(Icons.save),
            tooltip: 'Gravar',
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    _grupoConfiguracao(context, 'API', 5.0),
                    TextFormField(
                      initialValue: _formData['caminhoIP']?.toString(),
                      decoration: const InputDecoration(
                        labelText: 'Caminho IP da API',
                        hintText: 'Ex.: 192.168.1.1',
                      ),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      // autofocus: widget.mensagemErro.isEmpty ? true : false,
                      onSaved: (caminhoIP) =>
                          _formData['caminhoIP'] = caminhoIP ?? '',
                      validator: (value) {
                        final caminhoIP = value ?? '';
                        if (caminhoIP.isEmpty) {
                          return 'Informe o caminho IP da API.';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      initialValue: _formData['porta']?.toString() ?? '8080',
                      decoration: const InputDecoration(
                        labelText: 'Porta da API',
                        hintText: 'Ex.: 8080',
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (_) {
                        // if (!autenticacao.estaAutenticado) {
                        //  _submitForm(autenticacao.estaAutenticado);
                        //}
                      },
                      onSaved: (porta) => _formData['porta'] = porta ?? '',
                      validator: (value) {
                        final porta = value ?? '';
                        if (porta.isEmpty) {
                          return 'Informe a porta da API.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 25.0),
                    _grupoConfiguracao(context, 'Demais Configurações', 15.0),
                    const Text('Tipo de Leitor da Comanda:'),
                    const Divider(height: 10.0, color: Colors.black),
                    const Divider(height: 10.0, color: Colors.black),
                  ],
                ),
              ),
            ),
    );
  }
}
