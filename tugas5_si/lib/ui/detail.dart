import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas5_si/Widget/appbar.dart';
import 'package:tugas5_si/Widget/text_form_field.dart';
import 'package:tugas5_si/provider/daftar_provider.dart';
import '../models/daftar.dart';

class Detail extends StatefulWidget {
  const Detail({Key? key, this.daftar}) : super(key: key);
  final Daftar? daftar;
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  final TextEditingController _nama = TextEditingController();
  final TextEditingController _harga = TextEditingController();
  final TextEditingController _tahun = TextEditingController();
  String _title = '';
  String _merk = '';
  @override
  void initState() {
    super.initState();
    if (widget.daftar != null) {
      _nama.text = widget.daftar!.nama;
      _harga.text = widget.daftar!.harga;
      _tahun.text = widget.daftar!.tahun;
      _title = 'Ubah';
      _merk = _nama.text;
    } else {
      _title = 'Tambah';
      _merk = 'Tambah Data';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backgroundcolor: Colors.purple,
        title: Text(_merk),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 15, right: 15, top: 15),
        child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(bottom: 10, left: 20, right: 20),
            ),
            CustomTextFormField(
              controller: _nama,
              labelText: 'Merk Handphone',
              hintText: 'ex : Samsung Galaxy A72',
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 10, left: 20, right: 20),
            ),
            CustomTextFormField(
              controller: _harga,
              labelText: 'Harga Handphone',
              hintText: 'ex : 6999000',
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 10, left: 20, right: 20),
            ),
            CustomTextFormField(
              controller: _tahun,
              labelText: 'Tahun',
              hintText: 'ex : 2021',
            ),
            ElevatedButton(
              onPressed: () {
                DaftarProvider provider = context.read<DaftarProvider>();
                if (widget.daftar != null) {
                  provider.edit(
                      widget.daftar!, _nama.text, _harga.text, _tahun.text);
                } else {
                  provider.tambah(Daftar(
                      nama: _nama.text,
                      harga: _harga.text,
                      tahun: _tahun.text));
                }
                Navigator.pop(context);
              },
              child: Text(
                _title,
                style: const TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.purple),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
