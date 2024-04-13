import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: RincianBarang(),
  ));
}

class Pesanan {
  final String nama;
  final int harga;
  final int jumlah;

  Pesanan({
    required this.nama,
    required this.harga,
    required this.jumlah,
  });
}

class RincianBarang extends StatefulWidget {
  @override
  _RincianBarangState createState() => _RincianBarangState();
}

class _RincianBarangState extends State<RincianBarang> {
  int _count = 0;

  void _increment() {
    setState(() {
      _count++;
    });
  }

  void _decrement() {
    if (_count > 0) {
      setState(() {
        _count--;
      });
    }
  }
void keranjangscreen(Pesanan pesanan) {
    // Implementasi logika penambahan ke keranjang di sini
    // Misalnya, Anda bisa menyimpan pesanan ke dalam daftar pesanan atau state
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 226, 248),
      appBar: AppBar(
        title: Text('Detail Produk'),
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
          SizedBox(
            height: 300,
            child: Image.asset(
              'assets/images/kubis.png',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sayur Segar Kubis',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Rp8000',
                      style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                    ),
                    Text(
                      '8,6RB Terjual',
                      style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Text(
                  'Garansi tiba: 6 - 13 Mei',
                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                ),
                SizedBox(height: 8),
                Text(
                  'Dapatkan Voucher Rp10.000 jika pesanan terlambat.',
                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                ),
                SizedBox(height: 16),
                Text(
                  'Penilaian Produk',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber),
                    Icon(Icons.star, color: Colors.amber),
                    Icon(Icons.star, color: Colors.amber),
                    Icon(Icons.star, color: Colors.amber),
                    Icon(Icons.star_half, color: Colors.amber),
                    SizedBox(width: 8),
                    Text(
                      '4.8/5 (4.1RB Ulasan)',
                      style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                    ),
                  ],
                ),
                Container(
                  height: 2,
                  color: Colors.black, // Warna garis
                  margin: EdgeInsets.symmetric(vertical: 8), // Atur jarak vertikal
                ),
                SizedBox(height: 8),
                Text(
                  'MASUKKAN JUMLAH PESANAN:'
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: _increment,
                      icon: const Icon(Icons.add),
                    ),
                    Text(
                      '$_count ',
                      style: const TextStyle(color: Color.fromARGB(255, 9, 9, 9)),
                    ),
                    IconButton(
                      onPressed: _decrement,
                      icon: const Icon(Icons.remove),
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Tampilkan dialog "Checkout" saat tombol ditekan
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Checkout'),
                          content: Text('Pesanan anda berhasil diproses.'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text('Checkout'),
                ),
                ElevatedButton(
  onPressed: () {
    keranjangscreen(Pesanan(
      nama: 'Sayur Segar Kubis',
      harga: 5000, // Atur harga sesuai dengan kebutuhan Anda
      jumlah: _count, // Gunakan jumlah yang dipilih oleh pengguna
    ));
    // Tampilkan pesan bahwa produk telah ditambahkan ke keranjang
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Tambah ke Keranjang'),
          content: Text('Produk berhasil ditambahkan ke keranjang.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  },
  child: Text('Tambah ke Keranjang'),
),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
