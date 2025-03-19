import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 200,
            width: 200,
            child: Lottie.network(
              'https://assets9.lottiefiles.com/packages/lf20_ystsffqy.json',
              repeat: true,
              animate: true,
            ),
          ),
          SizedBox(height: 24),
          Text(
            'Profile Coming Soon',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              "We're working on creating an amazing profile experience for you!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ),
          SizedBox(height: 32),
          ElevatedButton(
            onPressed: () {
              // Sign in functionality will be implemented later
            },
            child: Text('Sign In'),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            ),
          ),
        ],
      ),
    );
  }
}

// In this file, there is a Profile screen constructor, then in the build method 
// we have a container which has the animation, then a box then with some padding and our main text
// then we have the sign in button 

