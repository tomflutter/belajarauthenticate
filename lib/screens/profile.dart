import 'package:belajarauthentication/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:belajarauthentication/provider/auth_provider.dart';
import 'package:belajarauthentication/screens/welcome_screen.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(),
      
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.white30,
            backgroundImage: NetworkImage(ap.userModel.profilePic),
            radius: 50,
          ),
          const SizedBox(height: 20),
          Text(ap.userModel.name),
          Text(ap.userModel.phoneNumber),
          Text(ap.userModel.email),
          Text(ap.userModel.bio),
          IconButton(
            onPressed: () {
              ap.userSignOut().then(
                    (value) => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterScreen(),
                      ),
                    ),
                  );
            },
            icon: const Icon(Icons.exit_to_app_outlined),
          ),
        ],
      )),
    );
  }
}
