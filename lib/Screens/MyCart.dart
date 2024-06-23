import 'package:e_commerce/helper/CustomScafold.dart';
import 'package:flutter/material.dart';

class MycartScreen extends StatefulWidget {
  const MycartScreen({super.key});

  @override
  State<MycartScreen> createState() => _MycartScreenState();
}

class _MycartScreenState extends State<MycartScreen> {
  List<String> productName = ['Shirt-1', 'Shirt-2', 'Shirt-3', 'Shirt-4'];
  List<int> quantities = [1, 1, 1, 1];
  List<double> price = [2.0, 5.99, 18.50, 3.0];
  List<String> images = [
    'Assests/Shirt-1.jpg',
    'Assests/Shirt-2.png',
    'Assests/Shirt-3.jpeg',
    'Assests/Shirt-4.jpg'
  ];

  void increamentQuantity(int index) {
    setState(() {
      quantities[index]++;
    });
  }

  void decreamentQuantity(int index) {
    setState(() {
      quantities[index]--;
    });
  }

  double getCartTotal() {
    double total = 0;
    for (int i = 0; i < productName.length; i++) {
      total += quantities[i] * price[i];
    }
    return total;
  }

  void showCheckoutDialogue() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: const Color(0xFF7096D1),
            title:
                const Text('Checkout', style: TextStyle(color: Colors.white)),
            content: const Text('Harry! You have Purchased the Product',
                style: TextStyle(color: Colors.white)),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('ok')),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Customscafold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'CART',
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF7096D1)),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: productName.length,
                itemBuilder: ((context, index) {
                  return Dismissible(
                    key: Key(productName[index]),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      setState(() {
                        productName.removeAt(index);
                      });
                    },
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(right: 16),
                      child: const Icon(Icons.cancel, color: Colors.white),
                    ),
                    child: Container(
                      margin: const EdgeInsets.all(10.0),
                      padding: const EdgeInsets.only(right: 16.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        children: [
                          Image.asset(
                            images[index],
                            height: 50,
                            width: 50,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Column(
                            children: [
                              Text(productName[index],
                                  style: const TextStyle(
                                      fontSize: 18.0,
                                      color: Color(0xFF7096D1))),
                              Text('\$${price[index]}',
                                  style: const TextStyle(
                                      fontSize: 16.0,
                                      color: Color(0xFF7096D1))),
                            ],
                          ),
                          const Spacer(),
                          Row(children: [
                            IconButton(
                                onPressed: () {
                                  decreamentQuantity(index);
                                },
                                icon: const Icon(
                                  Icons.remove,
                                  color: Color(0xFF7096D1),
                                )),
                            Text(quantities[index].toString(),
                                style: const TextStyle(
                                    fontSize: 18, color: Color(0xFF7096D1))),
                            IconButton(
                              onPressed: () {
                                increamentQuantity(index);
                              },
                              icon: const Icon(
                                Icons.add,
                                color: Color(0xFF7096D1),
                              ),
                            )
                          ])
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
            const Divider(),
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    const Text('Cart Total:', style: TextStyle(fontSize: 18)),
                    const SizedBox(width: 50),
                    Text('\$${getCartTotal().toStringAsFixed(2)}',
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                  ],
                )),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: const RoundedRectangleBorder(),
                            backgroundColor: const Color(0xFF7096D1)),
                        onPressed: () {
                          showCheckoutDialogue();
                        },
                        child: const Text(
                          'Proceed To Checkout',
                          style: TextStyle(color: Colors.white),
                        )),
                  )
                ],
              ),
            )
          ],
        ),
      )),
      showBottomNavBar: true,
      intialIndex: 3,
    );
  }
}
