import 'package:flutter/material.dart';
import 'package:app_anggie/dto/news.dart';
import 'package:app_anggie/services/data_service.dart';

class APIScreen extends StatefulWidget {
  const APIScreen({Key? key}) : super(key: key);

  @override
  _APIScreenState createState() => _APIScreenState();
}

class _APIScreenState extends State<APIScreen> {
  late Future<List<News>> _news;

  final _simpanTitle = TextEditingController();
  final _simpanBody = TextEditingController();

  @override
  void initState() {
    super.initState();
    _news = DataService.fetchNews();
  }

  @override
  void dispose() {
    _simpanTitle.dispose();
    _simpanBody.dispose();
    super.dispose();
  }

  void showIsian(News post) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(post.title),
        content: SizedBox(
          height: 200,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.network(post.photo),
                Text(post.idCategory.toString()),
                Text(post.id),
                Text(post.body),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  void showInput() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Masukkan Data"),
        content: Column(
          children: [
            TextField(
              controller: _simpanTitle,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: const Color.fromARGB(255, 199, 161, 208))),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
                hintText: 'Title'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _simpanBody,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: const Color.fromARGB(255, 199, 161, 208))),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
                hintText: 'Body'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              DataService.sendNews(_simpanTitle.text, _simpanBody.text);
              Navigator.pop(context);
              setState(() {
                _news = DataService.fetchNews();
              });
              // Tampilkan pop berhasil ditambahkan
              _showSuccessDialog();
            },
            child: Text('Send'),
          ),
        ],
      ),
    );
  }

  void _deleteNews(String id) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Konfirmasi"),
        content: Text("Apakah Anda yakin ingin menghapus berita ini?"),
        actions: [
          TextButton(
            onPressed: () {
              DataService.deleteData(id);
              Navigator.pop(context);
              setState(() {
                _news = DataService.fetchNews();
              });
            },
            child: Text('Ya'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Tidak'),
          ),
        ],
      ),
    );
  }

  void _showUpdateDialog(News post) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Update Berita"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: TextEditingController(text: post.title),
              onChanged: (value) {
                post.title = value;
              },
              decoration: InputDecoration(
                labelText: "Title",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: TextEditingController(text: post.body),
              onChanged: (value) {
                post.body = value;
              },
              decoration: InputDecoration(
                labelText: "Body",
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              DataService.updateData(post.id, post.title, post.body);
              Navigator.pop(context);
              setState(() {
                _news = DataService.fetchNews();
              });
            },
            child: Text('Update'),
          ),
        ],
      ),
    );
  }

  // Fungsi untuk menampilkan pop-up berhasil ditambahkan
  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Sukses'),
          content: Text('Item berhasil ditambahkan!'),
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
  }

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
      backgroundColor: Color.fromARGB(255, 244, 226, 248),
      body: Center(
        child: FutureBuilder<List<News>>(
          future: _news,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final post = snapshot.data![index];
                  return GestureDetector(
                    onTap: () {
                      showIsian(post);
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 120,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8.0),
                                bottomLeft: Radius.circular(8.0),
                              ),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(post.photo),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    post.title,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    post.body,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Color.fromARGB(255, 188, 102, 207),
                                    ),
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          IconButton(
                                            icon: Icon(Icons.delete),
                                            onPressed: () {
                                              _deleteNews(post.id);
                                            }
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.edit),
                                            onPressed: () {
                                              _showUpdateDialog(post);
                                            }
                                          ),
                                        ],
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.more_vert),
                                        onPressed: () {}
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return CircularProgressIndicator();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showInput();
        },
        child: Icon(Icons.add),
        backgroundColor: const Color.fromARGB(255, 244, 226, 248),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
