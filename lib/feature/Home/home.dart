import 'package:flutter/material.dart';

import '../../core/app_colors.dart';
import '../auth/login.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
              child: ListView.builder(
                itemCount: 10,
                  itemBuilder:(BuildContext context, int index){
                  return const HomeItemList(
                    image: 'https://images.pexels.com/photos/788946/pexels-photo-788946.jpeg?cs=srgb&dl=pexels-jessbaileydesign-788946.jpg&fm=jpg',
                    title: 'Mobile',
                    price: '25000',
                    description: "This is a very beautiful phone",
                  );

                  }),
            )

          ],
        ),

      ),
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
