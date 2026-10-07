double nilaiAkhir(double nts, double nas) {
  return (nts * 0.4) + (nas * 0.6);
}

String huruf(double nilai) {
  if (nilai >= 80) {
    return 'A';
  } else if (nilai >= 70) {
    return 'B';
  } else if (nilai >= 60) {
    return 'C';
  } else if (nilai >= 50) {
    return 'D';
  } else {
    return 'E';
  }
}

void main() {
  double nts1 = 85.0;
  double nas1 = 90.0;
  double hasil1 = nilaiAkhir(nts1, nas1);
  print('Uji 1 -> NTS: $nts1, NAS: $nas1 | Nilai Akhir: $hasil1 | Huruf: ${huruf(hasil1)}');

  double nts2 = 70.0;
  double nas2 = 80.0;
  double hasil2 = nilaiAkhir(nts2, nas2);
  print('Uji 2 -> NTS: $nts2, NAS: $nas2 | Nilai Akhir: $hasil2 | Huruf: ${huruf(hasil2)}');
  
  double nts3 = 60.0;
  double nas3 = 65.0;
  double hasil3 = nilaiAkhir(nts3, nas3);
  print('Uji 3 -> NTS: $nts3, NAS: $nas3 | Nilai Akhir: $hasil3 | Huruf: ${huruf(hasil3)}');
}