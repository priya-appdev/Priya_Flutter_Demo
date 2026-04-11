import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenPage();
}

class _OnboardingScreenPage extends State<OnboardingScreen> {
  final List<Map<String, dynamic>> feature = [
    {
      'icon': Icons.fastfood,
      'title': 'Food',
      'description':
          'Explore a wide variety of cuisines from top-rated restaurants near you.Customize your meals with special instructions and dietary preferences.Enjoy exclusive deals and discounts on your favorite dishes.',
    },
    {
      'icon': Icons.local_shipping,
      'title': 'Delivery',
      'description':
          'Get your orders delivered fast with real-time tracking at every step.Our delivery partners ensure your food arrives fresh and on time.Schedule deliveries at your convenience, anytime and anywhere.',
    },
    {
      'icon': Icons.payment,
      'title': 'Secure Pay',
      'description':
          'Pay with confidence using our encrypted and secure payment gateway.Multiple payment options including cards, wallets, and cash on delivery.Your financial data is protected with industry-standard encryption.',
    },
    {
      'icon': Icons.support,
      'title': 'Support',
      'description':
          'Our dedicated support team is available 24/7 to assist you.Get instant help through live chat, email, or phone support.Quick resolution for orders, refunds, and account-related queries.',
    },
  ];
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            SizedBox(height: 15),
            Image.asset('asset/images/logout.png', height: 50, width: 50),
            SizedBox(height: 20),
            Text(
              'Welcome to our app',
              textAlign: TextAlign.center,
              style: TextStyle(fontFamily: 'Poppins', fontSize: 15),
            ),
            SizedBox(height: 10),
            Text(
              'Discover amazing features and enjoy seamless experience',
              textAlign: TextAlign.center,
              style: TextStyle(fontFamily: 'Poppins', fontSize: 20),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 400,
              child: PageView.builder(
                controller: _pageController,
                // shrinkWrap: true,
                // physics: NeverScrollableScrollPhysics(),
                itemCount: feature.length,
                // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //   crossAxisCount: 3,
                //   crossAxisSpacing: 10,
                //   mainAxisSpacing: 10,
                // ),
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(feature[index]['icon'], size: 150),
                      SizedBox(height: 15),
                      Text(
                        feature[index]['title'],
                        style: TextStyle(fontFamily: 'Poppins', fontSize: 20),
                      ),
                      SizedBox(height: 15),
                      Text(
                        feature[index]['description'],
                        style: TextStyle(fontFamily: 'Poppins', fontSize: 10),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                    ],
                    // decoration: BoxDecoration(
                    //   color: Colors.blue.shade50,
                    //   borderRadius: BorderRadius.circular(20),
                    // ),
                    // child: Column(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Icon(feature[index]['icon'], size: 40),
                    //     SizedBox(height: 10),
                    //     Text(feature[index]['title']),
                    //   ],
                    // ),
                  );
                },
              ),
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                feature.length,
                (index) => Container(
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  width: _currentPage == index ? 8 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: _currentPage == index
                        ? Colors.blue
                        : Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),

            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'Get Started',
                style: TextStyle(fontFamily: 'Poppins', fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
