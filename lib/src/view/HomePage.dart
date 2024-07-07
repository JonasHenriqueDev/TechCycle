import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techcycle/src/provider/anuncio_provider.dart';
import 'package:techcycle/src/provider/recompensa_provider.dart';
import 'ProfilePage.dart';
import 'DiscardsPage.dart';
import 'AdvertsPage.dart';
import 'NotificationsPage.dart';
import 'SettingsPage.dart';
import 'HelpPage.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AnuncioProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TechCycle',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 1;
  PageController _pageController = PageController(initialPage: 1);
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<AnuncioProvider>(context, listen: false).fetchAnuncios();
      Provider.of<RecompensaProvider>(context, listen: false).fetchRecompensas();
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(
        index,
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    });
  }

  void _navigateToPage(page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  Future<void> _refreshAnuncios() async {
    await Provider.of<AnuncioProvider>(context, listen: false).fetchAnuncios();
  }

  Future<void> _refreshRecompensas() async {
    await Provider.of<RecompensaProvider>(context, listen: false).fetchRecompensas();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TechCycle'),
        foregroundColor: Colors.white,
        backgroundColor: Colors.green,
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: <Widget>[
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Pesquisar...',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('Categorias'),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.green,
                        ),
                      ),
                    ),
                    SizedBox(width: 8), // Adding some space between the buttons
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('Filtros'),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.green,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: _refreshAnuncios,
                  child: Consumer<AnuncioProvider>(
                    builder: (context, anuncioProvider, child) {
                      if (anuncioProvider.isLoading) {
                        return Center(child: CircularProgressIndicator());
                      }

                      if (anuncioProvider.anuncios.isEmpty) {
                        return Center(child: Text('Nenhum anúncio encontrado'));
                      }

                      return ListView.builder(
                        itemCount: anuncioProvider.anuncios.length,
                        itemBuilder: (context, index) {
                          final anuncio = anuncioProvider.anuncios[index];
                          return Card(
                            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.asset(
                                        'assets/images/tvplaceholder.png',
                                        width: 100,
                                        height: 100,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 16),
                                  Expanded(
                                    flex: 3,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          anuncio.titulo,
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 8),
                                        Text(anuncio.descricao),
                                        SizedBox(height: 8),
                                        Text(
                                          'R\$ ${anuncio.preco.toStringAsFixed(2)}', // Formatando o preço
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.green,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          Center(
            child: Text('Mapa de pontos de coleta'),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Pesquisar...',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('Histórico'),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.green,
                        ),
                      ),
                    ),
                    SizedBox(width: 8), // Adding some space between the buttons
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('Filtros'),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.green,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: _refreshRecompensas,
                  child: Consumer<RecompensaProvider>(
                    builder: (context, recompensaProvider, child) {
                      if (recompensaProvider.isLoading) {
                        return Center(child: CircularProgressIndicator());
                      }

                      if (recompensaProvider.recompensa.isEmpty) {
                        return Center(child: Text('Nenhuma recompensa encontrada'));
                      }

                      return ListView.builder(
                        itemCount: recompensaProvider.recompensa.length,
                        itemBuilder: (context, index) {
                          final recompensa = recompensaProvider.recompensa[index];
                          return Card(
                            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.asset(
                                        'assets/images/ifoodplaceholder.png',
                                        width: 100,
                                        height: 100,
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 16),
                                  Expanded(
                                    flex: 3,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          recompensa.titulo,
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 8),
                                        Text(recompensa.descricao),
                                        SizedBox(height: 8),

                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
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
