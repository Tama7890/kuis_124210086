import 'package:flutter/material.dart';
import 'package:pertemuanlima/halamanutama.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  String username= "";
  String password= "";

  bool islogin=false;
  bool ispasswordNotVisible = true;

  late TextEditingController usernameController;
  late TextEditingController passwordController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    usernameController= TextEditingController();
    passwordController= TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.home),
        title: Text('JENDELA BACA'),
        actions: [
          Icon(Icons.search),
          Icon(Icons.lock),
        ],
      ),
      body: SingleChildScrollView(
        child:Padding(
          padding: const EdgeInsets.fromLTRB(30, 50, 30, 50),

          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                  image: NetworkImage('https://media.istockphoto.com/id/1270155083/id/vektor/vektor-desain-logo-e-book-biru-tanda-simbol-ikon-pustaka-buku-elektronik.jpg?s=612x612&w=0&k=20&c=ehvcNGhU1skV6-9C-qyuz23oTWluvIwzM9uMs8zkKYQ='),
                  width: 200,
                  height: 200,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width/5,
              ),
              Text(
                'silahkan login',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(
                height: 20,
              ),

              TextFormField(
                controller: usernameController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'input username (kuis)',
                  labelText: 'username',
                ),
                onChanged: (value){username= value;
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                obscureText: true,
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'input password (123)',
                  labelText: 'password',
                ),
                onChanged: (value) {
                  password = value;
                },

              ),


              SizedBox(
                height: 100,
              ),

              ElevatedButton(
                  child: Text('login'),
                  onPressed:() {
                    String message= "";
                    username= usernameController.text;
                    password= passwordController.text.trim();
                    if(username=="kuis"&& password=="123") {
                      Navigator.push(context, MaterialPageRoute(builder: ((context) => halamanutama())));
                      setState(() {
                        message = "yeayyy berhasil login";
                        islogin = true;


                      });
                    }
                    else {
                      message = "hmmmm salah";
                      islogin = false;
                    }
                    var snackBar = SnackBar(content: Text(message),
                      backgroundColor: (islogin)? Colors.green: Colors.red,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
              ),



              TextButton(
                  onPressed:() {},
                  child: Text('lupa password?')
              ),
            ],
          ),
        ),
      ),
    );
  }
}

