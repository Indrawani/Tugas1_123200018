import 'package:flutter/material.dart';
import 'halamanUtama.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = "";
  String password = "";
  bool isLoginSuccess = true;
  bool isHide = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFFB3E5FC),
        body: ListView(
          children: [
            Card(
              elevation: 40,
              shadowColor: Colors.black,
              color: Colors.white,
              margin: EdgeInsets.all(40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 20, left: 0, right: 0, top: 20),
                  child: Center(
                      child: Image.asset(
                        'images/logo.png',
                        width: 300,
                        height: 180,
                      )),
                ),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 20, horizontal: 60),
                  child: Center(
                    child: TextField(
                      enabled: true,
                      onChanged: (value) {
                        username = value;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius:
                          const BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                              color:
                              (isLoginSuccess) ? Colors.blue : Colors.red),
                        ),
                        labelText: "Email",
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 60),
                  child: Center(
                    child: TextField(
                      enabled: true,
                      onChanged: (value) {
                        password = value;
                      },
                      obscureText: isHide,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          borderSide: BorderSide(color: Colors.tealAccent),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius:
                          const BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                              color:
                              (isLoginSuccess) ? Colors.blue : Colors.red),
                        ),
                        suffixIcon: GestureDetector(
                          onTap: (){
                            setState(() {
                              isHide = !isHide;
                            });
                          },
                          child: Icon(
                            isHide ? Icons.visibility_off : Icons.visibility,
                            color: isHide ? Colors.grey : Colors.blue,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.only(bottom: 30, left: 120, right: 120, top: 20),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        String text = "";
                        if (password == "admin" && username == "admin") {
                          setState(() {
                            text = "Login Success";
                            isLoginSuccess = true;
                          });
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                                return const HalamanUtama();
                              }));
                        } else {
                          setState(() {
                            text = "Login Failed";
                            isLoginSuccess = false;
                          });
                        }
                        SnackBar snackBar = SnackBar(content: Text(text));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      child: const Text("Login"),
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(45),
                          primary: (isLoginSuccess) ? Colors.blue : Colors.red,
                          onPrimary: Colors.white,
                          shape: StadiumBorder()),
                    ),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
