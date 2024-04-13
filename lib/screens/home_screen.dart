import 'package:app_anggie/screens/categories.dart';
import 'package:app_anggie/screens/rincianbarang.dart';
import 'package:app_anggie/screens/routes/SecondScreen/menumakanan.dart';
import 'package:app_anggie/screens/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:app_anggie/screens/keranjang_screen.dart';


void main() {
  runApp(MainPage());
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 244, 226, 248),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/images.jpg'),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 234, 200, 242).withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    'Selamat Datang di NG FRESH',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Resep Makanan',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 120,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          _buildRecipeItem(
                            context: context,
                            image: AssetImage('assets/images/capcai.png'),
                            title: 'Capcay',
                          ),
                          _buildRecipeItem(
                            context: context,
                            image: AssetImage('assets/images/sup.png'),
                            title: 'Sup',
                          ),
                          _buildRecipeItem(
                            context: context,
                            image: AssetImage('assets/images/tumis.png'),
                            title: 'Tumis Kangkung',
                          ),
                          _buildRecipeItem(
                            context: context,
                            image: AssetImage('assets/images/lodeh.png'),
                            title: 'Sayur Lodeh',
                          ),
                          _buildRecipeItem(
                            context: context,
                            image: AssetImage('assets/images/asem.png'),
                            title: 'Sayur Asem',
                            ),
                            _buildRecipeItem(
                            context: context,
                            image: AssetImage('assets/images/gado.png'),
                            title: 'Gado-Gado',
                            ),
                            _buildRecipeItem(
                            context: context,
                            image: AssetImage('assets/images/buncis.png'),
                            title: 'Tumis Buncis',
                            ),
                            _buildRecipeItem(
                            context: context,
                            image: AssetImage('assets/images/pergedel.png'),
                            title: 'Perkedel Jagung',
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Kategori',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Semua',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    SizedBox(
                      height: 50, // Adjust the height according to your need
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                         _buildCategoryItem(context: context, title: 'All'),
                        _buildCategoryItem(context: context, title: 'Sayur Hijau'),
                        _buildCategoryItem(context: context, title: 'Sayur Batang'),
                        _buildCategoryItem(context: context, title: 'Sayur Buah'),
                        _buildCategoryItem(context: context, title: 'Ibu dan Anak'),
                        _buildCategoryItem(context: context, title: 'Paket sayuran'),
                        _buildCategoryItem(context: context, title: 'Bumbu'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Sayuran',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          _buildVegetableItem(
                            context: context,
                            image: AssetImage('assets/images/kubis.png'),
                            name: 'Kubis',
                            price: '2000',
                            stock: 'Stock: 100',
                          ),
                          _buildVegetableItem(
                            context: context,
                            image: AssetImage('assets/images/rebung.png'),
                            name: 'Rebung',
                            price: '5000',
                            stock: 'Stock: 150',
                          ),
                          _buildVegetableItem(
                            context: context,
                            image: AssetImage('assets/images/terong.png'),
                            name: 'Terong',
                            price: '4000',
                            stock: 'Stock: 200',
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          _buildVegetableItem(
                            context: context,
                            image: AssetImage('assets/images/pare.png'),
                            name: 'Pare',
                            price: '2000',
                            stock: 'Stock: 80',
                          ),
                          _buildVegetableItem(
                            context: context,
                            image: AssetImage('assets/images/pakcoi.png'),
                            name: 'Pakcoy',
                            price: '3000',
                            stock: 'Stock: 120',
                          ),
                          _buildVegetableItem(
                            context: context,
                            image: AssetImage('assets/images/mentimun.png'),
                            name: 'Timun',
                            price: '5000',
                            stock: 'Stock: 50',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRecipeItem({
    required BuildContext context,
    required AssetImage image,
    required String title,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => menumakanan(),
          ),
        );
      },
      child: Container(
        width: 200,
        margin: EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 250, 147, 254).withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Image(
                image: image,
                height: 80,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
 Widget _buildCategoryItem({required BuildContext context, required String title}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Categories()),
      );
    },
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 250, 147, 254),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}



  Widget _buildVegetableItem({
    required BuildContext context,
    required ImageProvider image,
    required String name,
    required String price,
    required String stock,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => RincianBarang(),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image(
                image: image,
                height: 80,
                width: 80,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  price,
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  stock,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
