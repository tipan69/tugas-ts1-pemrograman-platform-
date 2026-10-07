Map<String, int> bagiTagihan(int total, List<String> peserta, Map<String, int> diskonPersen) {
  Map<String, int> hasilBayar = {};

  if (peserta.isEmpty) {
    return hasilBayar;
  }

  Map<String, int> bobotPeserta = {};
  int totalBobot = 0;

  for (String orang in peserta) {
    int diskon = diskonPersen[orang] ?? 0;
    int bobot = 100 - diskon;
    if (bobot < 0) bobot = 0;
    
    bobotPeserta[orang] = bobot;
    totalBobot += bobot;
  }

  
  if (totalBobot == 0) {
    int bagianRata = total ~/ peserta.length;
    int sisaRata = total % peserta.length;
    for (int i = 0; i < peserta.length; i++) {
      int tambahan = (i < sisaRata) ? 1 : 0;
      hasilBayar[peserta[i]] = bagianRata + tambahan;
    }
    return hasilBayar;
  }

  int terkumpul = 0;
  for (String orang in peserta) {
    int bobot = bobotPeserta[orang]!;
    int porsi = (total * bobot) ~/ totalBobot;
    hasilBayar[orang] = porsi;
    terkumpul += porsi;
  }

  int sisa = total - terkumpul;
  if (sisa > 0) {
    
    String pesertaPertama = peserta[0];
    hasilBayar[pesertaPertama] = (hasilBayar[pesertaPertama] ?? 0) + sisa;
  }

  return hasilBayar;
}

void main() {
  int totalTagihan = 100000;
  List<String> daftarPeserta = ['Andi', 'Budi', 'Cintia'];
  Map<String, int> diskon = {
    'Andi': 10, 
    'Budi': 20,  
  };

  print('--- PENGUJIAN BAGI TAGIHAN ---');
  print('Total Tagihan Awal: Rp$totalTagihan');

  Map<String, int> rincian = bagiTagihan(totalTagihan, daftarPeserta, diskon);

  int jumlahSeluruhBayaran = 0;
  rincian.forEach((nama, bayar) {
    print('- $nama membayar: Rp$bayar');
    jumlahSeluruhBayaran += bayar;
  });

  print('----------------------------------------');
  print('Jumlah Seluruh Bayaran : Rp$jumlahSeluruhBayaran');
  print('Perbandingan dengan Total: ${jumlahSeluruhBayaran == totalTagihan ? "VALID (Persis sama dengan total)" : "TIDAK VALID"}');

  print('\n--- PENGUJIAN PESERTA KOSONG ---');
  Map<String, int> rincianKosong = bagiTagihan(50000, [], {});
  print('Hasil untuk peserta kosong: $rincianKosong');
}