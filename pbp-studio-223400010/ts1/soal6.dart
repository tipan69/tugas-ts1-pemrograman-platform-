Map<String, double> hitungRataRataKelas(Map<String, List<int>> rekapNilai) {
  Map<String, double> hasilRataRata = {};

  rekapNilai.forEach((nama, daftarNilai) {
    if (daftarNilai.isEmpty) {
      hasilRataRata[nama] = 0.0;
    } else {
      int total = 0;
      for (int nilai in daftarNilai) {
        total += nilai;
      }
      hasilRataRata[nama] = total / daftarNilai.length;
    }
  });

  return hasilRataRata;
}

String cariRataRataTertinggi(Map<String, List<int>> rekapNilai) {
  if (rekapNilai.isEmpty) {
    return 'Tidak ada data mahasiswa';
  }

  Map<String, double> rataRataMap = hitungRataRataKelas(rekapNilai);

  String mahasiswaTertinggi = '';
  double nilaiTertinggi = -1.0;

  rataRataMap.forEach((nama, rataRata) {
    if (rataRata > nilaiTertinggi) {
      nilaiTertinggi = rataRata;
      mahasiswaTertinggi = nama;
    }
  });

  return mahasiswaTertinggi;
}

void main() {
  Map<String, List<int>> dataNilaiKelas = {
    'Budi': [80, 85, 90],
    'Siti': [95, 100, 85],
    'Andi': [],
    'Dewi': [75, 80, 85],
  };

  Map<String, double> hasilRata = hitungRataRataKelas(dataNilaiKelas);
  print('Rata-rata tiap mahasiswa:');
  hasilRata.forEach((nama, rata) {
    print('- $nama: $rata');
  });

  String juaraKelas = cariRataRataTertinggi(dataNilaiKelas);
  print('\nMahasiswa dengan rata-rata tertinggi: $juaraKelas');
}