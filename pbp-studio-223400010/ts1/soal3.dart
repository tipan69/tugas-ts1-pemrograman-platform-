Map<String, dynamic> hitungStatistik(List<int> daftar) {
  if (daftar.isEmpty) {
    return {'maksimum': null, 'minimum': null, 'rataRata': null};
  }

  int maksimum = daftar[0];
  int minimum = daftar[0];
  int total = 0;

  for (int angka in daftar) {
    if (angka > maksimum) {
      maksimum = angka;
    }
    if (angka < minimum) {
      minimum = angka;
    }
    total += angka;
  }

  double rataRata = total / daftar.length;

  return {
    'maksimum': maksimum,
    'minimum': minimum,
    'rataRata': rataRata,
  };
}

void main() {
  List<int> angkaNormal = [75, 90, 60, 85, 95];
  print('Hasil untuk list normal: ${hitungStatistik(angkaNormal)}');

  List<int> angkaKosong = [];
  print('Hasil untuk list kosong: ${hitungStatistik(angkaKosong)}');
}