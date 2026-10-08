Future<List<String>> ambilBacklog() async {
  // Meniru proses delay/request ke server selama 2 detik
  await Future.delayed(const Duration(seconds: 2));
  return ['GYB-001 Halaman masuk', 'GYB-002 Tombol check-in'];
}

void main() async {
  print('Mengambil backlog dari server...');

  // 1. Panggil ambilBacklog() tanpa await
  var hasilTanpaAwait = ambilBacklog();
  print('Tanpa await: $hasilTanpaAwait');

  // 2. Panggil lagi dengan await
  var hasilDenganAwait = await ambilBacklog();
  print('Dengan await: $hasilDenganAwait');
}