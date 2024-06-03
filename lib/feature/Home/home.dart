import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:testapplication/feature/Home/productDetails.dart';

import '../../core/app_colors.dart';
import '../auth/login.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Product>> _productsFuture;

  @override
  void initState() {
    super.initState();
    _productsFuture = fetchProducts();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("assets/images/homelogo.jpg", height: 80, width: 80),
            Expanded(
              child: FutureBuilder<List<Product>>(
                future: _productsFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No products found.'));
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        final product = snapshot.data![index];
                        return HomeItemList(
                          image: product.imageUrl,
                          title: product.name,
                          price: product.price,
                          description: product.description,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductDetailsScreen(product: product),
                              ),
                            );
                          },
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Future<List<Product>> fetchProducts() async {
  QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('products').get();

  return snapshot.docs.map((doc) {
    return Product.fromFirestore(doc.data() as Map<String, dynamic>, doc.id);
  }).toList();
}
}


class Product {
  final String id;
  final String imageUrl;
  final String name;
  final String price;
  final String description;

  Product({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.description,
  });

  factory Product.fromFirestore(Map<String, dynamic> data, String documentId) {
    return Product(
      id: documentId,
      imageUrl: data['imageUrl'] ?? '',
      name: data['name'] ?? '',
      price: data['price'] ?? '',
      description: data['description'] ?? '',
    );
  }
}


class HomeItemList extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final String price;

  final void Function()? onTap;

  const HomeItemList({
    super.key,
    required this.image,
    required this.title,

    this.onTap, required this.description, required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0.0, bottom: 10, left: 15, right: 15),
      child: Container(
        width: ScreenUtils().screenWidth(context),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(15.0),
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              // color:  Colors.blueGrey.withOpacity(0.4),
                color: AppColors.colorSecondaryText2.withOpacity(0.2),
                offset: const Offset(0.0, 3.0),
                blurRadius: 8.0)
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: InkWell(
            onTap: onTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  image,
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      const SizedBox(height: 5,),
                      Text(
                        description,
                        style: const TextStyle(
                            fontFamily: 'Roboto',
                            color: AppColors.primaryButtonColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(height: 10,),
                      Text(
                        price,
                        style: const TextStyle(
                            fontFamily: 'Roboto',
                            color: AppColors.primaryButtonColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),

                      const SizedBox(height: 10),


                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
