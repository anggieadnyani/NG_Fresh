import 'package:flutter/material.dart';

class menumakanan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 244, 226, 248),
      appBar: AppBar(
        title: Text('Resep Makanan'),
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.grey,
              child: Image.network(
                'https://www.dapurkobe.co.id/wp-content/uploads/capcay-saus-tiram.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  Text(
                    'Resep Capcay Saus Tiram:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Bahan:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(' - Sayuran (brokoli, wortel, buncis, jagung, jamur, dll)'),
                  Text(' - Udang atau daging ayam/daging sapi (opsional)'),
                  Text(' - Saus tiram'),
                  Text(' - Bawang putih, bawang bombay, jahe (secukupnya)'),
                  SizedBox(height: 10),
                  Text(
                    'Langkah-langkah:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(' 1. Tumis bawang putih, bawang bombay, dan jahe hingga harum.'),
                  Text(' 2. Tambahkan daging atau seafood jika digunakan, masak hingga matang.'),
                  Text(' 3. Masukkan sayuran, aduk hingga setengah matang.'),
                  Text(' 4. Tuang saus tiram, aduk rata hingga sayuran matang dan saus meresap.'),
                  Text(' 5. Angkat dan sajikan selagi hangat.'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
