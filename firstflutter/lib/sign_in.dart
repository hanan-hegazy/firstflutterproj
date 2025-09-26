import 'package:firstflutter/HomePage.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  double containerHeightt = 400;
  String emailError = '';
  String passError = '';
  bool isHover = false;
  bool hiddingpass = true;
  final TextEditingController eemailController = TextEditingController();
  final TextEditingController ppasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 149, 120, 169),
      body: Stack(
        children: [
          Positioned(
            top: 20,
            left: 10,
            child: IconButton(
              icon: Icon(Icons.arrow_back, size: 30, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Center(
            child: Container(
              width: 450,
              height: containerHeightt,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 241, 246, 246),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  SizedBox(height: 15),
                  const Text(
                    "Welcome Back",
                    style: TextStyle(
                      color: Color.fromARGB(255, 149, 120, 169),
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Sign in to ShopCraft",
                    style: TextStyle(
                      color: Color.fromARGB(255, 136, 136, 136),
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 25),
                  Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Email',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        SizedBox(
                          width: 418,
                          height: 45,
                          child: TextField(
                            controller: eemailController,
                            decoration: InputDecoration(
                              hintText: 'Enter Your Email',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        if (emailError.isNotEmpty)
                          Text(
                            emailError,
                            style: TextStyle(color: Colors.red, fontSize: 13),
                          ),
                        SizedBox(height: 25),
                        Text(
                          'Password',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        SizedBox(
                          width: 418,
                          height: 45,
                          child: TextField(
                            controller: ppasswordController,
                            obscureText: hiddingpass,
                            decoration: InputDecoration(
                              hintText: 'Enter Your Password',
                              suffixIcon: IconButton(
                                onPressed: () {
                                  togglePassword();
                                },
                                icon: Icon(
                                  hiddingpass
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        if (passError.isNotEmpty)
                          Text(
                            passError,
                            style: TextStyle(color: Colors.red, fontSize: 13),
                          ),
                        SizedBox(height: 20),
                        SizedBox(
                          width: 418,
                          height: 50,
                          child: MouseRegion(
                            onEnter: (_) => setState(() => isHover = true),
                            onExit: (_) => setState(() => isHover = false),
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 200),
                              transform: Matrix4.identity()
                                ..scale(isHover ? 1.02 : 1.0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color.fromARGB(
                                    255,
                                    149,
                                    120,
                                    169,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onPressed: () {
                                  containerHeightt = 400;
                                  String text = eemailController.text;
                                  if (text.isEmpty) {
                                    setState(
                                      () => emailError = 'Email is required',
                                    );
                                    containerHeightt += 15;
                                  } else if (!(text.contains('@'))) {
                                    setState(
                                      () =>
                                          emailError = 'Must Contain letter @',
                                    );
                                    containerHeightt += 15;
                                  }
                                  String pass = ppasswordController.text;
                                  if (pass.isEmpty) {
                                    setState(
                                      () => passError = 'Password is required',
                                    );
                                    containerHeightt += 15;
                                  } else if (pass.length < 6) {
                                    setState(
                                      () => passError =
                                          'Password must be at least 6 characters',
                                    );
                                    containerHeightt += 15;
                                  }
                                  if (emailError == '' && passError == '') {
                                    myDialogg();
                                  }
                                },
                                child: Text(
                                  'Sign In',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 253, 251, 255),
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
          ),
        ],
      ),
    );
  }

  void togglePassword() {
    setState(() {
      hiddingpass = !hiddingpass;
    });
  }

  Future<void> myDialogg() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 40,
            vertical: 240,
          ),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            height: 270,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    children: [
                      const Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: Text(
                            'Welcome!',
                            style: TextStyle(color: Colors.green, fontSize: 30),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        child: IconButton(
                          icon: const Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 20,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                           
                          },
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'Account sign-in successfully',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromARGB(255, 155, 155, 155),
                        fontSize: 21,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 400,
                    height: 45,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                         Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (_) => Homepage()),
                            );
                      },
                      child: const Text(
                        'Close',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
