import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/Screens/MyCart.dart';
import 'package:flutter/material.dart';

class ProductdetailsScreen extends StatefulWidget {
  const ProductdetailsScreen({super.key});

  @override
  State<ProductdetailsScreen> createState() => _ProductdetailsScreenState();
}

class _ProductdetailsScreenState extends State<ProductdetailsScreen> {
  // ignore: unused_field
  int _selectedButton = 2;

  void selectedbutton(int selectedIndex) {
    setState(() {
      _selectedButton = selectedIndex;
    });
  }

  final List<String> _iamges = [
    'Assests/Shirt-1.jpg',
    'Assests/Shirt-2.png',
    'Assests/Shirt-3.jpeg',
    'Assests/Shirt-4.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.arrow_back, color: Color(0xFF7096D1))),
        ),
        body: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                  height: 200.0,
                  enlargeCenterPage: true,
                  onPageChanged: (value, _) {}),
              items: _iamges.map((image) {
                return Builder(
                  builder: (context) {
                    return Image.asset(image, fit: BoxFit.cover);
                  },
                );
              }).toList(),
            ),
            Container(
              color: const Color(0xFF7096D1),
              padding: const EdgeInsets.all(16.0),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Shirts',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text('Price : \$19.99',
                          style: TextStyle(color: Colors.white, fontSize: 18.0))
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Product Description',
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'This is an Amazing Shirt',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  Text(
                    'This is an Amazing Shirt-2',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  Text(
                    'This is an Amazing Shirt-3',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Row(
              children: [
                Expanded(
                    child: SizedBox(
                  height: 60,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF7096D1),
                        shape: const RoundedRectangleBorder()),
                    onPressed: () {
                      selectedbutton(1);
                    },
                    child: const Text(
                      'RESELL',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                )),
                const SizedBox(
                  width: 2,
                ),
                Expanded(
                    child: SizedBox(
                  height: 60,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF7096D1),
                        shape: const RoundedRectangleBorder()),
                    onPressed: () {
                      selectedbutton(2);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MycartScreen()));
                    },
                    child: const Text(
                      'ADD TO CART',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ))
              ],
            )
          ],
        ));
  }
}
