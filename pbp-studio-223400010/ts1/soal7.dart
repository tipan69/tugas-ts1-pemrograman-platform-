String? periksaNim(String nim, {int tahunSekarang = 2026}) {
  if (nim.length != 7) {
    return 'Panjang NIM harus tepat 7 karakter.';
  }

  if (int.tryParse(nim) == null) {
    return 'NIM mengandung huruf atau karakter non-angka.';
  }

  String subTahun = nim.substring(0, 4);
  int tahunMasuk = int.parse(subTahun);

  if (tahunMasuk < 2015 || tahunMasuk > tahunSekarang) {
    return 'Tahun masuk pada NIM tidak masuk akal (harus antara 2015 sampai $tahunSekarang).';
  }

  return null;
}

void main() {
  String? hasil1 = periksaNim('2022123');
  print('Uji 1 ("2022123"): ${hasil1 ?? 'NIM Sah '}');

  String? hasil2 = periksaNim('220810');
  print('Uji 2 ("220810"): $hasil2');

  String? hasil3 = periksaNim('220810a');
  print('Uji 3 ("220810A"): $hasil3');

  String? hasil4 = periksaNim('2010123');
  print('Uji 4 ("2010123"): $hasil4');
}