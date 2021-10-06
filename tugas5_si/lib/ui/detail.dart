import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
      appBar: AppBar(
        title: Text(_merk),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(labelText: 'Merk Handphone'),
            controller: _nama,
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Harga Handphone'),
            controller: _harga,
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Tahun '),
            controller: _tahun,
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
              child: Text(_title))
        ],
      ),
    );
  }
}
