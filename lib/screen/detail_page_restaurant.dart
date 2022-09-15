import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:readmore/readmore.dart';
import 'package:restaurant_app/model/restauran.dart';

class DetailPage extends StatelessWidget {
  final RestaurantElement resto;
  const DetailPage({super.key, required this.resto});
  static const routeName = '/detail_resto';
  @override
  Widget build(BuildContext context) {
    var rating = resto.rating;
    return Scaffold(
        body: NestedScrollView(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Stack(
            //   children: [
            //     Hero(
            //       tag: resto.pictureId,
            //       child: Image.network(resto.pictureId),
            //     ),
            //     SafeArea(
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           IconButton(
            //             icon: const Icon(
            //               Icons.arrow_back,
            //               color: Colors.white,
            //             ),
            //             onPressed: () {
            //               Navigator.pop(context);
            //             },
            //           )
            //         ],
            //       ),
            //     ),
            //   ],
            // ),
            Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        resto.name,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
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
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        Text(
                          resto.city,
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 16,
                      bottom: 10,
                    ),
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Description',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(2.0),
                    child: ReadMoreText(
                      resto.description,
                      trimLines: 3,
                      colorClickableText: Colors.blue,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'Show more',
                      trimExpandedText: 'Show less',
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Foods',
                          style: Theme.of(context).textTheme.headline6,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: (MediaQuery.of(context).size.height * 0.15),
                    width: (MediaQuery.of(context).size.width * 0.94),
                    child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: resto.menus.foods.map((foods) {
                          return SizedBox(
                            width: 150,
                            height: 200,
                            child: Card(
                              elevation: 2,
                              child: Column(
                                children: [
                                  Container(
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                        image: AssetImage('assets/images/food2.png'),
                                        fit: BoxFit.fitHeight
                                        
                                      )),
                                      height:
                                          (MediaQuery.of(context).size.height *
                                              0.1)),
                                  Container(
                                    alignment: Alignment.bottomCenter,
                                    child: Text(foods.name,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList()),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Drinks',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: (MediaQuery.of(context).size.height * 0.15),
                    width: (MediaQuery.of(context).size.width * 0.94),
                    child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: resto.menus.drinks.map((drinks) {
                          return SizedBox(
                            width: 150,
                            child: Card(
                              elevation: 2,
                              child: Column(
                                children: [
                                Container(
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                        image: AssetImage('assets/images/ice.png'),
                                        fit: BoxFit.fitHeight
                                        
                                      )),
                                      height:
                                          (MediaQuery.of(context).size.height *
                                              0.1)),
                                  Container(
                                    alignment: Alignment.bottomCenter,
                                    child: Text(drinks.name,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList()),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverAppBar(
            pinned: true,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                  tag: resto.pictureId,
                  child: Image.network(
                    resto.pictureId,
                    fit: BoxFit.fitWidth,
                  )),
              title: Text(resto.name),
              titlePadding: const EdgeInsets.only(left: 16, bottom: 16),
            ),
          )
        ];
      },
    ));
  }
}
