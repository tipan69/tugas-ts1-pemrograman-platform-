const katalog = <String, int>{
  'kopi': 8000,
  'teh': 5000,
  'jus': 12000,
  'roti': 7000,
};

String struk({
  required String pembeli,
  required List<String> pesanan,
  int diskonPersen = 0,
  int batasDiskon = 20000,
}) {
  int total = 0;
  List<String> barangTidakDikenal = [];

  for (String item in pesanan) {
    if (katalog.containsKey(item)) {
      total += katalog[item]!;
    } else {
      barangTidakDikenal.add(item);
    }
  }

  int potongan = 0;
  int diskonAktif = 0;
  if (total >= batasDiskon) {
    diskonAktif = diskonPersen;
    potongan = (total * diskonAktif) ~/ 100;
  }

  int dibayar = total - potongan;

  String hasilStruk = 'Struk untuk $pembeli\n'
      'Jumlah barang : ${pesanan.length}\n'
      'Total : $total\n'
      'Diskon : $diskonAktif persen, potongan $potongan\n'
      'Dibayar : $dibayar';

  if (barangTidakDikenal.isNotEmpty) {
    hasilStruk += '\nTidak ada di katalog: ${barangTidakDikenal.join(', ')}';
  }

  return hasilStruk;
}

void main() {
  print('--- Uji 1 ---');
  print(struk(
    pembeli: 'Andi',
    pesanan: ['teh', 'roti'],
    diskonPersen: 10,
    batasDiskon: 20000,
  ));

  print('\n--- Uji 2 ---');
  print(struk(
    pembeli: 'Budi',
    pesanan: ['kopi', 'jus', 'roti'],
    diskonPersen: 15,
    batasDiskon: 20000,
  ));

  print('\n--- Uji 3 ---');
  print(struk(
    pembeli: 'Cindy',
    pesanan: ['teh', 'roti', 'sate'],
    diskonPersen: 10,
    batasDiskon: 20000,
  ));
}