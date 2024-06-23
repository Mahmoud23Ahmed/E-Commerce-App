import 'package:e_commerce/helper/CustomScafold.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class FoodsScreen extends StatefulWidget {
  const FoodsScreen({super.key});

  @override
  State<FoodsScreen> createState() => _FoodsScreenState();
}

class _FoodsScreenState extends State<FoodsScreen> {
  List<String> imageUrl = [];
  List<String> titles = ['BreakFast', 'Burger', 'Crispy', 'FastFood', 'Pizza'];
  List<String> subTitle = [
    'Vitaminss',
    'Small',
    'Large',
    'Chinese Dishes',
    '14 inch'
  ];
  List<String> pricing = ['\$10', '\$20', '\$30', '\$40', '\$50'];

  @override
  void initState() {
    super.initState();
    fetchImage();
  }

  Future<void> fetchImage() async {
    FirebaseStorage storage = FirebaseStorage.instance;
    for (int i = 0; i <= 5; i++) {
      try {
        Reference ref = storage.ref().child('f$i.jpeg');
        String downloadIUrl = await ref.getDownloadURL();
        setState(() {
          imageUrl.add(downloadIUrl);
        });
      } catch (e) {
        print("Error fetching image: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Customscafold(
      body: SafeArea(
          child: Column(
        children: [
          Container(
            height: 80,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(color: Color(0xFF7096D1)),
            child: Container(
              color: Colors.white,
              margin: const EdgeInsets.all(16.0),
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  const Expanded(
                      child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search resturants, cuisines & dishes',
                      hintStyle: TextStyle(fontSize: 12.0, color: Colors.grey),
                      border: InputBorder.none,
                      icon: Icon(Icons.search),
                    ),
                  )),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.filter_list)),
                ],
              ),
            ),
          ),
          Expanded(
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1),
                  itemCount: imageUrl.length,
                  itemBuilder: ((context, index) {
                    return Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(imageUrl[index]),
                              fit: BoxFit.cover)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Text(
                                    titles[index],
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Text(
                                    subTitle[index],
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Text(
                                  pricing[index],
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  })))
        ],
      )),
      showBottomNavBar: true,
      intialIndex: 1,
    );
  }
}

class FoodItem {
  final String image;
  final String title;
  final String subtitle;
  final double rating;
  final double price;

  FoodItem(
      {required this.image,
      required this.title,
      required this.subtitle,
      required this.rating,
      required this.price});
}
