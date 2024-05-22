import 'package:e_shop/dal/photo_dao.dart';
import 'package:e_shop/providers/photo_provider.dart';
import 'package:e_shop/values/theme.dart';
import 'package:e_shop/views/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Auth extends StatelessWidget {
  final PhotoDao photoDao;
  const Auth(this.photoDao, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'e-shop',
      debugShowCheckedModeBanner: false,
      theme: themeApp,
      home: ScreenAuth(photoDao),
    );
  }
}

class ScreenAuth extends StatefulWidget {
  final PhotoDao photoDao;
  const ScreenAuth(this.photoDao, {super.key});

  @override
  State<ScreenAuth> createState() => _ScreenAuthState();
}

class _ScreenAuthState extends State<ScreenAuth> {
  var isAuth = true;
  final _email = TextEditingController();

  final _password = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Auhtentication',
            style: TextStyle(
              color: Colors.white,
            )),
        leading: GestureDetector(
            onTap: () => _showDialog(context), child: const Icon(Icons.menu)),
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.95,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.login_rounded,
                size: 60,
                color: Theme.of(context).colorScheme.primary,
              ),
              const Padding(padding: EdgeInsets.all(10)),
              SizedBox(
                child: Column(
                  children: [
                    TextField(
                      controller: _email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          suffixIcon: const Icon(Icons.email),
                          hintText: 'Tape email',
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary),
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ],
                ),
              ),
              const Padding(padding: EdgeInsets.all(10)),
              TextField(
                obscureText: true,
                controller: _password,
                decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.password_rounded),
                    hintText: 'Tape password',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2,
                            color:
                                Theme.of(context).colorScheme.inversePrimary),
                        borderRadius: BorderRadius.circular(10))),
              ),
              const Padding(padding: EdgeInsets.all(10)),
              ElevatedButton(
                  onPressed: () {
                    _auth();
                  },
                  child: const Text('Login')),
              Text(
                isAuth ? '' : 'email or password is empty',
                style: themeApp.textTheme.bodyMedium,
              )
            ],
          ),
        ),
      ),
    );
  }

  void _auth() {
    setState(() {
      if (_email.text.isEmpty || _password.text.isEmpty) {
        isAuth = false;
      } else {
        isAuth = true;
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: ((_) => MultiProvider(providers: [
                      ChangeNotifierProvider(
                        create: ((_) => PhotoProvider()),
                      ),
                    ], child: DashBoard(photoDao: widget.photoDao)))));
      }
    });
  }

  _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              backgroundColor: themeApp.appBarTheme.backgroundColor,
              title: Text(
                'Test Menu',
                style: themeApp.textTheme.titleMedium,
              ),
              content:
                  Text('menu clicked', style: themeApp.textTheme.titleMedium),
              actions: [
                ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Ok'))
              ],
            ));
  }
}
