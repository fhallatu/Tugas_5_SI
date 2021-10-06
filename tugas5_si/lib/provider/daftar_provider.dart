import 'package:flutter/foundation.dart';
import '../models/daftar.dart';

class DaftarProvider extends ChangeNotifier {
  List<Daftar> _listDaftar = <Daftar>[];

  List<Daftar> get listDaftar => _listDaftar;

  void tambah(Daftar daftar) {
    _listDaftar.add(daftar);
    notifyListeners();
  }

  void edit(Daftar daftar, String nama, String harga, String tahun) {
    daftar.nama = nama;
    daftar.harga = harga;
    daftar.tahun = tahun;
    notifyListeners();
  }

  void hapus(Daftar daftar) {
    _listDaftar.remove(daftar);
    notifyListeners();
  }
}
