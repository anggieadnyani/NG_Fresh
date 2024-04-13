import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Simulasi data profil
  Map<String, TextEditingController> _controllers = {
    'Nama': TextEditingController(text: 'Ni Luh Putu Anggie Adnyani'),
    'NIM': TextEditingController(text: '2215091043'),
    'Email': TextEditingController(text: 'anggieadnyani29@gmail.com'),
    'Nomor Telepon': TextEditingController(text: '085792463481'),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NEWS/API'),
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
      body: Stack(
        children: [
          Container(
            color: const Color.fromARGB(255, 244, 226, 248),
          ),
          ListView(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text(_controllers['Nama']!.text),
                accountEmail: Text(_controllers['Email']!.text),
                currentAccountPicture: CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/images/anggie.png'),
                ),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 75, 61, 61),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 3,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
              ),
              for (var entry in _controllers.entries)
                _buildEditableUserInfo(
                    label: entry.key, controller: entry.value),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEditableUserInfo(
      {required String label, required TextEditingController controller}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 3,
            offset: Offset(0, 1),
          ),
        ],
      ),
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        title: Text(label),
        subtitle: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: controller,
                readOnly: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                _editInfo(label);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _editInfo(String label) {
    TextEditingController controller = _controllers[label]!;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit $label'),
          content: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              hintText: 'Enter new $label',
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _controllers[label]!.text = controller.text;
                });
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ProfileScreen(),
  ));
}
