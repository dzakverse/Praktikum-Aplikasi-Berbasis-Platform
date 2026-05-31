import 'package:flutter/material.dart';
import '../data/sirkuit_data.dart';
import 'select_track_screen.dart';
import 'track_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color(0xfff8f9fa),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Color(0xffb71c1c)),
          onPressed: () {
            scaffoldKey.currentState?.openDrawer();
          },
        ),
        title: const Text(
          'F1 ZONE',
          style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xffb71c1c), letterSpacing: 1),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle_outlined, color: Color(0xffb71c1c), size: 28),
            onPressed: () {},
          ),
        ],
      ),
      
      drawer: Drawer(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(color: Color(0xffb71c1c)),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.directions_car, color: Colors.white, size: 40),
                      SizedBox(height: 10),
                      Text('F1 ZONE MENU', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 1)),
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home, color: Color(0xffb71c1c)),
                title: const Text('Home', style: TextStyle(fontWeight: FontWeight.bold)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.analytics, color: Color(0xffb71c1c)),
                title: const Text('Race Prediction & Vote', style: TextStyle(fontWeight: FontWeight.bold)),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SelectTrackScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15),
          SizedBox(
            height: 220,
            child: PageView.builder(
              itemCount: sirkuitList.length,
              itemBuilder: (context, index) {
                final sirkuit = sirkuitList[index];
                return Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(image: NetworkImage(sirkuit.gambarUrl), fit: BoxFit.cover),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.black.withOpacity(0.2), Colors.black.withOpacity(0.8)],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 16,
                      left: 32,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(color: const Color(0xffb71c1c), borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          children: const [
                            Icon(Icons.fiber_manual_record, color: Colors.white, size: 12),
                            SizedBox(width: 6),
                            Text('LIVE THIS WEEKEND', style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      left: 32,
                      right: 32,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${sirkuit.nama} Grand Prix', style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Icon(Icons.location_on_outlined, color: Colors.white70, size: 16),
                              const SizedBox(width: 4),
                              Text(sirkuit.lokasi, style: const TextStyle(color: Colors.white70, fontSize: 14)),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SelectTrackScreen()));
              },
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xffb71c1c),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [BoxShadow(color: Colors.red.withOpacity(0.2), blurRadius: 8, offset: const Offset(0, 4))],
                ),
                child: Row(
                  children: [
                    const Icon(Icons.rate_review_outlined, color: Colors.white, size: 28),
                    const SizedBox(width: 16),
                    const Expanded(
                      child: Text(
                        'Fill Prediction & Vote\nDriver of the Day',
                        style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold, height: 1.3),
                      ),
                    ),
                    const Icon(Icons.arrow_forward, color: Colors.white, size: 24),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text('Upcoming Circuits', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xff1a1a1a))),
          ),
          const SizedBox(height: 10),

          Expanded(
            child: ListView.builder(
              itemCount: sirkuitList.length,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (context, index) {
                final sirkuit = sirkuitList[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 6, offset: const Offset(0, 2))],
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(sirkuit.gambarUrl, width: 56, height: 56, fit: BoxFit.cover),
                    ),
                    title: Text(sirkuit.nama, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xff1a1a1a))),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(sirkuit.namaSirkuitLengkap, style: const TextStyle(color: Colors.grey, fontSize: 13)),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios, color: Color(0xffb71c1c), size: 16),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => TrackDetailScreen(sirkuit: sirkuit)));
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}