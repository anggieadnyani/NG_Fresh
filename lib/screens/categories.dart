import 'package:app_anggie/screens/rincianbarang.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 244, 226, 248),
      appBar: AppBar(
        title: Text('Categories'),
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
      body: SingleChildScrollView(
        child: GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            _buildItem('Wortel', 'Rp3000', 'Stok: 100', 'assets/images/wortel.png', context),
            _buildItem('Ubi Jalar', 'Rp5000', 'Stok: 200', 'assets/images/ubi_jalar.png', context),
            _buildItem('Lobak', 'Rp7000', 'Stok: 400', 'assets/images/lobak.png', context),
            _buildItem('Kubis', 'Rp8000', 'Stok: 500', 'assets/images/kubis.png', context),
            _buildItem('Mentimun', 'Rp3000', 'Stok: 600', 'assets/images/mentimun.png', context),
            _buildItem('Pakcoy', 'Rp7000', 'Stok:600', 'assets/images/pakcoi.png', context),
            _buildItem('Pare', 'Rp4000', 'Stok: 700', 'assets/images/pare.png', context),
            _buildItem('Terong', 'Rp2000', 'Stok: 80', 'assets/images/terong.png', context),
            _buildItem('Rebung', 'Rp50000', 'Stok: 70', 'assets/images/rebung.png', context),
            _buildItem('Sawi', 'Rp7000', 'Stok: 800', 'assets/images/sawi.png', context),
            _buildItem('Selada', 'Rp9000', 'Stok:500Kg', 'assets/images/selada.png', context),
            _buildItem('Seledri', 'Rp2000', 'Stok:200Kg', 'assets/images/seledri.png', context),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(String name, String price, String description, String imagePath, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RincianBarang()),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(5.8),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: const Color.fromARGB(255, 219, 122, 122)),
            borderRadius: BorderRadius.circular(10.0),
          ),
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.asset(
                imagePath,
                height: 70,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20.5),
              Text(
                name,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'Harga: $price',
                style: TextStyle(
                  fontSize: 12.0,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                description,
                style: TextStyle(
                  fontSize: 12.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Categories(),
  ));
}
