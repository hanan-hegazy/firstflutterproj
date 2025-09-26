import 'package:firstflutter/sign_in.dart';
import 'package:firstflutter/sign_upp.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.title});
  final String title;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isHover1 = false;
  bool isHover2 = false;
  bool hover1 = false;
  bool hover2 = false;
  FontWeight? get bold => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 149, 120, 169),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 80),
            const Text(
              "ShopCraft",
              style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            const Text(
              "Your Premium Shopping Experience",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 30),
            // صف صور جنب بعض
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MouseRegion(
                  onEnter: (_) => setState(() => isHover1 = true),
                  onExit: (_) => setState(() => isHover1 = false),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 160),
                    transform: isHover1
                        ? (Matrix4.identity()..scale(1.04))
                        : Matrix4.identity(),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Stack(
                        children: [
                          Image.asset(
                            "assets/pexels-cindyg-675313.jpg",
                            width: 320,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                          Container(
                            width: 320,
                            height: 200,
                            color: Colors.black.withOpacity(
                              0.3,
                            ), // overlay خفيف ثابت
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                MouseRegion(
                  onEnter: (_) => setState(() => isHover2 = true),
                  onExit: (_) => setState(() => isHover2 = false),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 160),
                    transform: isHover2
                        ? (Matrix4.identity()..scale(1.04))
                        : Matrix4.identity(),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Stack(
                        children: [
                          Image.network(
                            'https://picsum.photos/400/250',
                            width: 320,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                          Container(
                            width: 320,
                            height: 200,
                            color: Colors.black.withOpacity(0.2),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 45),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MouseRegion(
                    onEnter: (_) => setState(() => hover1 = true),
                    onExit: (_) => setState(() => hover1 = false),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      transform: hover1
                          ? (Matrix4.identity()..scale(1.04))
                          : Matrix4.identity(),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(160, 50),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUpp(),
                            ),
                          );
                        },
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 20),

                  // زر الدخول مع نص مخفي يظهر عند hover
                  MouseRegion(
                    onEnter: (_) => setState(() => hover2 = true),
                    onExit: (_) => setState(() => hover2 = false),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      transform: hover2
                          ? (Matrix4.identity()..scale(1.04))
                          : Matrix4.identity(),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(160, 50),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignIn(),
                            ),
                          );
                        },
                        child: AnimatedOpacity(
                          opacity: hover2 ? 1.0 : 0.0,
                          duration: const Duration(milliseconds: 200),
                          child: const Text(
                            "Sign In",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),
                    ),
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
