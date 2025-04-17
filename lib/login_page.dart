import 'package:flutter/material.dart';
import 'package:login/dashboard_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController emailContoller = TextEditingController();
  TextEditingController Passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('login page'),
          centerTitle: false,
        ),
        body: Form(
          key: _formkey,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 9.0,
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 10.0
                  ),
                  child: TextFormField(
                   controller: emailContoller,
                    decoration: InputDecoration(
                      label: Text('Email'),
                      border: OutlineInputBorder(),
                     ),
                     validator: (value) {
                      if(value == null || value.isEmpty) {
                        return 'Masukan email anda';
                      }
                     },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 10.0
                  ),
                  child: TextFormField(
                   controller: Passwordcontroller,
                    decoration: InputDecoration(
                      label: Text('Password'),
                      border: OutlineInputBorder(),
                     ),
                     validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Masukan password anda';
                      }
                     },
                  ),
                ),
                Padding(
                  padding:EdgeInsets.symmetric(horizontal: 9.0, vertical: 10.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                      debugPrint('Email: ${emailContoller.text}');
                      debugPrint('Password: ${Passwordcontroller.text}');

                      if(_formkey.currentState!.validate()) {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => Dashboardpage(email: emailContoller.text)
                          ));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Silahkan Lengkapi form!'),
                          ),
                        );
                      }
                    },
                    child: Text('Submit'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      );
  }
}