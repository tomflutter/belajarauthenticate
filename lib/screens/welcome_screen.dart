import 'package:flutter/material.dart';
import 'package:belajarauthentication/provider/auth_provider.dart';
import 'package:belajarauthentication/screens/home_screen.dart';
import 'package:belajarauthentication/screens/register_screen.dart';
import 'package:belajarauthentication/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 35),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/image1.png",
                  height: 300,
                ),
                const SizedBox(height: 160),
                const Text(
                  "Selamat Datang",
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold, 
                  ),
                ),
            
                const SizedBox(height: 20),
                const Text(
                  "Akses Jangkauan Pengetahuan Dengan TripleproGpt",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black38,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                // custom button
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: CustomButton(
                    onPressed: () async {
                      if (ap.isSignedIn == true) {
                        await ap.getDataFromSP().whenComplete(
                              () => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomeScreen(),
                                ),
                              ),
                            );
                      } else {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterScreen(),
                          ),
                        );
                      }
                    },
                    text: "Mulai",
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
