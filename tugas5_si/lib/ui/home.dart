import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas5_si/Widget/appbar.dart';
import 'package:tugas5_si/Widget/container.dart';
import 'package:tugas5_si/Widget/text_field.dart';
import 'package:tugas5_si/provider/daftar_provider.dart';

import '../ui/detail.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backgroundcolor: Colors.purple,
        leading: IconButton(
          onPressed: () {
            exit(0);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Stack(
          children: const <Widget>[
            CustomContainer(
              height: 35,
              child: TextSearch(),
            ),
          ],
        ),
        actions: const [
          IconButton(
            onPressed: null,
            icon: Icon(Icons.favorite_border, color: Colors.white),
          ),
          IconButton(
            onPressed: null,
            icon: Icon(Icons.mail_outline, color: Colors.white),
          ),
        ],
      ),
      body: Consumer<DaftarProvider>(
        builder: (BuildContext context, DaftarProvider value, Widget? child) {
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                tileColor: Color(0xFFF7C9FF),
                title: Text(
                  value.listDaftar[index].nama,
                  style: TextStyle(color: Colors.purple),
                ),
                trailing: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.purple)),
                  onPressed: () {
                    value.hapus(value.listDaftar[index]);
                  },
                  child: const Text('Hapus'),
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
              context, MaterialPageRoute(builder: (context) => const Detail()));
        },
        backgroundColor: Colors.purple,
      ),
    );
  }
}
