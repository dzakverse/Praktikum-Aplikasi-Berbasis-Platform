class Sirkuit {
  final String nama;
  final String lokasi;
  final String namaSirkuitLengkap;
  final String gambarUrl;
  final String tagline;
  final int jumlahTikungan;
  final String panjangLintasan;
  final String pemenangTahunLalu;
  final String timPemenang;
  final String fastestLapTime;
  final String fastestLapDriverYear;
  final List<String> rekomendasiBan;
  final String proTip;

  Sirkuit({
    required this.nama,
    required this.lokasi,
    required this.namaSirkuitLengkap,
    required this.gambarUrl,
    required this.tagline,
    required this.jumlahTikungan,
    required this.panjangLintasan,
    required this.pemenangTahunLalu,
    required this.timPemenang,
    required this.fastestLapTime,
    required this.fastestLapDriverYear,
    required this.rekomendasiBan,
    required this.proTip,
  });
}