import '../models/sirkuit_model.dart';

final List<Sirkuit> sirkuitList = [
  Sirkuit(
    nama: 'Monaco',
    lokasi: 'Monte Carlo, Monaco',
    namaSirkuitLengkap: 'Circuit de Monaco',
    tagline: 'THE JEWEL OF THE CROWN',
    gambarUrl: 'https://i1-e.pinimg.com/1200x/8c/6d/d0/8c6dd0240778bf513f33ef658f9fe713.jpg',
    jumlahTikungan: 19,
    panjangLintasan: '3.337 km',
    pemenangTahunLalu: 'Sergio Perez',
    timPemenang: 'Oracle Red Bull Racing',
    fastestLapTime: '1:12.909',
    fastestLapDriverYear: 'Lewis Hamilton (2021)',
    rekomendasiBan: ['SOFT', 'MEDIUM', 'HARD'],
    proTip: 'Qualifying is everything in Monaco. 80% of winners start from Pole Position.',
  ),
  Sirkuit(
    nama: 'Silverstone',
    lokasi: 'Silverstone Circuit, UK',
    namaSirkuitLengkap: 'British Grand Prix',
    tagline: 'THE HOME OF BRITISH MOTORSPORT',
    gambarUrl: 'https://i1-e.pinimg.com/1200x/e6/26/bb/e626bb897814d0a3f4b94baebaa17915.jpg',
    jumlahTikungan: 18,
    panjangLintasan: '5.891 km',
    pemenangTahunLalu: 'Max Verstappen',
    timPemenang: 'Oracle Red Bull Racing',
    fastestLapTime: '1:27.097',
    fastestLapDriverYear: 'Max Verstappen (2020)',
    rekomendasiBan: ['HARD', 'MEDIUM'],
    proTip: 'High-speed corners like Copse and Maggots-Becketts put extreme lateral loads on tyres.',
  ),
  Sirkuit(
    nama: 'Spain',
    lokasi: 'The Circuit de Barcelona-Catalunya',
    namaSirkuitLengkap: 'Belgian Grand Prix',
    tagline: 'THE ROLLERCOASTER IN THE ARDENNES',
    gambarUrl: 'https://i1-e.pinimg.com/736x/be/8f/38/be8f384d311f4292b844087f329fb857.jpg',
    jumlahTikungan: 20,
    panjangLintasan: '7.004 km',
    pemenangTahunLalu: 'Max Verstappen',
    timPemenang: 'Oracle Red Bull Racing',
    fastestLapTime: '1:46.286',
    fastestLapDriverYear: 'Valtteri Bottas (2018)',
    rekomendasiBan: ['MEDIUM', 'HARD'],
    proTip: 'Weather in Spa is notoriously unpredictable. It can rain on one part of the track and be dry on another.',
  ),
];

final List<String> daftarPembalap = [
  'L. Hamilton',
  'M. Verstappen',
  'L. Norris',
  'C. Leclerc',
  'C. Sainz',
  'O. Piastri',
  'G. Russell',
  'S. Perez',
  'F. Alonso',
  'A. Albon',
];

Map<String, String>? hasilPrediksiSimpanan;