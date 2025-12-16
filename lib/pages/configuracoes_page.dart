import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfiguracoesPage extends StatefulWidget {
  const ConfiguracoesPage({super.key});

  @override
  State<ConfiguracoesPage> createState() => _ConfiguracoesPageState();
}

class _ConfiguracoesPageState extends State<ConfiguracoesPage> {
  late SharedPreferences storage;

  TextEditingController nomeUsuarioController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

  String? nomeUsuario;
  double? altura;
  bool receberNotificacoes = false;
  bool temaEscuro = false;

  final CHAVE_NOME_USUARIO = "CHAVE_NOME_USUARIO";
  final CHAVE_ALTURA = "CHAVE_ALTURA";
  final CHAVE_RECEBERR_NOTIFICACAO = "CHAVE_RECEBER_NOTIFICACAO";
  final CHAVE_TEMA_ESCURO = "CHAVE_MODO_ESCURO";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarDados();
  }

  void carregarDados() async {
    storage = await SharedPreferences.getInstance();
    setState(() {
      nomeUsuarioController.text = storage.getString(CHAVE_NOME_USUARIO) ?? "";
      alturaController.text = (storage.getDouble(CHAVE_ALTURA) ?? 0).toString();
      receberNotificacoes =
          storage.getBool(CHAVE_RECEBERR_NOTIFICACAO) ?? false;
      temaEscuro = storage.getBool(CHAVE_TEMA_ESCURO) ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Configurações")),
        body: Container(
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
                child: TextField(
                  decoration: InputDecoration(hintText: "Nome usuário"),
                  controller: nomeUsuarioController,
                ),
              ),
              Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: "Altura"),
                  controller: alturaController,
                ),
              ),
              SwitchListTile(
                title: Text("Receber notificações"),
                value: receberNotificacoes,
                onChanged: (bool value) {
                  setState(() {
                    receberNotificacoes = value;
                  });
                },
              ),
              SwitchListTile(
                title: Text("Tema Escuro"),
                value: temaEscuro,
                onChanged: (bool value) {
                  setState(() {
                    temaEscuro = value;
                  });
                },
              ),
              TextButton(
                onPressed: () async {
                  FocusManager.instance.primaryFocus?.unfocus();
                  try {
                    await storage.setDouble(
                      CHAVE_ALTURA,
                      double.parse(alturaController.text),
                    );
                  } catch (e) {
                    showDialog(
                      context: context,
                      builder: (_) {
                        return AlertDialog(
                          title: Text("Meu App"),
                          content: Text("Favor informar uma altura válida !"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Ok"),
                            ),
                          ],
                        );
                      },
                    );
                    return;
                  }
                  await storage.setString(
                    CHAVE_NOME_USUARIO,
                    nomeUsuarioController.text,
                  );
                  await storage.setBool(
                    CHAVE_RECEBERR_NOTIFICACAO,
                    receberNotificacoes,
                  );
                  await storage.setBool(CHAVE_TEMA_ESCURO, temaEscuro);
                  Navigator.pop(context);
                },
                child: Text("Salvar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
