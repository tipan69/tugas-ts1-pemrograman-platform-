// Fungsi untuk menyusun tampilan berdasarkan keadaan keranjang
List<String> tampilanKeranjang({
  required List<String> barang,
  required Map<String, int> harga,
  bool sedangMemuat = false,
  String? galat,
}) {
  // 1. Kalau sedangMemuat benar, kembalikan satu baris status memuat (prioritas utama)
  if (sedangMemuat) {
    return ['Sedang memuat data keranjang...'];
  }

  // 2. Kalau galat terisi, kembalikan pesan galat ditambah ajakan mencoba lagi
  if (galat != null && galat.isNotEmpty) {
    return [
      'Terjadi kesalahan: $galat',
      'Silakan coba beberapa saat lagi.',
    ];
  }

  // 3. Kalau daftar barang kosong, kembalikan dua baris yang menyatakan keranjang kosong
  if (barang.isEmpty) {
    return [
      'Keranjang belanja Anda saat ini kosong.',
      'Yuk, mulai tambahkan barang ke keranjang!',
    ];
  }

  // 4. Selain itu (data ada): satu baris per barang berisi nama & harga, lalu satu baris terakhir total
  List<String> barisTampilan = [];
  int totalHarga = 0;

  for (String item in barang) {
    // Barang yang tidak ada di katalog harga dihitung nol (memakai operator ??)
    int hargaBarang = harga[item] ?? 0;
    totalHarga += hargaBarang;
    barisTampilan.add('$item - Rp$hargaBarang');
  }

  // Baris terakhir berisi total keseluruhan
  barisTampilan.add('Total Harga: Rp$totalHarga');

  return barisTampilan;
}

void main() {
  // Katalog contoh
  Map<String, int> katalog = {
    'Buku': 15000,
    'Pensil': 4000,
  };

  print('--- PENGUJIAN 1: Sedang Memuat ---');
  var hasil1 = tampilanKeranjang(
    barang: ['Buku'],
    harga: katalog,
    sedangMemuat: true,
  );
  for (var baris in hasil1) {
    print(baris);
  }

  print('\n--- PENGUJIAN 2: Data Gagal Datang (Galat) ---');
  var hasil2 = tampilanKeranjang(
    barang: ['Buku'],
    harga: katalog,
    galat: 'Koneksi internet terputus',
  );
  for (var baris in hasil2) {
    print(baris);
  }

  print('\n--- PENGUJIAN 3: Data Barang Kosong ---');
  var hasil3 = tampilanKeranjang(
    barang: [],
    harga: katalog,
  );
  for (var baris in hasil3) {
    print(baris);
  }

  print('\n--- PENGUJIAN 4: Data Ada ---');
  var hasil4 = tampilanKeranjang(
    barang: ['Buku', 'Pensil', 'Tas (Tidak ada di katalog)'],
    harga: katalog,
  );
  for (var baris in hasil4) {
    print(baris);
  }
}