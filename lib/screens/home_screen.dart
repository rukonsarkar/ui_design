import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:foody/models/Product.dart';
import 'package:foody/widgets/product_item.dart';
import 'package:http/http.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  int bottomIndex = 0;

  List<Product> mostRatedProductList = [];

  final List<Map<String, String>> vegetableList = [
    {
      'imagePath': 'assets/images/vegetable6.png',
      'title': 'Tomato',
      'rating': '4.8',
      'ratingCount': '150'
    },
    {
      'imagePath': 'assets/images/vegetable9.png',
      'title': 'Carrot',
      'rating': '4.7',
      'ratingCount': '120'
    },
    {
      'imagePath': 'assets/images/vegetable8.png',
      'title': 'Broccoli',
      'rating': '4.6',
      'ratingCount': '110'
    },
    {
      'imagePath': 'assets/images/vegetable7.png',
      'title': 'Spinach',
      'rating': '4.5',
      'ratingCount': '90'
    },
    {
      'imagePath': 'assets/images/vegetable6.png',
      'title': 'Cucumber',
      'rating': '4.4',
      'ratingCount': '80'
    },
    {
      'imagePath': 'assets/images/vegetable5.png',
      'title': 'Potato',
      'rating': '4.9',
      'ratingCount': '200'
    },
    {
      'imagePath': 'assets/images/vegetable4.png',
      'title': 'Lettuce',
      'rating': '4.3',
      'ratingCount': '70'
    },
    {
      'imagePath': 'assets/images/vegetable3.png',
      'title': 'Bell Pepper',
      'rating': '4.6',
      'ratingCount': '100'
    },
    {
      'imagePath': 'assets/images/vegetable2.png',
      'title': 'Eggplant',
      'rating': '4.2',
      'ratingCount': '60'
    },
    {
      'imagePath': 'assets/images/vegetable1.png',
      'title': 'Onion',
      'rating': '4.1',
      'ratingCount': '50'
    }
  ];

  final List<Map<String, String>> healthyFoodsList = [
    {
      'imagePath': 'assets/images/vegetable3.png',
      'title': 'Zucchini',
      'rating': '4.7',
      'ratingCount': '10'
    },
    {
      'imagePath': 'assets/images/vegetable7.png',
      'title': 'Cauliflower',
      'rating': '4.8',
      'ratingCount': '110'
    },
    {
      'imagePath': 'assets/images/vegetable5.png',
      'title': 'Peas',
      'rating': '4.6',
      'ratingCount': '90'
    },
    {
      'imagePath': 'assets/images/vegetable2.png',
      'title': 'Cabbage',
      'rating': '4.5',
      'ratingCount': '85'
    },
    {
      'imagePath': 'assets/images/vegetable6.png',
      'title': 'Beetroot',
      'rating': '4.4',
      'ratingCount': '78'
    },
    {
      'imagePath': 'assets/images/vegetable1.png',
      'title': 'Okra',
      'rating': '4.3',
      'ratingCount': '77'
    },
    {
      'imagePath': 'assets/images/vegetable9.png',
      'title': 'Turnip',
      'rating': '4.2',
      'ratingCount': '75'
    },
    {
      'imagePath': 'assets/images/vegetable4.png',
      'title': 'Radish',
      'rating': '4.1',
      'ratingCount': '70'
    },
    {
      'imagePath': 'assets/images/vegetable8.png',
      'title': 'Pumpkin',
      'rating': '4.9',
      'ratingCount': '120'
    },
    {
      'imagePath': 'assets/images/vegetable10.png',
      'title': 'Celery',
      'rating': '4.0',
      'ratingCount': '68'
    }
  ];

  @override
  void initState() {
    super.initState();
    _getProductList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: AspectRatio(
                        aspectRatio: 1 / 1,
                        child: Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: SizedBox(
                            width: 40,
                            height: 40,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: SizedBox(
                                child: Image.asset(
                                  "assets/images/rukon.jpg",
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Expanded(
                      flex: 5,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hey, Rukon",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text("Today's fresh vegetables"),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.notifications_none,
                          color: Colors.black,
                        ),
                        iconSize: 30,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    flex: 8,
                    child: Card(
                      color: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(
                            color: Colors.grey.shade200,
                          )),
                      child: const TextField(
                        decoration: InputDecoration(
                          icon: Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Icon(
                              Icons.search,
                            ),
                          ),
                          iconColor: Colors.grey,
                          prefixStyle: TextStyle(color: Colors.black),
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.w400),
                          hintText: 'Find your favorite food...',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                          color: Colors.grey.shade200,
                        ),
                      ),
                      color: Colors.white,
                      child: const SizedBox(
                        height: 45,
                        child: Icon(Icons.filter_alt_outlined),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Most rated',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'View All',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.deepOrange,
                                ),
                              ),
                              Icon(
                                Icons.chevron_right,
                                color: Colors.deepOrange,
                              )
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 180,
                        width: double.maxFinite,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: mostRatedProductList.length,
                          itemBuilder: (context, index) {
                            return ProductItem(mostRatedProductList: mostRatedProductList[index ]);
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Recommended for you',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'View All',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.deepOrange,
                                ),
                              ),
                              Icon(
                                Icons.chevron_right,
                                color: Colors.deepOrange,
                              )
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 180,
                        width: double.maxFinite,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: vegetableList.length,
                          itemBuilder: (context, index) {
                            return SizedBox(
                              width: 150,
                              height: 120,
                              child: Card(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                shadowColor: Colors.deepOrange,
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Color.fromRGBO(
                                                  248, 239, 235, 1),
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          width: 120,
                                          height: 120,
                                          child: Stack(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(5),
                                                child: Image.asset(
                                                  width: 100,
                                                  height: 100,
                                                  vegetableList[index]
                                                      ['imagePath']!,
                                                ),
                                              ),
                                              Positioned(
                                                top: 0,
                                                right: 0,
                                                child: CircleAvatar(
                                                  radius: 18,
                                                  backgroundColor:
                                                      Colors.grey.shade400,
                                                  child: IconButton(
                                                    onPressed: () {},
                                                    icon: const Icon(
                                                      Icons.favorite,
                                                      color: Colors.white,
                                                      size: 18,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8),
                                        child: Text(
                                          vegetableList[index]['title']!,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8),
                                        child: Row(
                                          children: [
                                            const Text('Details  '),
                                            Text(
                                              vegetableList[index]['rating']!,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const Icon(
                                              Icons.star,
                                              color: Colors.deepOrange,
                                              size: 15,
                                            ),
                                            Text(
                                                '(${vegetableList[index]['ratingCount']!})'),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Healthy foods',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'View All',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.deepOrange,
                                ),
                              ),
                              Icon(
                                Icons.chevron_right,
                                color: Colors.deepOrange,
                              )
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 180,
                        width: double.maxFinite,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: vegetableList.length,
                          itemBuilder: (context, index) {
                            return SizedBox(
                              width: 150,
                              height: 120,
                              child: Card(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                shadowColor: Colors.deepOrange,
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Color.fromRGBO(
                                                  247, 249, 236, 1),
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          width: 120,
                                          height: 120,
                                          child: Stack(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(5),
                                                child: Image.asset(
                                                  width: 100,
                                                  height: 100,
                                                  healthyFoodsList[index]
                                                      ['imagePath']!,
                                                ),
                                              ),
                                              Positioned(
                                                top: 0,
                                                right: 0,
                                                child: CircleAvatar(
                                                  radius: 18,
                                                  backgroundColor:
                                                      Colors.deepOrange,
                                                  child: IconButton(
                                                    onPressed: () {},
                                                    icon: const Icon(
                                                      Icons.favorite,
                                                      color: Colors.white,
                                                      size: 18,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8),
                                        child: Text(
                                          healthyFoodsList[index]['title']!,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8),
                                        child: Row(
                                          children: [
                                            const Text('Details  '),
                                            Text(
                                              healthyFoodsList[index]
                                                  ['rating']!,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const Icon(
                                              Icons.star,
                                              color: Colors.deepOrange,
                                              size: 15,
                                            ),
                                            Text(
                                                '(${healthyFoodsList[index]['ratingCount']!})'),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.restaurant), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.chat_sharp), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onTap: (int index) {
          if (index == 0) {
            bottomIndex = 0;
            setState(() {});
          }
          if (index == 1) {
            bottomIndex = 1;
            setState(() {});
          }
          if (index == 2) {
            bottomIndex = 2;
            setState(() {});
          }
          if (index == 3) {
            bottomIndex = 3;
            setState(() {});
          }
          if (index == 4) {
            bottomIndex = 4;
            setState(() {});
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        onPressed: () {
          bottomIndex = 2;
          setState(() {});
        },
        backgroundColor: Colors.deepOrange,
        child: Icon(
          Icons.shopping_cart_outlined,
          color: Colors.white,
          size: 30,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Future<void> _getProductList() async {
    Uri uri = Uri.parse('https://mohasagor.com.bd/api/reseller/product');

    Map<String, String> headers = {
      'api-key': 'dFGU2ugUcsVjBTkZ',
      'secret-key':
          'e0b0bb5e6c3d2fb8b668694c74af6aa725038a49afc55b1cd67d8ed3c82bc88c',
    };

    Response response = await get(uri, headers: headers);

    print(response.statusCode);

    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body);

      for (Map<String, dynamic> p in decodedData['products']) {
        Product product = Product(
          p['id'],
          p['name'],
          p['product_code'],
          p['category'],
          p['thumbnail_img'],
          p['slug'],
          p['price'],
          p['sale_price'],
          p['details'],
          p['status'],
        );
        mostRatedProductList.add(product);
        setState(() {});
      }
    }
  }
}
