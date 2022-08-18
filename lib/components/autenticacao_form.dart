import 'package:flutter/material.dart';
import 'package:servicosimp/pages/principal_page.dart';

class AutenticacaoForm extends StatefulWidget {
  const AutenticacaoForm({Key? key}) : super(key: key);

  @override
  State<AutenticacaoForm> createState() => _AutenticacaoFormState();
}

class _AutenticacaoFormState extends State<AutenticacaoForm> {
  final _formKey = GlobalKey<FormState>();
  final List<dynamic> _listaEmpresas = [];
  final List<dynamic> _listaColaboradores = [];

  dynamic _colaboradorSelecionado;

  @override
  void initState() {
    super.initState();

    /* Api.retornarListaEmpresas().catchError((e) {
      Mensagens.erro(
              context, 'Não foi possível carregar os dados da empresa.', e)
          .then((value) => setState(() => _isLoading = false));
    }).then((value) {
      setState(() {
        _listaEmpresas = value;
      });
      Api.retornarListaColaboradores().catchError((e) {
        Mensagens.erro(context,
                'Não foi possível carregar a lista de colaboradores.', e)
            .then((value) => setState(() => _isLoading = false));
      }).then((value) {
        setState(() {
          _listaColaboradores = value;
          _isLoading = false;
        });
      });
    });*/
  }

  /* Future<void> _submit() async {
    Provider.of<Autenticacao>(
      context,
      listen: false,
    ).login(_cdColaborador, _nmColaborador, _listaEmpresas[0]['IMAGEM']);
    Navigator.of(context).pushReplacementNamed(AppRoutes.principal);
  }*/

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //_isLoading
          //? const Center(child: CircularProgressIndicator())
          Card(
            elevation: 8.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Container(
              padding: const EdgeInsets.all(16.0),
              height: 340.0,
              width: deviceSize.width * 0.85,
              child: Form(
                key: _formKey,
                child: Column(children: [
                  Image.asset(
                    'assets/imagens/logoImpactus.png',
                    fit: BoxFit.cover,
                    height: 150.0,
                  ),
                  const SizedBox(height: 20.0),
                  DropdownButton<String>(
                    isDense: true,
                    isExpanded: true,
                    items: _listaEmpresas.map((empresa) {
                      return DropdownMenuItem<String>(
                        alignment: Alignment.centerLeft,
                        value: empresa['CDPARAMETRO'].toString(),
                        child: Text(' ${empresa}'),
                      );
                    }).toList(),
                    onChanged: null,
                    value: _listaEmpresas.isNotEmpty
                        ? _listaEmpresas[0]['CDPARAMETRO'].toString()
                        : null,
                  ),
                  const SizedBox(height: 20.0),
                  DropdownButton<dynamic>(
                    value: _colaboradorSelecionado,
                    isDense: true,
                    isExpanded: true,
                    items: _listaColaboradores.map((colaborador) {
                      return DropdownMenuItem<dynamic>(
                        alignment: Alignment.centerLeft,
                        value: colaborador,
                        child: Text('${colaborador} '),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _colaboradorSelecionado = value;
                      });
                    },
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context)
.push(MaterialPageRoute(builder: (e)=>PrincipalPage()));                    },
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                      horizontal: 30.0,
                      vertical: 8.0,
                    )),
                    child: const Text('ENTRAR'),
                  ),
                ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
