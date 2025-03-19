import 'package:flutter/material.dart';
import 'package:mid_exam/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final bool showSale;
  
  ProductCard({required this.product, required this.showSale});
  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 200, // Fixed height instead of AspectRatio
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Image.network(
                    product.image,
                    fit: BoxFit.contain,
                    // Removed LoadingBuilder
                  ),
                ),
                // Replaced Positioned with Align for favorite icon
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.7),
                        shape: BoxShape.circle,
                      ),
                      padding: EdgeInsets.all(4),
                      child: Icon(Icons.favorite_border, size: 20, color: Colors.purple),
                    ),
                  ),
                ),
                // Replaced Positioned with Align for sale tag
                if (showSale)
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          'SALE',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.indigo[800],
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        "MEN'S CLOTHING",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 16),
                        SizedBox(width: 4),
                        Text(
                          product.rating.rate.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Text(
                  product.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  '\$${product.price.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.indigo,
                  ),
                ),
                SizedBox(height: 8),
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.shopping_cart, size: 16),
                  label: Text('Add to Cart'),
                  style: TextButton.styleFrom(
                    backgroundColor: theme.brightness == Brightness.dark
                        ? Colors.indigo[800]
                        : Colors.indigo[100],
                    foregroundColor: theme.brightness == Brightness.dark
                        ? Colors.white
                        : Colors.indigo[800],
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    minimumSize: Size(double.infinity, 30),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// In this file, we have a product card constructor, then in the build method, it defines the theme
// creates a card, Which has children as a container with image and favorite icon, then a sale tag
// then a padding with a column which has a row with a container and a row, then a text, then a text, then a text button