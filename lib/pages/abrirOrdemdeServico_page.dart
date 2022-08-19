import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:servicosimp/DadosMOkados/mokes.dart';
import 'package:servicosimp/model/clientes.dart';
import 'package:servicosimp/model/serviceslist.dart';
import '../components/customTextForm.dart';

class AbriOSPage extends StatefulWidget {
  AbriOSPage({Key? key}) : super(key: key);

  @override
  State<AbriOSPage> createState() => _AbriOSPageState();
}

class _AbriOSPageState extends State<AbriOSPage> {
  final textController = TextEditingController();
  final textController2 = TextEditingController();
  final textController3 = TextEditingController();
  final textController4 = TextEditingController();
  final textController5 = TextEditingController();
  final textController6 = TextEditingController();
  final textController7 = TextEditingController();
  final textController8 = TextEditingController();
  final textController9 = TextEditingController();
  final textController10 = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  final _formData = Map<String, Object>();

  Clientes clientes = Clientes();

  void _submitForm() {
    _formkey.currentState?.save();

    Provider.of<ServicesList>(context, listen: false)
        .addServicosFromData(_formData);
    _formData.clear();
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
          IconButton(
              onPressed: () {
                setState(() {
                  _submitForm();
                  
                });
              },
              icon: Icon(Icons.save)),
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
                        controller: textController10,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.5,
                      child: CustomFormField(
                        enabled: false,
                        label: clientes1.nome,
                      ),
                    ),
                  ],
                ),
                //Endereço
                Container(
                  width: MediaQuery.of(context).size.width / 1,
                  child: CustomFormField(
                    label: clientes1.endereco,
                    enabled: false,
                  ),
                ),
                //solicitante
                Container(
                  width: MediaQuery.of(context).size.width / 1,
                  child: CustomFormField(
                    label: 'Solicitante',
                    controller: textController,
                    onSaved: (solicitante) =>
                        _formData['solicitante'] = solicitante ?? '',
                  ),
                ),
                //Equipamento
                Container(
                  width: MediaQuery.of(context).size.width / 1,
                  child: CustomFormField(
                    label: 'Equipamentos',
                    controller: textController2,
                    onSaved: (equipamento) =>
                        _formData['equipamnetos'] = equipamento ?? '',
                  ),
                ),
                //marca
                Container(
                  width: MediaQuery.of(context).size.width / 1,
                  child: CustomFormField(
                    label: 'Marca',
                    controller: textController3,
                    onSaved: (marca) => _formData['marca'] = marca ?? '',
                  ),
                ),
                //modelo
                Container(
                  width: MediaQuery.of(context).size.width / 1,
                  child: CustomFormField(
                    label: 'Modelo',
                    controller: textController4,
                    onSaved: (modelo) => _formData['modelo'] = modelo ?? '',
                  ),
                ),
                //series
                Container(
                  width: MediaQuery.of(context).size.width / 1,
                  child: CustomFormField(
                    label: 'Series',
                    controller: textController5,
                    onSaved: (series) => _formData['series'] = series ?? '',
                  ),
                ),
                //Descriçao dos problemas
                Container(
                  width: MediaQuery.of(context).size.width / 1,
                  child: CustomFormField(
                    label: 'Descrição dos Problemas',
                    linha: 5,
                    controller: textController6,
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
                    controller: textController7,
                    onSaved: (decriptionR) =>
                        _formData['descricaoRealizada'] = decriptionR ?? '',
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      child: CustomFormField(
                        inputFormatters: [dataFormat],
                        label: 'Data',
                        controller: textController8,
                        onSaved: (data) => _formData['data'] = data ?? '',
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      child: CustomFormField(
                        inputFormatters: [horaFormat],
                        label: 'Horas trabalhadas',
                        controller: textController9,
                        onSaved: (hora) => _formData['horas'] = hora ?? '',
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.image,
                        size: 50,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.camera_alt,
                        size: 50,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
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
