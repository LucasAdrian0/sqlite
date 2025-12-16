import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/configuracoes_page.dart';
import 'package:trilhaapp/pages/dados_cadastrais.dart';
import 'package:trilhaapp/pages/login_page.dart';
import 'package:trilhaapp/pages/numeros_aletorios.dart';

class CustonDrawer extends StatelessWidget {
  const CustonDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(10),
                ),
                context: context,
                builder: (BuildContext bc) {
                  return Wrap(
                    children: [
                      ListTile(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        title: Text("Camera"),
                        leading: Icon(Icons.camera_alt),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        title: Text("Galeria"),
                        leading: Icon(Icons.photo),
                      ),
                    ],
                  );
                },
              );
            },
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.orange),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Image.network(
                  "http://hermes.digitalinnovation.one/assets/diome/logo.png",
                ),
              ),
              accountName: Text("Lucas Adriano"),
              accountEmail: Text("email@email.com"),
            ),
          ),
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              width: double.infinity,
              child: Row(
                children: [
                  const Icon(Icons.person),
                  SizedBox(width: 5),
                  Text("Dados Cadastrais"),
                ],
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DadosCadastraisPage(),
                ),
              );
            },
          ),
          const Divider(),
          const SizedBox(height: 10),
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              width: double.infinity,
              child: Row(
                children: [
                  const Icon(Icons.info),
                  SizedBox(width: 5),
                  Text("Termos de uso e privacidade"),
                ],
              ),
            ),
            onTap: () {
              showModalBottomSheet(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(10),
                ),
                context: context,
                builder: (BuildContext bc) {
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                    child: Column(
                      children: [
                        Text(
                          "Termos de uso e privacidade",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Ao aceitar este Termo de Consentimento, o usuário autoriza a utilização de seus dados pelo sistema, exclusivamente para as finalidades operacionais necessárias ao funcionamento da plataforma, incluindo cadastro, autenticação, comunicação, processamento de informações e melhoria dos serviços.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
          const Divider(),
          const SizedBox(height: 10),
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              width: double.infinity,
              child: Row(
                children: [
                  const Icon(Icons.settings),
                  SizedBox(width: 5),
                  Text("Configurações"),
                ],
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (bc) => const ConfiguracoesPage()),
              );
            },
          ),
          const Divider(),
          const SizedBox(height: 10),
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              width: double.infinity,
              child: Row(
                children: [
                  const Icon(Icons.numbers),
                  SizedBox(width: 5),
                  Text("Gerador de números"),
                ],
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (bc) => const NumerosAleatoriosPage(),
                ),
              );
            },
          ),
          Divider(),
          SizedBox(height: 10),
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              width: double.infinity,
              child: Row(
                children: [
                  const Icon(Icons.exit_to_app),
                  SizedBox(width: 5),
                  Text("Sair"),
                ],
              ),
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext bc) {
                  return AlertDialog(
                    alignment: Alignment.centerLeft,
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(10),
                    ),
                    title: Text(
                      "Meu App",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    content: Wrap(
                      children: [
                        Text("Voce sairá do aplicativo!"),
                        Text("Deseja realmente sair do aplicativo?"),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Não"),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                          );
                        },
                        child: Text("Sim"),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
