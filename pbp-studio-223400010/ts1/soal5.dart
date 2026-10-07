String kartu({
  required String nama,
  required int nilai,
  String? catatan,
  bool tampilkanNilai = true,
}) {
 
  String bagianNilai = tampilkanNilai ? ' (Nilai: $nilai)' : '';

  
  String bagianCatatan = (catatan != null && catatan.isNotEmpty) ? ' - Catatan: $catatan' : '';

  return 'Kartu: $nama$bagianNilai$bagianCatatan';
}

void main() {

  print(kartu(nama: 'Matematika', nilai: 85, catatan: 'Sangat baik'));

  print(kartu(nama: 'Fisika', nilai: 70, catatan: 'Perlu ditingkatkan', tampilkanNilai: false));

  print(kartu(nama: 'Kimia', nilai: 90));

  print(kartu(nama: 'Biologi', nilai: 78, tampilkanNilai: false));
}