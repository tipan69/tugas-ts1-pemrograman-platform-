class ItemBacklog {
  final String kunci;
  final String judul;

  ItemBacklog({
    required this.kunci,
    required this.judul,
  });

  int prioritas() {
    return 2;
  }
}

class Story extends ItemBacklog {
  Story({
    required super.kunci,
    required super.judul,
  });
}

class Bug extends ItemBacklog {
  Bug({
    required super.kunci,
    required super.judul,
  });

  @override
  int prioritas() {
    return 1;
  }
}

void main() {
  List<ItemBacklog> items = [
    Story(kunci: 'GYB-003', judul: 'Rekap kehadiran mingguan'),
    Bug(kunci: 'GYB-004', judul: 'Check-in ganda saat sinyal hilang'),
  ];

  for (var item in items) {
    print('${item.kunci} ${item.judul}, prioritas ${item.prioritas()}');
  }
}