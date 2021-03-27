import 'package:biddee_flutter/providers/MainScreenProvider.dart';
import 'package:biddee_flutter/screens/LoginScreen.dart';
import 'package:biddee_flutter/screens/MainScreen.dart';
import 'package:biddee_flutter/screens/NewItemScreen.dart';
import 'package:biddee_flutter/screens/RegisterScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MainScreenProvider(),
        ),
      ],
      child: GetMaterialApp(
        title: 'Biddee',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Color(0xFF1080c5),
          shadowColor: Color(0xFFf5f8fc),
          primaryColorDark: Color(0xFF0e6396),
          errorColor: Color(0xFFff6b6b),
        ),
        home: NewItemScreen(),
        debugShowCheckedModeBanner: false,
        routes: {
          '/main': (context) => MainScreen(),
          '/login': (context) => LoginScreen(),
          '/register': (context) => RegisterScreen(),
          '/newitem': (context) => NewItemScreen(),
        },
      ),
    );
  }
}