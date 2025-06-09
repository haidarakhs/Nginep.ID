import 'package:flutter/material.dart';
import 'package:hotel_booking/screens/category_item.dart';
import 'package:hotel_booking/screens/villa_card.dart';
import 'package:hotel_booking/screens/villa_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            title: Row(
              children: [
                const CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/images/background.jpeg'),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Good Morning 👋',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Haidar Akbar',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ],
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(59, 215, 214, 214),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Image.asset('assets/images/notif_icon.png'),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 20,
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Image.asset(
                    'assets/images/search.png',
                    width: 10,
                    height: 10,
                  ),
                ),
                hintText: 'Search destination',
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide(
                    color: Colors.grey.shade400,
                    width: 1.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide:
                      const BorderSide(color: Colors.deepPurple, width: 2),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  searchText = value;
                });
              },
            ),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: const [
                  CategoryItem(label: 'All', icon: Icons.apps, isSelected: true),
                  CategoryItem(label: 'Rooms', icon: Icons.bed),
                  CategoryItem(label: 'Beach Views', icon: Icons.beach_access),
                  CategoryItem(label: 'Hotel', icon: Icons.apartment),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Villa list
            Expanded(
              child: ListView(
                children: [
                  VillaCard(
                    imagePath: 'assets/images/villa_1.jpeg',
                    title: 'Aurora Luxe Villa',
                    location: 'Oregon, United States',
                    carCount: 4,
                    roomCount: 4,
                    price: '1,200',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const VillaDetailScreen(
                            title: 'Aurora Luxe Villa',
                            imagePath: 'assets/images/villa_1.jpeg',
                            location: 'Oregon, United States',
                            price: '1,200',
                            description:
                                'Aurora Luxe Villa offers a luxurious retreat with stunning views, spacious interiors, and top-tier amenities.',
                          ),
                        ),
                      );
                    },
                  ),
                  VillaCard(
                    imagePath: 'assets/images/villa_2.jpeg',
                    title: 'Seaside Paradise',
                    location: 'California, United States',
                    carCount: 3,
                    roomCount: 5,
                    price: '980',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const VillaDetailScreen(
                            title: 'Seaside Paradise',
                            imagePath: 'assets/images/villa_2.jpeg',
                            location: 'California, United States',
                            price: '980',
                            description:
                                'Enjoy your dream vacation with oceanfront views and modern comforts in this seaside haven.',
                          ),
                        ),
                      );
                    },
                  ),
                  VillaCard(
                    imagePath: 'assets/images/villa_3.jpeg',
                    title: 'Mountain Escape',
                    location: 'Colorado, United States',
                    carCount: 2,
                    roomCount: 3,
                    price: '750',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const VillaDetailScreen(
                            title: 'Mountain Escape',
                            imagePath: 'assets/images/villa_3.jpeg',
                            location: 'Colorado, United States',
                            price: '750',
                            description:
                                'Experience nature at its finest in our cozy mountain villa with breathtaking views and fresh air.',
                          ),
                        ),
                      );
                    },
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
