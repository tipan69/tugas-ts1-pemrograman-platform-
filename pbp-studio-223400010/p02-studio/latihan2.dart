int totalStandar(int harga, int jumlah) {
  return harga * jumlah;
}
int total(int harga, int jumlah) => harga * jumlah;

void main() {
  int hasil = total(8000, 3);
  print('Total belanja: $hasil');
}
