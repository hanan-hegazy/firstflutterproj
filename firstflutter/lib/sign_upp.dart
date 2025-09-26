import 'package:firstflutter/HomePage.dart';
import 'package:flutter/material.dart';

class SignUpp extends StatefulWidget {
  const SignUpp({super.key});

  @override
  State<SignUpp> createState() => _SignUppState();
}

class _SignUppState extends State<SignUpp> {
  String nameError = '';
  String emailError = '';
  String passError = '';
  String conError = '';
  double containerHeight = 600;
  bool hasError = false;
  bool isHover = false;
  bool hiddingpasss = true;
  bool hiddingpassss = true;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController(); // جديد
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
              height: containerHeight,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 241, 246, 246),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  const Text(
                    "Create Account",
                    style: TextStyle(
                      color: Color.fromARGB(255, 149, 120, 169),
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Join ShopCraft today",
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
                          'Full Name',
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
                            controller: nameController,
                            decoration: InputDecoration(
                              hintText: 'Enter Your Full Name',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        if (nameError.isNotEmpty)
                          Text(
                            nameError,
                            style: TextStyle(color: Colors.red, fontSize: 13),
                          ),
                        SizedBox(height: 25),
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
                            controller: emailController,
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
                            controller: passwordController,
                            obscureText: hiddingpasss,
                            decoration: InputDecoration(
                              hintText: 'Enter Your Password',
                              suffixIcon: IconButton(
                                onPressed: () {
                                  togglePassword();
                                },
                                icon: Icon(
                                  hiddingpasss
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
                        SizedBox(height: 25),
                        Text(
                          'Confirm Password',
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
                            controller: confirmPasswordController,
                            obscureText: hiddingpassss,
                            decoration: InputDecoration(
                              hintText: 'Confirm Your Password',
                              suffixIcon: IconButton(
                                onPressed: () {
                                  togglePasswordd();
                                },
                                icon: Icon(
                                  hiddingpassss
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
                        if (conError.isNotEmpty)
                          Text(
                            conError,
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
                                  setState(() => containerHeight = 600);

                                  String name = nameController.text.trim();
                                  if (name.isEmpty) {
                                    setState(
                                      () => nameError = 'Full name is required',
                                    );
                                    containerHeight += 15;
                                    hasError = true;
                                  } else if (name[0] != name[0].toUpperCase()) {
                                    setState(
                                      () => nameError =
                                          'First letter must be uppercase',
                                    );
                                    containerHeight += 15;
                                    hasError = true;
                                  }
                                  String text = emailController.text;
                                  if (text.isEmpty) {
                                    setState(
                                      () => emailError = 'Email is required',
                                    );
                                    containerHeight += 15;
                                    hasError = true;
                                  } else if (!(text.contains('@'))) {
                                    setState(
                                      () =>
                                          emailError = 'Must Contain letter @',
                                    );
                                    containerHeight += 15;
                                    hasError = true;
                                  }
                                  String pass = passwordController.text;
                                  if (pass.isEmpty) {
                                    setState(
                                      () => passError = 'Password is required',
                                    );
                                    containerHeight += 15;
                                    hasError = true;
                                  } else if (pass.length < 6) {
                                    setState(
                                      () => passError =
                                          'Password must be at least 6 characters',
                                    );
                                    containerHeight += 15;

                                    hasError = true;
                                  }
                                  String conpass =
                                      confirmPasswordController.text;
                                  if (conpass != pass) {
                                    setState(
                                      () => conError = 'Passwords do not match',
                                    );
                                    containerHeight += 15;
                                    hasError = true;
                                  } else if (conpass.isEmpty) {
                                    setState(
                                      () => conError =
                                          'Please confirm your password',
                                    );
                                    containerHeight += 15;
                                    hasError = true;
                                  }
                                  if (nameError == '' &&
                                      emailError == '' &&
                                      passError == '' &&
                                      conError == '') {
                                    myDialog();
                                  }
                                },
                                child: Text(
                                  'Create Account',
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
      hiddingpasss = !hiddingpasss;
    });
  }

  void togglePasswordd() {
    setState(() {
      hiddingpassss = !hiddingpassss;
    });
  }

  Future<void> myDialog() async {
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
                            'Success',
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
                            // Navigator.pushReplacement(
                            //   context,
                            //   MaterialPageRoute(builder: (_) => Homepage()),
                            // );
                          },
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'Account created successfully',
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
