import 'package:flutter/material.dart';

import 'model/restauran.dart';

class RestaurantListPage extends StatelessWidget {
  const RestaurantListPage({Key? key}) : super(key: key);

  static const routeName = '/resto_list';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Restaurant',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        shadowColor: Colors.grey,
      ),
      body: FutureBuilder<String?>(
          future: DefaultAssetBundle.of(context)
              .loadString('assets/local_restaurant.json'),
          builder: (context, snapshot) {
            final List<RestaurantElement> restaurant =
                parseRestaurant(snapshot.data);
            return ListView.builder(
                itemCount: restaurant.length,
                itemBuilder: (context, index) {
                  return _buildRestoItem(context, restaurant[index]);
                });
          }),
    );
  }
}

Widget _buildRestoItem(BuildContext context, RestaurantElement resto) {
  return Center(
    child: ListTile(
      title: Text(resto.name,style: TextStyle(fontSize: 40),),
    ),
  );
}

