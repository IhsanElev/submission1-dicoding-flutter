import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:restaurant_app/screen/detail_page_restaurant.dart';
import 'package:restaurant_app/util/layout_size.dart';

import 'package:restaurant_app/util/style.dart';


import '../model/restauran.dart';

class RestaurantListPage extends StatelessWidget {
  const RestaurantListPage({Key? key}) : super(key: key);

  static const routeName = '/resto_list';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
     
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white),
            padding: const EdgeInsets.only(top: 30,left:20,),
            margin: EdgeInsets.only(left: AppLayout.getWidth(8), top: AppLayout.getHeight(30)),
            height: 100,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Restaurant',
                  style: Theme.of(context).textTheme.headline4,
                ),
                SizedBox(height: AppLayout.getHeight(5),),
                Text(
                  'Recomendation Restauran For You!',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder<String>(
                future: DefaultAssetBundle.of(context)
                    .loadString('assets/restaurant.json'),
                builder: (context, snapshot) {
                  if (snapshot.connectionState!=ConnectionState.done) {

                   return const Center(child: CircularProgressIndicator(),);
                  } else if (snapshot.hasData) {
                     var jsonMap = jsonDecode(snapshot.data!);
                    var restaurant = Restaurant.fromJson(jsonMap);
                    return ListView.builder(
                        itemCount: restaurant.restaurants.length,
                        itemBuilder: (context, index) {
                          return _buildRestoItem(
                              context, restaurant.restaurants[index]);
                        });
                  } else if(snapshot.hasError){
                    return const Center(child: Text('Terjadi Kesalahan'));
                  }else{
                    return const Center(child: CircularProgressIndicator(),);
                  }
                }),
          ),
        ],
      ),
    );
  }
}

Widget _buildRestoItem(BuildContext context, RestaurantElement resto) {
  double rating = resto.rating;
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    child: InkWell(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: AppLayout.getHeight(12),
              horizontal: AppLayout.getWidth(12)),
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(
                vertical: AppLayout.getHeight(8),
                horizontal: AppLayout.getWidth(8)),
            leading: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: AppLayout.getWidth(80),
                minHeight: AppLayout.getHeight(80),
                maxWidth: AppLayout.getWidth(80),
                maxHeight: AppLayout.getHeight(80),
              ),
              child: Hero(
                  tag: resto.pictureId,
                  child: Image.network( resto.pictureId, fit: BoxFit.cover)),
            ),
            title: Text(resto.name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                     const Icon(Icons.location_city),
                    Text(resto.city),
                  ],
                ),
                Row(
                  children: [
                    Text(rating.toString()),
                    const SizedBox(),
                    RatingBarIndicator(
                      rating: rating,
                      itemBuilder: (context, index) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      direction: Axis.horizontal,
                      itemSize: 20,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.pushNamed(context, DetailPage.routeName,arguments: resto);
        }),
  );
}
