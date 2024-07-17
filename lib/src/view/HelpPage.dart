import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Suporte'),
        foregroundColor: Colors.white,
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bem-vindo ao Suporte do TechCycle',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            _buildSectionTitle('Navegação'),
            _buildSectionContent(
                ' Utilize a barra de navegação inferior para acessar as principais seções do aplicativo:\n\n'
                    ' Anúncios: Visualize e gerencie seus anúncios de produtos.\n'
                    ' Localização: Veja sua localização atual e encontre pontos de coleta próximos.\n'
                    ' Recompensas: Acesse e resgate suas recompensas.'),
            SizedBox(height: 20),
            _buildSectionTitle('Menu Lateral'),
            _buildSectionContent(
                ' O menu lateral oferece acesso rápido a várias páginas importantes:\n\n'
                    ' Perfil: Visualize e edite suas informações pessoais.\n'
                    ' Descartes: Gerencie seus itens descartados.\n'
                    ' Anúncios: Acesse todos os seus anúncios publicados.\n'
                    ' Notificações: Veja todas as suas notificações.\n'
                    ' Configurações: Altere as configurações do aplicativo.\n'
                    ' Suporte: Acesse esta página de suporte para obter ajuda.'),
            SizedBox(height: 20),
            _buildSectionTitle('Localização do Usuário'),
            _buildSectionContent(
                ' O aplicativo utiliza a sua localização para mostrar pontos de coleta próximos. '
                    'Certifique-se de conceder permissão de localização para aproveitar esta funcionalidade.'),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildSectionContent(String content) {
    return Text(
      content,
      style: TextStyle(fontSize: 16),
    );
  }
}


