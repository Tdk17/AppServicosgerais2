import 'package:flutter/material.dart';

import '../components/customTextForm.dart';

class AbriOSPage extends StatelessWidget {
  const AbriOSPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Abrir OS'),
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
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Column(
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
                  Container(
                    width: MediaQuery.of(context).size.width / 1,
                    child: CustomFormField(
                      label: 'Endereço',
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1,
                    child: CustomFormField(
                      label: 'Solicitante',
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1,
                    child: CustomFormField(
                      label: 'Equipamento',
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1,
                    child: CustomFormField(
                      label: 'Marca',
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1,
                    child: CustomFormField(
                      label: 'Modelo',
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1,
                    child: CustomFormField(
                      label: 'Series',
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1,
                    child: CustomFormField(
                      label: 'Series',
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1,
                    child: CustomFormField(
                      label: 'Descrição dos Problemas',
                      linha: 5,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1,
                    child: CustomFormField(
                      label: 'Descrição do Realizado',
                      linha: 5,
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 3,
                        child: CustomFormField(
                          label: 'Data',
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.5,
                        child: CustomFormField(
                          label: 'Horas trabalhadas',
                        ),
                      ),
                    ],
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width / 1,
                      height: 50,
                      child: ElevatedButton(
                          onPressed: () {}, child: Text('CONFIRMA'))),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
