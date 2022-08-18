import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../components/customTextForm.dart';
import '../model/servicos.dart';

class AbriOSPage extends StatelessWidget {
  AbriOSPage({Key? key}) : super(key: key);

  final textController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  final _formData = Map<String, Object>();

  void _submitForm() {
    _formkey.currentState?.save();
    final newService = Servicos(
      solicitante: _formData['solicitante'] as String,
      equipamento: _formData['equipamento'] as String,
      marca: _formData['marca'] as String,
      modelo: _formData['modelo'] as String,
      series: _formData['series'] as String,
      descricaoProblema: _formData['descricaoProblema'] as String,
      descricaoRealizada: _formData['descricaoRealizada'] as String,
    );
  }

  final dataFormat = MaskTextInputFormatter(
    mask: "##/##/##",
  );
  final horaFormat = MaskTextInputFormatter(
    mask: "##:##",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Abrir OS'),
        actions: [
          IconButton(onPressed: _submitForm, icon: Icon(Icons.save)),
        ],
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
        child: Container(
          margin: const EdgeInsets.only(top: 20),
          height: double.infinity,
          child: Form(
            key: _formkey,
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 20),
                      width: MediaQuery.of(context).size.width / 2,
                      child: Text(
                        'Cristiano Silva',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      child: CustomFormField(
                        label: 'Nº OS',
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 3,
                      child: CustomFormField(
                        label: 'Nº Cliente',
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.5,
                      child: CustomFormField(
                        label: 'Nome do Cliente',
                      ),
                    ),
                  ],
                ),
                //Endereço
                Container(
                  width: MediaQuery.of(context).size.width / 1,
                  child: CustomFormField(
                    label: 'Endereço',
                  ),
                ),
                //solicitante
                Container(
                  width: MediaQuery.of(context).size.width / 1,
                  child: CustomFormField(
                    label: 'Solicitante',
                    onSaved: (solicitante) =>
                        _formData['solicitante'] = solicitante ?? '',
                  ),
                ),
                //Equipamento
                Container(
                  width: MediaQuery.of(context).size.width / 1,
                  child: CustomFormField(
                    label: 'Equipamentos',
                    onSaved: (equipamento) =>
                        _formData['equipamnetos'] = equipamento ?? '',
                  ),
                ),
                //marca
                Container(
                  width: MediaQuery.of(context).size.width / 1,
                  child: CustomFormField(
                    label: 'Marca',
                    onSaved: (marca) => _formData['marca'] = marca ?? '',
                  ),
                ),
                //modelo
                Container(
                  width: MediaQuery.of(context).size.width / 1,
                  child: CustomFormField(
                    label: 'Modelo',
                    onSaved: (modelo) => _formData['modelo'] = modelo ?? '',
                  ),
                ),
                //series
                Container(
                  width: MediaQuery.of(context).size.width / 1,
                  child: CustomFormField(
                    label: 'Series',
                    onSaved: (series) => _formData['series'] = series ?? '',
                  ),
                ),
                //Descriçao dos problemas
                Container(
                  width: MediaQuery.of(context).size.width / 1,
                  child: CustomFormField(
                    label: 'Descrição dos Problemas',
                    linha: 5,
                    onSaved: (decriptionP) =>
                        _formData['descricaoProblema'] = decriptionP ?? '',
                  ),
                ),
                //Descriçao do Realizado
                Container(
                  width: MediaQuery.of(context).size.width / 1,
                  child: CustomFormField(
                    label: 'descricaoRealizada',
                    linha: 5,
                    onSaved: (decriptionR) =>
                        _formData['Descrição do Realizado'] = decriptionR ?? '',
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      child: CustomFormField(
                        inputFormatters: [dataFormat],
                        label: 'Data',
                        onSaved: (data) => _formData['Data'] = data ?? '',
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      child: CustomFormField(
                        inputFormatters: [horaFormat],
                        label: 'Horas trabalhadas',
                        onSaved: (hora) => _formData['Horas'] = hora ?? '',
                      ),
                    ),
                  ],
                ),
                Container(
                    width: MediaQuery.of(context).size.width / 1,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: _submitForm, child: Text('CONFIRMA'))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
