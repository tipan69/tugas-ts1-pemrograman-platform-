mixin BisaDilacak {
  String buatKunci(String proyek, int nomor) {
    String nomorFormat = nomor.toString().padLeft(3, '0');
    return '$proyek-$nomorFormat';
  }
}

class ItemBacklog with BisaDilacak {
  final int nomor;
  final String judul;

  ItemBacklog({
    required this.nomor,
    required this.judul,
  });

  String get kunci => buatKunci('GYB', nomor);
}

void main() {
  var item = ItemBacklog(nomor: 7, judul: 'Widget sisa poin sprint');

  print('${item.kunci} ${item.judul}');
}