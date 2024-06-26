import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas/components/login.dart';
import 'package:tugas/components/prov_set.dart';
import 'package:tugas/components/favoriteprovider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SettingsProvider()),
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<SettingsProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: prov.enableDarkMode ? prov.dark : prov.light,
      home: const Login(),
    );
  }
}
