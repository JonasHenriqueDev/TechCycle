import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  final List<String> notifications = [
    'Notificação 1',
    'Notificação 2',
    'Notificação 3',
    'Notificação 4',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notificações',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: notifications.isEmpty
          ? const Center(
        child: Text('Nenhuma notificação disponível.'),
      )
          : ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(notifications[index]),
            leading: Icon(Icons.notifications),
            onTap: () {
              // Ação ao clicar na notificação
            },
          );
        },
      ),
    );
  }
}

