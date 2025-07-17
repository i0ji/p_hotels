import 'package:flutter/material.dart';
// import 'package:telegram_web_app/telegram_web_app.dart';

class Hotel {
  final String name;
  final String imagePath;
  final String description;

  Hotel({
    required this.name,
    required this.imagePath,
    required this.description,
  });
}

final List<Hotel> hotels = [
  Hotel(
    name: 'Hotel Sunshine',
    imagePath: 'assets/1.jpg',
    description: 'Уютный отель с видом на море.',
  ),
  Hotel(
    name: 'Mountain Resort',
    imagePath: 'assets/2.jpg',
    description: 'Отдых в горах с отличным сервисом.',
  ),
  Hotel(
    name: 'Mountain Resort',
    imagePath: 'assets/3.jpg',
    description: 'Супер-пупер что-то там',
  ),
];

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // if (TelegramWebApp.instance.isSupported) {
  //   TelegramWebApp.instance.ready();
  //   TelegramWebApp.instance.expand();
  // }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hotels App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HotelsListPage(),
    );
  }
}

class HotelsListPage extends StatelessWidget {
  const HotelsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Отели')),
      body: GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 плитки в ряд
          childAspectRatio: 3 / 4, // пропорции плитки
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: hotels.length,
        itemBuilder: (context, index) {
          final hotel = hotels[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => HotelDetailPage(hotel: hotel),
                ),
              );
            },
            child: Card(
              elevation: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Image.asset(hotel.imagePath, fit: BoxFit.cover),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      hotel.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class HotelDetailPage extends StatelessWidget {
  final Hotel hotel;

  const HotelDetailPage({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(hotel.name)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(hotel.imagePath, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                hotel.description,
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
