class Kehadiran {
  final String anggota;
  final int jamMasuk;
  final int menitMasuk;

  // 1. Konstruktor utama dengan parameter bernama yang required
  Kehadiran({
    required this.anggota,
    required this.jamMasuk,
    required this.menitMasuk,
  });

  // 2. Konstruktor bernama dariJson untuk membaca dari Map
 Kehadiran.dariJson(Map<String, dynamic> json)
      : anggota = json['anggota'] as String,
        jamMasuk = json['jam'] as int,
        menitMasuk = json['menit'] as int;

  // 3. Getter bool terlambat (batas toleransi 08.15 -> total 8 * 60 + 15 = 495 menit)
  bool get terlambat {
    int totalMenitMasuk = (jamMasuk * 60) + menitMasuk;
    int batasToleransi = (8 * 60) + 15; // 08.15 dalam menit (495)
    return totalMenitMasuk > batasToleransi;
  }
}

void main() {
  // 5. Membuat objek dengan konstruktor utama dan dari Map
  var rina = Kehadiran(anggota: 'Rina', jamMasuk: 8, menitMasuk: 10);
  
  var jsonBudi = {'anggota': 'Budi', 'jam': 8, 'menit': 40};
  var budi = Kehadiran.dariJson(jsonBudi);

  // Cetak hasil
  print('${rina.anggota} terlambat? ${rina.terlambat}');
  print('${budi.anggota} terlambat? ${budi.terlambat}');
}