import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(KeranjangApp());
}

class KeranjangApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: KeranjangScreen(),
    );
  }
}

class KeranjangScreen extends StatefulWidget {
  @override
  _KeranjangScreenState createState() => _KeranjangScreenState();
}

class _KeranjangScreenState extends State<KeranjangScreen> {
  List<CartItem> _cartItems = [
    CartItem(name: "kubis", price: 8000),
    CartItem(name: "wortel", price: 9000) // Add more cart items here
  ];

  String formatCurrency(double amount) {
    // Format mata uang ke format Rupiah Indonesia
    final currencyFormatter = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp');
    return currencyFormatter.format(amount);
  }

  double get totalAmount => _cartItems.fold(0, (sum, item) => sum + item.price);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 246, 233, 249),
      body: ListView.builder(
        itemCount: _cartItems.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Image.asset('assets/images/kubis.png'), // Ganti dengan gambar keranjang
            title: Text(_cartItems[index].name),
            subtitle: Text(formatCurrency(_cartItems[index].price)),
            trailing: IconButton(
              icon: Icon(Icons.remove_shopping_cart),
              onPressed: () {
                setState(() {
                  _cartItems.removeAt(index);
                });
              },
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total: ${formatCurrency(totalAmount)}',
              style: TextStyle(fontSize: 18),
            ),
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
          ],
        ),
      ),
    );
  }
}

class CartItem {
  final String name;
  final double price;

  CartItem({required this.name, required this.price});
}
