import 'package:e_commerce/Screens/Foods.dart';
import 'package:e_commerce/Screens/HomeScreen.dart';
import 'package:e_commerce/Screens/MyAccount.dart';
import 'package:e_commerce/Screens/MyCart.dart';
import 'package:flutter/material.dart';

class Bottomnavbar extends StatefulWidget {
  final int intiaIndex;
  const Bottomnavbar({super.key, required this.intiaIndex});

  @override
  State<Bottomnavbar> createState() => _BottomnavbarState();
}

class _BottomnavbarState extends State<Bottomnavbar> {
  var _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.intiaIndex;
  }

  void onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        NavigateToRout(context, '/home', const HomeScreen());
        break;
      case 1:
        NavigateToRout(context, '/foods', const FoodsScreen());
        break;
      case 2:
        NavigateToRout(context, '/MyAccounr', const MyaccountsCREEN());
        break;
      case 3:
        NavigateToRout(context, '/MyCard', const MycartScreen());
        break;
    }
  }

  void NavigateToRout(context, String RoutName, Widget Screen) {
    final String? currentRoutName = ModalRoute.of(context)?.settings.name;
    bool RoutExist = currentRoutName == RoutName;
    if (RoutExist) {
      Navigator.popUntil(context, ModalRoute.withName(RoutName));
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => Screen,
              settings: RouteSettings(name: RoutName)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      type: BottomNavigationBarType.fixed,
      onTap: onItemTap,
      backgroundColor: Colors.white,
      selectedItemColor: Colors.black,
      unselectedItemColor: const Color(0xFF7096D1),
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              color:
                  _selectedIndex == 0 ? Colors.black : const Color(0xFF7096D1),
            ),
            label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.food_bank_outlined,
              color:
                  _selectedIndex == 1 ? Colors.black : const Color(0xFF7096D1),
            ),
            label: 'Foods'),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.person_2_outlined,
              color:
                  _selectedIndex == 2 ? Colors.black : const Color(0xFF7096D1),
            ),
            label: 'My Account'),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart_outlined,
              color:
                  _selectedIndex == 3 ? Colors.black : const Color(0xFF7096D1),
            ),
            label: 'My Card')
      ],
    );
  }
}
