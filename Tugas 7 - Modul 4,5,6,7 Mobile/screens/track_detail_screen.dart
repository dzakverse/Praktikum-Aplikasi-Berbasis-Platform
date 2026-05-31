import 'package:flutter/material.dart';
import '../models/sirkuit_model.dart';

class TrackDetailScreen extends StatelessWidget {
  final Sirkuit sirkuit;
  const TrackDetailScreen({super.key, required this.sirkuit});

  Widget buildSpecCard({
    required IconData icon,
    required String label,
    required String value,
    String? subtitle,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 6, offset: const Offset(0, 2))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon, color: const Color(0xffb71c1c), size: 20),
              Text(label.toUpperCase(), style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 0.5)),
            ],
          ),
          const SizedBox(height: 8),
          Text(value, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xff1a1a1a))),
          if (subtitle != null) ...[
            const SizedBox(height: 2),
            Text(subtitle, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
          ],
          const SizedBox(height: 8),
          Container(
            height: 3,
            width: 80,
            decoration: BoxDecoration(
              color: const Color(0xffb71c1c),
              borderRadius: BorderRadius.circular(2),
            ),
          )
        ],
      ),
    );
  }

  Widget buildTyreBadge(String tyreType) {
    Color badgeColor = Colors.grey;
    if (tyreType == 'SOFT') badgeColor = Colors.red[700]!;
    if (tyreType == 'MEDIUM') badgeColor = Colors.amber[600]!;

    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
      decoration: BoxDecoration(
        color: badgeColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        tyreType,
        style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 0.5),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8f9fa),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xffb71c1c)),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          '${sirkuit.nama.toUpperCase()} GRAND PRIX',
          style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xffb71c1c), fontSize: 16),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle_outlined, color: Color(0xffb71c1c), size: 28),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.network(sirkuit.gambarUrl, width: double.infinity, height: 230, fit: BoxFit.cover),
                Container(
                  width: double.infinity,
                  height: 230,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.black.withOpacity(0.1), Colors.black.withOpacity(0.85)],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 24,
                  left: 20,
                  right: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.fiber_manual_record, color: Colors.red, size: 10),
                          SizedBox(width: 6),
                          Text('LIVE UPDATES AVAILABLE', style: TextStyle(color: Colors.white70, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 0.5)),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(
                        sirkuit.tagline, 
                        style: const TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w900, fontStyle: FontStyle.italic, height: 1.1),
                      ),
                    ],
                  ),
                )
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.location_on, color: Color(0xffb71c1c), size: 16),
                      const SizedBox(width: 4),
                      Text(sirkuit.lokasi.toUpperCase(), style: const TextStyle(color: Color(0xffb71c1c), fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 0.5)),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(sirkuit.namaSirkuitLengkap, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xff1a1a1a))),
                  const SizedBox(height: 12),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffb71c1c),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    ),
                    onPressed: () {},
                    child: const Text('RACE SCHEDULE', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12, letterSpacing: 0.5)),
                  ),

                  const SizedBox(height: 24),
                  
                  Row(
                    children: [
                      Container(width: 4, height: 18, color: const Color(0xffb71c1c)),
                      const SizedBox(width: 8),
                      const Text('Technical Specifications', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xff1a1a1a))),
                    ],
                  ),
                  const SizedBox(height: 16),

                  buildSpecCard(icon: Icons.turn_slight_left, label: 'Corners', value: '${sirkuit.jumlahTikungan}'),
                  buildSpecCard(icon: Icons.straighten, label: 'Lap Length', value: sirkuit.panjangLintasan),
                  buildSpecCard(icon: Icons.emoji_events_outlined, label: '2023 Winner', value: sirkuit.pemenangTahunLalu, subtitle: sirkuit.timPemenang),
                  buildSpecCard(icon: Icons.timer_outlined, label: 'Fastest Lap', value: sirkuit.fastestLapTime, subtitle: sirkuit.fastestLapDriverYear),

                  const SizedBox(height: 16),

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: const Color(0xffe9ecef),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        const Icon(Icons.map_outlined, color: Color(0xffb71c1c), size: 40),
                        const SizedBox(height: 12),
                        const Text('Interactive Track Map', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xff1a1a1a))),
                        const SizedBox(height: 6),
                        Text(
                          'Explore every turn, braking point, and DRS zone of the world\'s most demanding circuit.',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 13, color: Colors.grey[700], height: 1.4),
                        ),
                        const SizedBox(height: 16),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Color(0xffb71c1c), width: 1.5),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                          ),
                          onPressed: () {},
                          child: const Text('OPEN INTERACTIVE VIEW', style: TextStyle(color: Color(0xffb71c1c), fontWeight: FontWeight.bold, fontSize: 12)),
                        )
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xfff1f3f5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.tire_repair, color: Color(0xffb71c1c), size: 20),
                            SizedBox(width: 8),
                            Text('Recommended Strategy', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xff1a1a1a))),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: sirkuit.rekomendasiBan.map((tyre) => buildTyreBadge(tyre)).toList(),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'High track evolution throughout the weekend makes tire management critical. Low degradation but extreme cooling requirements for brakes and engine.',
                          style: TextStyle(fontSize: 13, color: Colors.grey[700], height: 1.4),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xffffe3e3),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.info_outline, color: Color(0xffb71c1c), size: 22),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('PRO TIP', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xffb71c1c), letterSpacing: 0.5)),
                              const SizedBox(height: 4),
                              Text(
                                sirkuit.proTip,
                                style: const TextStyle(fontSize: 13, color: Color(0xff5c0000), height: 1.4, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}