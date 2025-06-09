import 'package:flutter/material.dart';

class VillaCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String location;
  final int carCount;
  final int roomCount;
  final String price;
  final VoidCallback? onTap; // Tambahan

  const VillaCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.location,
    required this.carCount,
    required this.roomCount,
    required this.price,
    this.onTap, // Tambahan
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Tambahan
      child: Container(
        height: 250,
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, 4),
            )
          ],
        ),
        child: Stack(
          children: [
            // Gambar
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                imagePath,
                height: 400,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withOpacity(0.1),
                      Colors.black.withOpacity(0.6),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),

            // Informasi villa
            Positioned(
              left: 16,
              right: 16,
              bottom: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    location,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.bed, size: 18, color: Colors.white),
                      const SizedBox(width: 4),
                      Text('$carCount Rooms',
                          style: const TextStyle(color: Colors.white)),
                      const SizedBox(width: 16),
                      const Icon(Icons.bathtub,
                          size: 18, color: Colors.white),
                      const SizedBox(width: 4),
                      Text('$roomCount Baths',
                          style: const TextStyle(color: Colors.white)),
                      const Spacer(),
                      Text(
                        'Rp $price',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      const Text(
                        ' /night',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ],
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
