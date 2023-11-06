import 'package:belajarauthentication/model/user_model.dart';
import 'package:belajarauthentication/screens/profile.dart';
import 'package:belajarauthentication/screens/register_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:belajarauthentication/provider/auth_provider.dart';
import 'package:belajarauthentication/screens/welcome_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("INDONESIA MERDEKA"),
        centerTitle: true,
       backgroundColor: Colors.grey,
       
      ),    
      drawer: Drawer(
        child: ListView(padding: EdgeInsets.zero, 
        children: <Widget>[
         UserAccountsDrawerHeader(
            accountName: Text(ap.userModel.name),
            accountEmail: Text(ap.userModel.email),
           decoration: BoxDecoration(
            color: Colors.blueAccent),
            currentAccountPicture: new CircleAvatar(
              radius: 70.0,
              backgroundColor: const Color(0xFF778899),
              backgroundImage: NetworkImage(ap.userModel.profilePic),

            ),
            
          ),
        
          
          ListTile(
            leading: Icon(
              Icons.account_circle_sharp,
            ),
            title: const Text('PROFIL'),
            onTap: () {
              Navigator.push(context,
              MaterialPageRoute(builder: (context) => Profile()));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.messenger_outline,
            ),
            title: const Text('MASSANGER'),
            onTap: () {
              Navigator.pop(context);
             
            },
          ),
          ListTile(
            leading: Icon(
              Icons.paypal_outlined,
            ),
            title: const Text('DONASI'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.code_sharp,
            ),
            title: const Text('PENGEMBANG TRIPLEPRO'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.add_shopping_cart_outlined,
            ),
            title: const Text('UPGRADE'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.analytics_outlined,
              ),
              title: const Text('STATISTIC'),
              onTap: () {
                Navigator.pop(context);
              },
          ),
          ListTile(
            leading: Icon(
              Icons.public_rounded,
              ),
              title: const Text('FOLLOW TRIPLEPRO'),
              onTap: () {
                Navigator.pop(context);
              },
          ),
          ListTile(
            leading: Icon(
              Icons.exit_to_app,
              ),
            title: const Text('SIGNOUT'),
            onTap
            : () {
              ap.userSignOut().then(
                    (value) => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterScreen(),
                      ),
                    ),
                  );
            },
          ),
        ]
        ),
      ),
     body: SafeArea(
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 15),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(ap.userModel.profilePic),
                      fit: BoxFit.cover,
                      )
                  ),
                )
              ],
            )
          ],
        ),
      ),
     ),
    );
  }
}
