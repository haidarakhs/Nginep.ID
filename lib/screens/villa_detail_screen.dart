import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class VillaDetailScreen extends StatelessWidget {
  final String title;
  final String imagePath;
  final String location;
  final String price;
  final String description;
  final Color iconColor;

  const VillaDetailScreen({
    super.key,
    required this.title,
    required this.imagePath,
    required this.location,
    required this.price,
    required this.description,
    this.iconColor = Colors.black, 
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               
                Stack(
                  children: [
                    Image.asset(imagePath, width: double.infinity, height: 300, fit: BoxFit.cover),
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _circleButton(Icons.arrow_back, () {
                              Navigator.pop(context);
                            }),
                            _circleButton(Icons.more_vert, () {}),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                // Detail Konten
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title dan Harga
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              title,
                              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            '\$$price',
                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(location, style: const TextStyle(color: Colors.grey)),

                      const SizedBox(height: 12),

                      // Rating, Jarak
                      Row(
                        children: [
                          RatingBarIndicator(
                            rating: 4.5,
                            itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.amber),
                            itemCount: 5,
                            itemSize: 18.0,
                            direction: Axis.horizontal,
                          ),
                          const SizedBox(width: 8),
                          const Text("4.5 Rating (23 Reviews)", style: TextStyle(fontSize: 14)),
                          const Spacer(),
                          const Icon(Icons.location_on_outlined, size: 18),
                          const SizedBox(width: 4),
                          const Text("1 km"),
                        ],
                      ),

                      const SizedBox(height: 12),

                      // Fasilitas
                      Wrap(
                        spacing: 8,
                        children: const [
                          _FacilityIcon(icon: Icons.meeting_room, label: '4 Rooms', iconColor: Colors.black),
                          _FacilityIcon(icon: Icons.bed, label: '4 Beds',iconColor: Colors.black),
                          _FacilityIcon(icon: Icons.pool, label: 'Pool',iconColor: Colors.black),
                          _FacilityIcon(icon: Icons.wifi, label: 'Wi-Fi',iconColor: Colors.black),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // Description
                      const Text('Description', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      Text(
                        description,
                        style: const TextStyle(fontSize: 16, height: 1.5),
                      ),

                      const SizedBox(height: 20),

                      // Host dan Chat
                      Row(
                        children: [
                          const CircleAvatar(
                            radius: 22,
                            backgroundImage: AssetImage('assets/images/myfoto.jpg'), 
                          ),
                          const SizedBox(width: 12),
                          const Expanded(child: Text("Josep Collins", style: TextStyle(fontWeight: FontWeight.bold))),
                          ElevatedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.chat, size: 18),
                            label: const Text("Chat"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey[200],
                              foregroundColor: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Tombol Book Now di bawah
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {},
                child: const Text("Book Now", style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _circleButton(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        child: Icon(icon, color: Colors.black),
      ),
    );
  }
}

class _FacilityIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color? iconColor;

  const _FacilityIcon({required this.icon, required this.label, this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: Icon(icon, size: 18, color: iconColor ?? Colors.black),
      label: Text(label),
      backgroundColor: Colors.grey[200],
    );
  }
}
