// Katalog harga tetap (minimal tiga barang)
final Map<String, int> katalogHarga = {
  'buku': 15000,
  'pensil': 4000,
  'penggaris': 5000,
};

// Fungsi untuk menangani permintaan seperti backend berdasarkan parameter kueri
Map<String, Object> tanganiPermintaan(Map<String, String> kueri) {
  // 1. Cek apakah parameter 'barang' tidak ada atau kosong
  if (!kueri.containsKey('barang') || kueri['barang']!.trim().isEmpty) {
    return {
      'status': 400,
      'pesan': 'Parameter "barang" wajib diisi dan tidak boleh kosong.',
    };
  }

  String namaBarang = kueri['barang']!.toLowerCase();

  // 2. Tentukan nilai jumlah (jika tidak dikirim, nilainya satu)
  int jumlah = 1;
  if (kueri.containsKey('jumlah')) {
    String strJumlah = kueri['jumlah']!;
    // Cek apakah parameter jumlah ada tetapi bukan angka
    int? parsedJumlah = int.tryParse(strJumlah);
    if (parsedJumlah == null) {
      return {
        'status': 400,
        'pesan': 'Parameter jumlah bukan angka yang valid: "$strJumlah"',
      };
    }
    // 3. Cek apakah jumlah kurang dari satu
    if (parsedJumlah < 1) {
      return {
        'status': 400,
        'pesan': 'Jumlah barang tidak boleh kurang dari satu ($parsedJumlah).',
      };
    }
    jumlah = parsedJumlah;
  }

  // 4. Cek apakah barang tidak ada di katalog
  if (!katalogHarga.containsKey(namaBarang)) {
    return {
      'status': 404,
      'pesan': 'Barang tidak ditemukan di katalog: "$namaBarang"',
    };
  }

  // 5. Jika semua sah, hitung total harga
  int hargaSatuan = katalogHarga[namaBarang]!;
  int totalHarga = hargaSatuan * jumlah;

  return {
    'status': 200,
    'barang': namaBarang,
    'jumlah': jumlah,
    'totalHarga': totalHarga,
  };
}

void main() {
  // Pengujian dengan 6 permintaan berbeda untuk memicu setiap ketentuan
  
  // Kasus 1: Parameter barang tidak ada
  var hasil1 = tanganiPermintaan({'jumlah': '2'});
  print('Uji 1 (Barang tidak ada): $hasil1');

  // Kasus 2: Parameter barang kosong
  var hasil2 = tanganiPermintaan({'barang': '', 'jumlah': '2'});
  print('Uji 2 (Barang kosong): $hasil2');

  // Kasus 3: Parameter jumlah ada tetapi bukan angka
  var hasil3 = tanganiPermintaan({'barang': 'buku', 'jumlah': 'dua'});
  print('Uji 3 (Jumlah bukan angka): $hasil3');

  // Kasus 4: Parameter jumlah kurang dari satu (misal 0 atau negatif)
  var hasil4 = tanganiPermintaan({'barang': 'buku', 'jumlah': '0'});
  print('Uji 4 (Jumlah < 1): $hasil4');

  // Kasus 5: Barang tidak ada di katalog
  var hasil5 = tanganiPermintaan({'barang': 'tas', 'jumlah': '2'});
  print('Uji 5 (Barang tidak di katalog): $hasil5');

  // Kasus 6: Semua sah (jumlah dikirim) & Uji opsional (jumlah tidak dikirim = 1)
  var hasil6 = tanganiPermintaan({'barang': 'buku', 'jumlah': '3'});
  print('Uji 6 (Semua sah dengan jumlah): $hasil6');

  var hasil6b = tanganiPermintaan({'barang': 'pensil'}); // Jumlah otomatis 1
  print('Uji 6b (Semua sah tanpa jumlah): $hasil6b');
}