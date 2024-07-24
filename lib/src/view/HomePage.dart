import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:techcycle/src/provider/anuncio_provider.dart';
import 'package:techcycle/src/provider/recompensa_provider.dart';
import 'package:techcycle/src/provider/pontos_coleta_provider.dart';

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
  int _selectedIndex = 1;
  PageController _pageController = PageController(initialPage: 1);
  TextEditingController _searchController = TextEditingController();

  late GoogleMapController mapController;

  static const CameraPosition _initialPosition = CameraPosition(
    target: LatLng(-8.891076456862265, -36.496254904851526),
    zoom: 20.0,
  );

  final List<Marker> myMarker = [];
  final List<Marker> markerList = const [
    // Marker(
    //   markerId: MarkerId('local_1'),
    //   position: LatLng(-8.891644112516403, -36.49550210591994),
    //   infoWindow: InfoWindow(title: 'Casas Bahia'),
    // ),
    // Marker(
    //   markerId: MarkerId('local_2'),
    //   position: LatLng(-8.882339489423634, -36.479158619049535),
    //   infoWindow: InfoWindow(title: 'Bonanza'),
    // ),
    // Marker(
    //   markerId: MarkerId('local_3'),
    //   position: LatLng(-8.889801933472567, -36.49276278317157),
    //   infoWindow: InfoWindow(title: 'Magazine Luiza'),
    // ),
  ];

  final Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<AnuncioProvider>(context, listen: false).fetchAnuncios();
      Provider.of<RecompensaProvider>(context, listen: false).fetchRecompensas();
      Provider.of<PontosColetaProvider>(context, listen: false).fetchPontosColetas();
    });
    myMarker.addAll(markerList);
    packData();
  }

  Future<Position> getUserLocation() async {
    await Geolocator.requestPermission().then((value) {}).onError((error, stackTrace) {
      print('Error $error');
    });

    return await Geolocator.getCurrentPosition();
  }

  packData() {
    getUserLocation().then((value) async {
      myMarker.add(Marker(
        markerId: const MarkerId('UserLocation'),
        position: LatLng(value.latitude, value.longitude),
        infoWindow: const InfoWindow(title: 'Minha Localização'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
      ));

      // Atualize o mapa com os marcadores combinados
      setState(() {});
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

  void _navigateToPage(Widget page) {
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

  void _search(String query) {
    // Lógica para buscar anúncios ou recompensas com base no texto `query`
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
        physics: const NeverScrollableScrollPhysics(),
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
                  onChanged: (text) {
                    _search(text);
                  },
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
                    SizedBox(width: 8),
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
                                          'R\$ ${anuncio.preco.toStringAsFixed(2)}',
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
          Consumer<PontosColetaProvider>(
            builder: (context, pontoColetaProvider, child) {
              return Stack(
                children: <Widget>[
                  GoogleMap(
                    initialCameraPosition: _initialPosition,
                    mapType: MapType.normal,
                    markers: {...pontoColetaProvider.markers, ...myMarker.toSet()},
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                  ),
                  Positioned(
                    bottom: 16.0,
                    left: 16.0,
                    child: FloatingActionButton(
                      onPressed: () async {
                        Position userLocation = await getUserLocation();
                        CameraPosition cameraPosition = CameraPosition(
                          target: LatLng(userLocation.latitude, userLocation.longitude),
                          zoom: 20.0,
                        );
                        final GoogleMapController controller = await _controller.future;
                        controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
                        setState(() {});
                      },
                      child: Icon(
                        Icons.gps_fixed,
                        color: Colors.white,
                        size: 35,
                      ),
                      backgroundColor: Colors.green,
                      elevation: 6.0,
                      shape: CircleBorder(),
                    ),
                  ),
                ],
              );
            },
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    _navigateToPage(DiscardsPage());
                  },
                  child: Text('Histórico de Descartes'),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.green,
                  ),
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
                        return Center(child: Text('Nenhuma recompensa disponível. Verifique mais tarde!'));
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
                                          recompensa.titulo,
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 8),
                                        Text(recompensa.descricao),
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
        unselectedItemColor: Colors.white70,
        backgroundColor: Colors.green,
        onTap: _onItemTapped,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }

  Widget _buildIcon(IconData icon, int index) {
    return Icon(
      icon,
      color: _selectedIndex == index ? Colors.white : Colors.white70,
      size: 30.0,
    );
  }
}
