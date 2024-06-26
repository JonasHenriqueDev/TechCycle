import 'package:flutter/material.dart';
import 'package:techcycle/src/view/HelpPage.dart';
import 'MyApp.dart';
import 'ProfilePage.dart';
import 'DiscardsPage.dart';
import 'AdvertsPage.dart';
import 'NotificationsPage.dart';
import 'SettingsPage.dart';
import 'HelpPage.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _navigateToPage(page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TechCycle',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Text('Você selecionou a aba: $_selectedIndex'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Minha conta'),
              onTap: () {
                Navigator.pop(context);
                _navigateToPage(ProfilePage());
              },
            ),
            ListTile(
              leading: Icon(Icons.lock_clock),
              title: Text('Histórico de descartes'),
              onTap: () {
                Navigator.pop(context);
                _navigateToPage(DiscardsPage());
              },
            ),
            ListTile(
              leading: Icon(Icons.card_giftcard),
              title: Text('Meus anúncios e vendas'),
              onTap: () {
                Navigator.pop(context);
                _navigateToPage(AdvertsPage());
              },
            ),
            ListTile(
              leading: Icon(Icons.notification_add),
              title: Text('Notificações'),
              onTap: () {
                Navigator.pop(context);
                _navigateToPage(NotificationsPage());
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Configurações'),
              onTap: () {
                Navigator.pop(context);
                _navigateToPage(SettingsPage());
              },
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('Suporte'),
              onTap: () {
                Navigator.pop(context);
                _navigateToPage(HelpPage());
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: _buildIcon(Icons.shopping_cart, 0),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(Icons.location_on, 1),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(Icons.card_giftcard, 2),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.green,
        onTap: _onItemTapped,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }

  Widget _buildIcon(IconData icon, int index) {
    return Container(
      decoration: BoxDecoration(
        color: _selectedIndex == index ? Colors.green[800] : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(8),
      child: Icon(icon, color: Colors.white),
    );
  }
}
