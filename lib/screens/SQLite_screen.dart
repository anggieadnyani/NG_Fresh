import 'package:app_anggie/screens/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import paket intl untuk kelas DateFormat

class SQLiteScreen extends StatefulWidget {
  const SQLiteScreen({Key? key}) : super(key: key);

  @override
  _SQLiteScreenState createState() => _SQLiteScreenState();
}

class _SQLiteScreenState extends State<SQLiteScreen> {
  List<Map<String, dynamic>> _allData = [];

  bool _isLoading = true;

  void _refreshData() async {
    final data = await SQLHelper.getAllData();
    setState(() {
      _allData = data.map((item) {
        final formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').parse(item['createdAt'] as String);
        return {
          ...item,
          'formattedDate': formattedDate,
        };
      }).toList();
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshData();
  }

  Future<void> _addData() async {
  if (_titleController.text.isEmpty || _descController.text.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Color.fromARGB(255, 249, 5, 34),
        content: Text('Mohon Isi Setiap Bagian!')));
  } else {
    final currentDate = DateTime.now(); // Ambil tanggal dan waktu saat ini
    final formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(currentDate); // Format tanggal sesuai preferensi (contoh: 'yyyy-MM-dd HH:mm:ss')
    await SQLHelper.createData(_titleController.text, _descController.text,
        _imageUrlController.text); // Tambahkan tanggal saat memasukkan data
    _refreshData();
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.green,
        content: Text('Item telah berhasil ditambahkan!')));
  }
}

  Future<void> _updateData(int id) async {
    final currentDate = DateTime.now(); // Ambil tanggal dan waktu saat ini
    final formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(currentDate); // Format tanggal sesuai preferensi (contoh: 'yyyy-MM-dd HH:mm:ss')
    await SQLHelper.updateData(id, _titleController.text, _descController.text,
        _imageUrlController.text); // Perbarui tanggal saat memperbarui data
    _refreshData();
  }

  Future<void> _deleteData(int id) async {
    await SQLHelper.deleteData(id);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.blueGrey, content: Text('Data Dihapus!')));
    _refreshData();
  }

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();

  void showBottomSheet(int? id) async {
    if (id != null) {
      final existingData = _allData.firstWhere((element) => element['id'] == id,
          orElse: () => {});
      if (existingData.isNotEmpty) {
        _titleController.text = existingData['title'];
        _descController.text = existingData['desc'];
        _imageUrlController.text = existingData['imageUrl'];
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Data with that ID not found')));
      }
    }

    showModalBottomSheet(
      elevation: 5,
      isScrollControlled: true,
      context: context,
      builder: (_) => Container(
        padding: EdgeInsets.only(
          top: 30,
          left: 15,
          right: 15,
          bottom: MediaQuery.of(context).viewInsets.bottom + 50,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Title",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: _descController,
              maxLines: 4,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Description",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: _imageUrlController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Image URL",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  if (id == null) {
                    await _addData();
                  }
                  if (id != null) {
                    await _updateData(id);
                  }

                  _titleController.text = "";
                  _descController.text = "";
                  _imageUrlController.text = "";

                  Navigator.of(context).pop();
                  print("Data Added");
                },
                child: Padding(
                  padding: EdgeInsets.all(18),
                  child: Text(
                    id == null ? "Add Data" : "Update",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SQLite CRUD'),
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
      backgroundColor: Color.fromARGB(255, 244, 226, 248),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _allData.length,
              itemBuilder: (context, index) => Card(
                margin: EdgeInsets.all(15),
                child: ListTile(
                  leading: _allData[index]['imageUrl'] != null
                      ? Image.network(
                          _allData[index]['imageUrl'],
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        )
                      : SizedBox.shrink(),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          _allData[index]['title'],
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Text(
                        _allData[index]['desc'],
                        style: TextStyle(fontSize: 15,color: Color.fromARGB(255, 223, 118, 247)),
                      ),
                      Text(
                        "Tanggal: ${DateFormat('yyyy-MM-dd').format(_allData[index]['formattedDate'])}",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          showBottomSheet(_allData[index]['id']);
                        },
                        icon: Icon(
                          Icons.edit,
                          color: Colors.blueGrey,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          _deleteData(_allData[index]['id']);
                        },
                        icon: Icon(
                          Icons.delete,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showBottomSheet(null),
        child: Icon(Icons.add),
        backgroundColor: Color.fromARGB(255, 224, 129, 246),
      ),
    );
  }
}
