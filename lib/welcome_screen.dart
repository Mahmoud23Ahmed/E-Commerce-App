import 'package:e_commerce/Auth/AuthScreen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final _PageController = PageController();
  int CurrentPage = 0;
  List<WelcomeSlider> welcomeSlider = [
    WelcomeSlider(
        title: 'Shop All You Want!',
        description: 'Select from a wide range of variety',
        image: 'Assests/shoppingGirl2.jpg'),
    WelcomeSlider(
        title: 'Save Time , order Online',
        description: 'Convenience at your fingertips',
        image: 'Assests/onlineShop.jpg'),
    WelcomeSlider(
        title: 'The Greatest shop journey',
        description: 'Make a practical choice with one voice!',
        image: 'Assests/shoppingGirl1.jpg'),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AuthScreen()));
                        },
                        child: const Text(
                          "Skip",
                          style:
                              TextStyle(color: Color(0xFF7096D1), fontSize: 20),
                        )),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Expanded(
                    child: PageView.builder(
                      controller: _PageController,
                      itemCount: welcomeSlider.length,
                      onPageChanged: (value) {
                        setState(() {
                          CurrentPage = value;
                        });
                      },
                      itemBuilder: (context, index) {
                        final item = welcomeSlider[index];
                        return Column(
                          children: [
                            Image.asset(
                              item.image,
                              height: 350,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              item.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 28),
                            ),
                            Text(
                              item.description,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 94, 92, 92),
                                  fontSize: 20),
                            )
                          ],
                        );
                      },
                    ),
                  ),
                  Row(
                      children: List.generate(3, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        height: 10,
                        width: CurrentPage == index ? 30 : 10,
                        decoration: BoxDecoration(
                          color: CurrentPage == index
                              ? const Color(0xFF7096D1)
                              : Colors.grey,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    );
                  })),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: const Color(0xFF7096D1),
            onPressed: () {
              if (CurrentPage < welcomeSlider.length) {
                _PageController.nextPage(
                    duration: const Duration(milliseconds: 1000),
                    curve: Curves.easeOut);
              } else if (CurrentPage != welcomeSlider.length - 1) {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const AuthScreen()));
              }
            },
            child: CurrentPage != welcomeSlider.length - 1
                ? const Icon(Icons.arrow_forward)
                : const Icon(Icons.done),
          ),
        ));
  }
}

class WelcomeSlider {
  final String title;
  final String description;
  final String image;

  WelcomeSlider(
      {required this.title, required this.description, required this.image});
}
