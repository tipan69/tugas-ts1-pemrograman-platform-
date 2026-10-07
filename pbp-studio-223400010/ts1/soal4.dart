final Map<String, int> katalogBarang = {
  'Buku': 15000,
  'Pensil': 4000,
  'Penghapus': 3000,
  'Penggaris': 5000,
  'Buku Gambar': 20000,
};

int ambilHargaBarang(String namaBarang) {
  
  return katalogBarang[namaBarang] ?? 0;
}


int hitungTotalPesanan(List<String> daftarPesanan) {
  int totalHarga = 0;

  for (String barang in daftarPesanan) {
   
    totalHarga += ambilHargaBarang(barang);
  }

  return totalHarga;
}

void main() {
  
  print('Harga Buku: ${ambilHargaBarang('Buku')}'); 
  print('Harga Tas: ${ambilHargaBarang('Tas')}');     
  
  List<String> pesananPelanggan = ['Buku', 'Pensil', 'Tas', 'Penggaris', 'Spidol'];
  
  int total = hitungTotalPesanan(pesananPelanggan);
  print('Total Harga Pesanan: $total');
}