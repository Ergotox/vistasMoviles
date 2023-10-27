import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vistas/screens/home.dart';
import 'package:vistas/screens/profile.dart';
import 'package:vistas/screens/successful_payment.dart';

void main() {
  //WidgetsFlutterBinding.ensureInitialized();
  //SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) => runApp(const MyApp()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      routes: {
        '/profile': (context) => Profile(),
        // Agrega más rutas según sea necesario
      },
    );
  }
}
