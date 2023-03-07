import 'package:flutter/material.dart';
import 'login_page.dart';

class HalamanUtama extends StatefulWidget {
  const HalamanUtama({Key? key}) : super(key: key);

  @override
  _HalamanUtamaState createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFFB3E5FC),
        appBar: AppBar(
          title: const Text("Menu Utama"),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return const LoginPage();
                  }),
                      (route) => false,
                );
              },
            ),
          ],
        ),
        body: ListView(children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 60),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'images/logo.png',
                    width: 160,
                    height: 160,
                  ),
                  Text(
                    'Selamat Datang di Pratikum Mobile',
                    style: TextStyle(fontSize: 25),
                  ),
                ]),
          ),
        ]),
      ),
    );
  }
}