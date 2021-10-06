import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:tugas5_si/provider/daftar_provider.dart';
import 'package:tugas5_si/ui/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <SingleChildWidget>[
        ChangeNotifierProvider(create: (_) => DaftarProvider())
      ],
      child: MaterialApp(
        home: Home(),
      ),
    );
  }
}
