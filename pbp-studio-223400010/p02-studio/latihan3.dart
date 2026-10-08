double rataRata(List<int> nilai) {
  if (nilai.isEmpty) {
    return 0.0;
  }
  
  int total = 0;
  for (int n in nilai) {
    total += n;
  }
  
  return total / nilai.length;
}

void main() {
  List<int> daftar1 = [80, 90, 75];
  print('Rata-rata: ${rataRata(daftar1)}');

  List<int> daftar2 = [];
  print('Rata-rata daftar kosong: ${rataRata(daftar2)}');
}