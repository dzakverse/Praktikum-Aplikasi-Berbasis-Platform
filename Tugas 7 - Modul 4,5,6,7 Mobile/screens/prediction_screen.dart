import 'package:flutter/material.dart';
import '../models/sirkuit_model.dart';
import '../data/sirkuit_data.dart';

class PredictionScreen extends StatefulWidget {
  final Sirkuit sirkuit;
  const PredictionScreen({super.key, required this.sirkuit});

  @override
  State<PredictionScreen> createState() => _PredictionScreenState();
}

class _PredictionScreenState extends State<PredictionScreen> {
  String p1 = 'Select Winner';
  String p2 = 'Select Runner Up';
  String p3 = 'Select Podium Finisher';
  String dotd = 'Who drove best?';
  final TextEditingController komentarController = TextEditingController();

  Widget buildPredictiveField({
    required String label,
    required IconData icon,
    required String hintText,
    required Function(String) onValueSaved,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label.toUpperCase(), style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 0.5)),
          const SizedBox(height: 6),
          Autocomplete<String>(
            optionsBuilder: (TextEditingValue textEditingValue) {
              if (textEditingValue.text.isEmpty) return const Iterable<String>.empty();
              return daftarPembalap.where((option) => option.toLowerCase().contains(textEditingValue.text.toLowerCase()));
            },
            onSelected: onValueSaved,
            fieldViewBuilder: (context, textEditingController, focusNode, onFieldSubmitted) {
              textEditingController.addListener(() {
                if (textEditingController.text.isNotEmpty) onValueSaved(textEditingController.text);
              });
              return TextField(
                controller: textEditingController,
                focusNode: focusNode,
                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: const TextStyle(color: Colors.black26),
                  prefixIcon: Icon(icon, color: Colors.black45, size: 20),
                  filled: true,
                  fillColor: const Color(0xffededed),
                  contentPadding: const EdgeInsets.symmetric(vertical: 14),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: Color(0xffb71c1c), width: 1.5)),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xfff8f9fa),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.5,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Color(0xffb71c1c)),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text('F1 Prediction Center', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xffb71c1c))),
          centerTitle: true,
          bottom: const TabBar(
            labelColor: Color(0xffb71c1c),
            unselectedLabelColor: Colors.grey,
            indicatorColor: Color(0xffb71c1c),
            tabs: [
              Tab(icon: Icon(Icons.emoji_events), text: "PRE-RACE PODIUM"),
              Tab(icon: Icon(Icons.bolt), text: "LIVE DOTD VOTE"),
            ],
          ),
        ),
        body: Column(
          children: [
            Stack(
              children: [
                Image.network(widget.sirkuit.gambarUrl, width: double.infinity, height: 120, fit: BoxFit.cover),
                Container(width: double.infinity, height: 120, color: Colors.black.withOpacity(0.55)),
                Positioned.fill(
                  child: Center(
                    child: Text(
                      '${widget.sirkuit.nama.toUpperCase()} GRAND PRIX',
                      style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w900, fontStyle: FontStyle.italic),
                    ),
                  ),
                )
              ],
            ),
            
            Expanded(
              child: TabBarView(
                children: [
                  SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('🔒 PRE-RACE REWARD DRAFT', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 13)),
                          const SizedBox(height: 15),
                          buildPredictiveField(label: 'Winner (P1)', icon: Icons.looks_one, hintText: 'Predict Winner', onValueSaved: (val) => p1 = val),
                          buildPredictiveField(label: 'Second Place (P2)', icon: Icons.looks_two, hintText: 'Predict Runner Up', onValueSaved: (val) => p2 = val),
                          buildPredictiveField(label: 'Third Place (P3)', icon: Icons.looks_3, hintText: 'Predict Third Finisher', onValueSaved: (val) => p3 = val),
                          const Text('FANS TRASH TALK', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.grey)),
                          const SizedBox(height: 6),
                          TextField(
                            controller: komentarController,
                            maxLines: 2,
                            decoration: InputDecoration(
                              hintText: 'Your psywar goes here...',
                              filled: true,
                              fillColor: const Color(0xffededed),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
                            ),
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xffb71c1c), minimumSize: const Size(double.infinity, 45)),
                            onPressed: () {
                              setState(() {
                                hasilPrediksiSimpanan = {
                                  'p1': p1, 'p2': p2, 'p3': p3, 'dotd': dotd,
                                  'komentar': komentarController.text.isEmpty ? 'No comment.' : komentarController.text
                                };
                              });
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text('Podium Saved!'),
                                  content: const Text('Prediksi podium balapan kamu berhasil dikunci.'),
                                  actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('OK'))],
                                ),
                              );
                            },
                            child: const Text('LOCK PODIUM DRAFT', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                          ),
                          
                          if (hasilPrediksiSimpanan != null) ...[
                            const SizedBox(height: 20),
                            const Divider(),
                            const Text('📊 CURRENT PODIUM PREVIEW:', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.amber)),
                            Text('🥇 P1: ${hasilPrediksiSimpanan!['p1']} | 🥈 P2: ${hasilPrediksiSimpanan!['p2']} | 🥉 P3: ${hasilPrediksiSimpanan!['p3']}'),
                            Text('💬 Comment: "${hasilPrediksiSimpanan!['komentar']}"', style: const TextStyle(fontStyle: FontStyle.italic, color: Colors.grey)),
                          ]
                        ],
                      ),
                    ),
                  ),

                  SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: const [
                              Icon(Icons.radar, color: Colors.green, size: 18),
                              SizedBox(width: 6),
                              Text('LIVE RACE VOTING WINDOW OPEN', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green, fontSize: 13)),
                            ],
                          ),
                          const SizedBox(height: 15),
                          buildPredictiveField(label: 'Vote Driver of the Day', icon: Icons.star, hintText: 'Type driver name...', onValueSaved: (val) => dotd = val),
                          const SizedBox(height: 10),
                          Text(
                            'Note: Voting for Driver of the Day closes right after the chequered flag. Choose wisely based on the live racing performance!',
                            style: TextStyle(fontSize: 12, color: Colors.grey[600], height: 1.4),
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.green[700], minimumSize: const Size(double.infinity, 45)),
                            onPressed: () {
                              setState(() {
                                if (hasilPrediksiSimpanan == null) {
                                  hasilPrediksiSimpanan = {'p1': '-', 'p2': '-', 'p3': '-', 'dotd': dotd, 'komentar': '-'};
                                } else {
                                  hasilPrediksiSimpanan!['dotd'] = dotd;
                                }
                              });
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text('Vote Submitted!'),
                                  content: Text('Terima kasih! Suara kamu untuk $dotd telah dihitung.'),
                                  actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('OK'))],
                                ),
                              );
                            },
                            child: const Text('SUBMIT LIVE DOTD VOTE', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                          ),
                          
                          if (hasilPrediksiSimpanan != null && hasilPrediksiSimpanan!['dotd'] != 'Who drove best?') ...[
                            const SizedBox(height: 20),
                            const Divider(),
                            const Text('🌟 VOTED DOTD:', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
                            Text('Driver Name: ${hasilPrediksiSimpanan!['dotd']}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          ]
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}