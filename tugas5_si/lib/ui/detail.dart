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
  final TextEditingController _controller = TextEditingController();
  String _title = '';
  String _merk = '';
  @override
  void initState() {
    super.initState();
    if (widget.daftar != null) {
      _controller.text = widget.daftar!.nama;
      _title = 'Ubah';
      _merk = _controller.text;
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
            controller: _controller,
          ),
          ElevatedButton(
              onPressed: () {
                DaftarProvider provider = context.read<DaftarProvider>();
                if (widget.daftar != null) {
                  provider.edit(widget.daftar!, _controller.text);
                } else {
                  provider.tambah(Daftar(nama: _controller.text));
                }
                Navigator.pop(context);
              },
              child: Text(_title))
        ],
      ),
    );
  }
}
