import 'package:e_commerce/helper/CustomScafold.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyaccountsCREEN extends StatefulWidget {
  const MyaccountsCREEN({super.key});

  @override
  State<MyaccountsCREEN> createState() => _MyaccountsCREENState();
}

class _MyaccountsCREENState extends State<MyaccountsCREEN> {
  @override
  Widget build(BuildContext context) {
    return Customscafold(
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(color: Color(0xFF7096D1)),
            child: const Padding(
              padding: EdgeInsets.only(left: 20, top: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Mahmoud Ahmed',
                      style: TextStyle(fontSize: 22, color: Colors.white)),
                  SizedBox(height: 3),
                  Text('Mahmoud23ahmed45@gmail.com',
                      style: TextStyle(fontSize: 12, color: Colors.white)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              'My Account',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          const ListOfOption(
              icon: Icon(Icons.person_2_outlined, color: Color(0xFF7096D1)),
              title: 'Home'),
          const ListOfOption(
              icon:
                  Icon(Icons.location_city_outlined, color: Color(0xFF7096D1)),
              title: 'Address'),
          const ListOfOption(
              icon: Icon(Icons.payment_outlined, color: Color(0xFF7096D1)),
              title: 'Payment'),
          const ListOfOption(
              icon: Icon(Icons.shopping_bag_outlined, color: Color(0xFF7096D1)),
              title: 'Orders'),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              'Settings',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          const ListOfOption(
              icon: Icon(Icons.language_outlined, color: Color(0xFF7096D1)),
              title: 'Languages'),
        ],
      )),
      showBottomNavBar: true,
      intialIndex: 2,
    );
  }
}

class ListOfOption extends StatelessWidget {
  final Icon icon;
  final String title;

  const ListOfOption({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios_outlined, size: 16),
      onTap: () {},
    );
  }
}
