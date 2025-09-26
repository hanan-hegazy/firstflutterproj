import 'package:firstflutter/hover.dart' show HoverContainer;
import 'package:firstflutter/hover2.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key, String? title});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final PageController _controller = PageController();
  int _currentPage = 0;
  bool Hover = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 149, 120, 169), // لون الخلفية
        toolbarHeight: 90,
        centerTitle: true,
        title: const Text(
          'Our Products',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Text("Featured Products", style: TextStyle(fontSize: 27)),
            SizedBox(height: 15),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 300,
                  width: 1000,
                  child: Stack(
                    children: [
                      PageView(
                        controller: _controller,
                        onPageChanged: (index) =>
                            setState(() => _currentPage = index),
                        children: [
                          Stack(
                            children: [
                              Center(
                                child: Image.asset(
                                  "1.jpg",
                                  fit: BoxFit.cover,
                                  width: 1000,
                                  height: double.infinity,
                                ),
                              ),
                              Positioned(
                                left: 10,
                                bottom: 10,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 5,
                                    vertical: 2,
                                  ),
                                  child: const Text(
                                    'Wonderful flower',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 76, 27, 111),
                                      fontSize: 25,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Stack(
                            children: [
                              Center(
                                child: Image.asset(
                                  "2.jpg",
                                  fit: BoxFit.fitWidth,
                                  width: 1000,
                                  height: double.infinity,
                                ),
                              ),
                              Positioned(
                                left: 10,
                                bottom: 10,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 5,
                                    vertical: 2,
                                  ),
                                  child: const Text(
                                    'Wonderful flower',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 76, 27, 111),
                                      fontSize: 25,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Stack(
                            children: [
                              Center(
                                child: Image.asset(
                                  "3.jpg",
                                  fit: BoxFit.fitWidth,
                                  width: 1000,
                                  height: double.infinity,
                                ),
                              ),
                              Positioned(
                                left: 10,
                                bottom: 10,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 5,
                                    vertical: 2,
                                  ),
                                  child: const Text(
                                    'Wonderful flower',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 76, 27, 111),
                                      fontSize: 25,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          iconSize: 20,
                          color: Colors.black,
                          icon: const Icon(Icons.arrow_back),
                          onPressed: _prevPage,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          iconSize: 20,
                          color: Colors.black,
                          icon: const Icon(Icons.arrow_forward),
                          onPressed: _nextPage,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 13),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, (index) {
                    return MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          _controller.animateToPage(
                            index,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: 14,
                          height: 14,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentPage == index
                                ? Colors.purple
                                : Colors.grey,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),

            SizedBox(height: 65),
            Text("Shop Our Collection", style: TextStyle(fontSize: 27)),
            SizedBox(height: 20),

            SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      HoverContainer(
                        color: const Color.fromARGB(255, 244, 240, 240),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                  child: Image.asset(
                                    "4.jpg",
                                    width: Hover ? 600 : 606,
                                    height: 200,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  top: 12,
                                  right: 12,
                                  child: GestureDetector(
                                    onTap: () {
                                      const itemName = 'Ixora Flower';
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(
                                          behavior: SnackBarBehavior.floating,
                                          duration: Duration(milliseconds: 800),
                                          margin: const EdgeInsets.only(
                                            top: 10,
                                            left: 50,
                                          ),
                                          backgroundColor: Colors.transparent,
                                          elevation: 0,
                                          content: Align(
                                            alignment: Alignment.bottomRight,
                                            child: Container(
                                              width: 300,
                                              height: 60,
                                              decoration: BoxDecoration(
                                                color: Colors.black87,
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              alignment: Alignment.center,
                                              child: Text(
                                                '$itemName has been added to your cart',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: const BoxDecoration(
                                        color: Colors.purple,
                                        shape: BoxShape.circle,
                                      ),
                                      child: MouseRegion(
                                        cursor: SystemMouseCursors.click,
                                        child: const Icon(
                                          Icons.shopping_cart,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 40,
                                right: 450,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Ixora Flower',
                                    style: TextStyle(
                                      fontSize: 23,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    "10\$",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Color.fromARGB(255, 76, 27, 111),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 35),
                      Column(
                        children: [
                          HoverContainer(
                            color: const Color.fromARGB(255, 244, 240, 240),
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                      ),
                                      child: Image.asset(
                                        "5.jpg",
                                        width: Hover ? 600 : 606,
                                        height: 200,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Positioned(
                                      top: 12,
                                      right: 12,
                                      child: GestureDetector(
                                        onTap: () {
                                          const itemName = 'Rose Flower';
                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            SnackBar(
                                              behavior:
                                                  SnackBarBehavior.floating,
                                              duration: Duration(
                                                milliseconds: 800,
                                              ),
                                              margin: const EdgeInsets.only(
                                                top: 10,
                                                left: 50,
                                              ),
                                              backgroundColor:
                                                  Colors.transparent,
                                              elevation: 0,
                                              content: Align(
                                                alignment:
                                                    Alignment.bottomRight,
                                                child: Container(
                                                  width: 300,
                                                  height: 60,
                                                  decoration: BoxDecoration(
                                                    color: Colors.black87,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          12,
                                                        ),
                                                  ),
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    '$itemName has been added to your cart',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(8),
                                          decoration: const BoxDecoration(
                                            color: Colors.purple,
                                            shape: BoxShape.circle,
                                          ),
                                          child: MouseRegion(
                                            cursor: SystemMouseCursors.click,
                                            child: const Icon(
                                              Icons.shopping_cart,
                                              color: Colors.white,
                                              size: 20,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 40,
                                    right: 450,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        'Rose Flower',
                                        style: TextStyle(
                                          fontSize: 23,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        "12\$",
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Color.fromARGB(
                                            255,
                                            76,
                                            27,
                                            111,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      HoverContainer(
                        color: const Color.fromARGB(255, 244, 240, 240),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                  child: Image.asset(
                                    "6.jpg",
                                    width: Hover ? 600 : 606,
                                    height: 200,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  top: 12,
                                  right: 12,
                                  child: GestureDetector(
                                    onTap: () {
                                      const itemName = 'Carnation';
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(
                                          behavior: SnackBarBehavior.floating,
                                          duration: Duration(milliseconds: 800),
                                          margin: const EdgeInsets.only(
                                            top: 10,
                                            left: 50,
                                          ),
                                          backgroundColor: Colors.transparent,
                                          elevation: 0,
                                          content: Align(
                                            alignment: Alignment.bottomRight,
                                            child: Container(
                                              width: 300,
                                              height: 60,
                                              decoration: BoxDecoration(
                                                color: Colors.black87,
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              alignment: Alignment.center,
                                              child: Text(
                                                '$itemName has been added to your cart',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: const BoxDecoration(
                                        color: Colors.purple,
                                        shape: BoxShape.circle,
                                      ),
                                      child: MouseRegion(
                                        cursor: SystemMouseCursors.click,
                                        child: const Icon(
                                          Icons.shopping_cart,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 40,
                                right: 450,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Carnation',
                                    style: TextStyle(
                                      fontSize: 23,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    "15\$",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Color.fromARGB(255, 76, 27, 111),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 35),
                      HoverContainer(
                        color: const Color.fromARGB(255, 244, 240, 240),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                  child: Image.asset(
                                    "7.jpg",
                                    width: Hover ? 600 : 606,
                                    height: 200,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  top: 12,
                                  right: 12,
                                  child: GestureDetector(
                                    onTap: () {
                                      const itemName = 'Bell Flower';
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(
                                          behavior: SnackBarBehavior.floating,
                                          duration: Duration(milliseconds: 800),
                                          margin: const EdgeInsets.only(
                                            top: 10,
                                            left: 50,
                                          ),
                                          backgroundColor: Colors.transparent,
                                          elevation: 0,
                                          content: Align(
                                            alignment: Alignment.bottomRight,
                                            child: Container(
                                              width: 300,
                                              height: 60,
                                              decoration: BoxDecoration(
                                                color: Colors.black87,
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              alignment: Alignment.center,
                                              child: Text(
                                                '$itemName has been added to your cart',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: const BoxDecoration(
                                        color: Colors.purple,
                                        shape: BoxShape.circle,
                                      ),
                                      child: MouseRegion(
                                        cursor: SystemMouseCursors.click,
                                        child: const Icon(
                                          Icons.shopping_cart,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 40,
                                right: 450,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Bell Flower',
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    "10\$",
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: Color.fromARGB(255, 76, 27, 111),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      HoverContainer(
                        color: const Color.fromARGB(255, 244, 240, 240),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                  child: Image.asset(
                                    "8.jpg",
                                    width: Hover ? 600 : 606,
                                    height: 200,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  top: 12,
                                  right: 12,
                                  child: GestureDetector(
                                    onTap: () {
                                      const itemName = 'Black eyed';
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(
                                          behavior: SnackBarBehavior.floating,
                                          duration: Duration(milliseconds: 800),
                                          margin: const EdgeInsets.only(
                                            top: 10,
                                            left: 50,
                                          ),
                                          backgroundColor: Colors.transparent,
                                          elevation: 0,
                                          content: Align(
                                            alignment: Alignment.bottomRight,
                                            child: Container(
                                              width: 300,
                                              height: 60,
                                              decoration: BoxDecoration(
                                                color: Colors.black87,
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              alignment: Alignment.center,
                                              child: Text(
                                                '$itemName has been added to your cart',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: const BoxDecoration(
                                        color: Colors.purple,
                                        shape: BoxShape.circle,
                                      ),
                                      child: MouseRegion(
                                        cursor: SystemMouseCursors.click,
                                        child: const Icon(
                                          Icons.shopping_cart,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 40,
                                right: 450,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Black eyed',
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    "16\$",
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: Color.fromARGB(255, 76, 27, 111),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 35),
                      HoverContainer(
                        color: const Color.fromARGB(255, 244, 240, 240),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                  child: Image.asset(
                                    "9.jpg",
                                    width: Hover ? 600 : 606,
                                    height: 200,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  top: 12,
                                  right: 12,
                                  child: GestureDetector(
                                    onTap: () {
                                      const itemName = 'Columbine';
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(
                                          behavior: SnackBarBehavior.floating,
                                          duration: Duration(milliseconds: 800),
                                          margin: const EdgeInsets.only(
                                            top: 10,
                                            left: 50,
                                          ),
                                          backgroundColor: Colors.transparent,
                                          elevation: 0,
                                          content: Align(
                                            alignment: Alignment.bottomRight,
                                            child: Container(
                                              width: 300,
                                              height: 60,
                                              decoration: BoxDecoration(
                                                color: Colors.black87,
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              alignment: Alignment.center,
                                              child: Text(
                                                '$itemName has been added to your cart',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: const BoxDecoration(
                                        color: Colors.purple,
                                        shape: BoxShape.circle,
                                      ),
                                      child: MouseRegion(
                                        cursor: SystemMouseCursors.click,
                                        child: const Icon(
                                          Icons.shopping_cart,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 40,
                                right: 450,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Columbine',
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    "11\$",
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: Color.fromARGB(255, 76, 27, 111),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            Text(
              "Hot Offers 🔥",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
            Column(
              children: [
                HoverBox(
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "50% Off Electronics",
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Limited time offer on all tech gadgets",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Colors.purple, Colors.pink],
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Text(
                          "50% OFF",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
                HoverBox(
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Free Shipping Weekend",
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "No delivery charges on orders above \$50",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Colors.purple, Colors.pink],
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Text(
                          "FREE SHIP",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
                HoverBox(
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Buy 2 Get 1 Free",
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "On selected accessories and peripherals",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Colors.purple, Colors.pink],
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Text(
                          "B2G1",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
                HoverBox(
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Student Discount",
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Extra 20% off with valid student ID",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Colors.purple, Colors.pink],
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Text(
                          "20% OFF",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
                HoverBox(
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Bundle Deals",
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Save more when you buy complete setups",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Colors.purple, Colors.pink],
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Text(
                          "BUNDLE",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  void _nextPage() {
    if (_currentPage < 2) {
      _currentPage++;
    } else {
      _currentPage = 0; // لو وصلنا آخر صفحة ارجع للأولى
    }
    _controller.animateToPage(
      _currentPage,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  void _prevPage() {
    if (_currentPage > 0) {
      _currentPage--;
    } else {
      _currentPage = 2; // لو وصلنا أول صفحة ارجع لآخر صفحة
    }
    _controller.animateToPage(
      _currentPage,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }
}
