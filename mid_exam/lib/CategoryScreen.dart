import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

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
            'Categories Coming Soon',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              "We're working hard to bring you a great category browsing experience!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


// In this file, there is a categories screen constructor, then in the build method 
// we have a container which has the animation, then a box then with some padding the text
