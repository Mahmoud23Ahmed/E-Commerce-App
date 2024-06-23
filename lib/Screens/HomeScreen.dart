import 'package:e_commerce/Screens/ProductDetails.dart';
import 'package:e_commerce/helper/CustomScafold.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CardItem> cardItems = [];
  String searchText = '';

  @override
  void initState() {
    super.initState();
    cardItems = [
      CardItem(title: 'Shirt-1', pricing: '\$10', image: 'Assests/Shirt-1.jpg'),
      CardItem(title: 'Shirt-2', pricing: '\$20', image: 'Assests/Shirt-2.png'),
      CardItem(
          title: 'Shirt-3', pricing: '\$30', image: 'Assests/Shirt-3.jpeg'),
      CardItem(title: 'Shirt-4', pricing: '\$40', image: 'Assests/Shirt-4.jpg'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus.focusedChild?.unfocus();
        }
      },
      child: Customscafold(
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
                    Expanded(
                        child: TextField(
                      decoration: const InputDecoration(
                        hintText: 'Search resturants , cusinis & dishes',
                        hintStyle:
                            TextStyle(fontSize: 12.0, color: Colors.grey),
                        border: InputBorder.none,
                        icon: Icon(Icons.search),
                      ),
                      onChanged: (value) {
                        setState(() {
                          searchText = value;
                        });
                      },
                    )),
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.filter_list)),
                  ],
                ),
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: cardItems
                    .where((cardItem) => cardItem.title
                        .toLowerCase()
                        .contains(searchText.toLowerCase()))
                    .map((cardItem) {
                  return buildCard(cardItem);
                }).toList(),
              ),
            ),
          ],
        )),
        showBottomNavBar: true,
        intialIndex: 0,
      ),
    );
  }

  Widget buildCard(CardItem cardItem) {
    return GestureDetector(
      onTap: () async {
        await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const ProductdetailsScreen()));
      },
      child: Card(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 8,
              child: PageView.builder(itemBuilder: (context, index) {
                return Image.asset(
                  cardItem.image,
                  fit: BoxFit.cover,
                );
              }),
            ),
            ListTile(
              title: Text(
                cardItem.title,
                style: const TextStyle(color: Color(0xFF7096D1)),
              ),
              subtitle: Text(cardItem.pricing),
              trailing: Container(
                decoration: BoxDecoration(
                    color: const Color(0xFF7096D1),
                    borderRadius: BorderRadius.circular(8.0)),
                child: const Text(
                  'Premium',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CardItem {
  final String title;
  final String pricing;
  final String image;
  CardItem({required this.title, required this.pricing, required this.image});
}
