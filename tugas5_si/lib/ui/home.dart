import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas5_si/models/daftar.dart';
import 'package:tugas5_si/provider/daftar_provider.dart';

import '../ui/detail.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List HP 2020'),
      ),
      body: Consumer<DaftarProvider>(
        builder: (BuildContext context, DaftarProvider value, Widget? child) {
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(value.listDaftar[index].nama),
                trailing: ElevatedButton(
                  onPressed: () {
                    value.hapus(value.listDaftar[index]);
                  },
                  child: Text('Hapus'),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Detail(
                                daftar: value.listDaftar[index],
                              )));
                },
              );
            },
            itemCount: value.listDaftar.length,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Detail()));
        },
      ),
    );
  }
}
