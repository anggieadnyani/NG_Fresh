import 'package:app_anggie/screens/notifikasi_screen.dart';
import 'package:app_anggie/screens/API_screen.dart';
import 'package:app_anggie/screens/SQLite_screen.dart';
import 'package:app_anggie/screens/categories.dart';
import 'package:app_anggie/screens/home_screen.dart';
import 'package:app_anggie/screens/keranjang_screen.dart';
import 'package:app_anggie/screens/login_screen.dart';
import 'package:app_anggie/screens/profile_screen.dart';
import 'package:app_anggie/screens/rincianbarang.dart';
import 'package:app_anggie/screens/routes/SecondScreen/custom_screen.dart';
import 'package:app_anggie/screens/routes/SecondScreen/menumakanan.dart';
import 'package:app_anggie/screens/routes/SecondScreen/second_screen.dart';
import 'package:app_anggie/screens/routes/signin_screen.dart';
import 'package:app_anggie/screens/setting_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: login_screen(),
      routes: {
        '/second-screen': (context) => const SecondScreen(),
        '/custom-screen': (context) => const CustomScreen(),
        '/login_screen': (context) => login_screen(),
        '/home_screen': (context) => MainPage(),
        '/my_homepage': (context) => MyHomePage(title: 'Beranda'),
        '/sign-in': (context) => SignInScreen(),
        '/menumakanan': (context) => menumakanan(),
        '/rincianbarang': (context) => RincianBarang(),
        '/categories': (context) => Categories(),
        '/keranjang': (context) => KeranjangScreen(),
        'notifikasi': (context) => NotificationPage()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  BottomNavigationBarType _bottomNavType = BottomNavigationBarType.shifting;

  final List<Widget> _screens = [
    MainPage(),
    KeranjangScreen(),
    NotificationPage(),
  ];

  final List<String> _appBarTitles = const [
    'Beranda',
    'Keranjang',
    'Notifikasi',
  ]; // List of titles corresponding to each screen

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitles[_selectedIndex]),
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 244, 226, 248),
                Color.fromRGBO(204, 130, 242, 1),
              ],
            ),
          ),
        ),
      ),
      body: _screens[_selectedIndex],
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(
                'Ni Luh Putu Anggie Adnyani',
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
              accountEmail: const Text(
                '2215091043',
                style: TextStyle(color: Colors.black87, fontSize: 13),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/anggie.png'),
              ),
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 239, 204, 240)),
            ),
            Divider(height: 10),
            ListTile(
              leading: Icon(Icons.flare_sharp),
              title: Text('tugas.API'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => APIScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('tugas SQLite'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SQLiteScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Log Out'),
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => login_screen()),
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromRGBO(204, 130, 242, 1),
        unselectedItemColor: Color.fromARGB(255, 199, 161, 208),
        type: _bottomNavType,
        onTap: _onItemTapped,
        items: _navBarItems,
      ),
    );
  }
}

const _navBarItems = [
  BottomNavigationBarItem(
    icon: Icon(Icons.home_outlined),
    activeIcon: Icon(Icons.home),
    label: 'Beranda',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.shopping_cart_outlined),
    activeIcon: Icon(Icons.shopping_cart_rounded),
    label: 'Keranjang',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.notifications_outlined),
    activeIcon: Icon(Icons.notifications),
    label: 'Notifikasi',
  ),
];
