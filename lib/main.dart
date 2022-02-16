import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './models/items.dart';
import 'package:readmore/readmore.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travel App',
      theme: ThemeData(
        fontFamily: "Poppins",
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          bodyText1: const TextStyle(
            color: Colors.black,
            fontSize: 12,
          ),
          headline1: const TextStyle(
              color: Colors.white, fontSize: 26, fontWeight: FontWeight.w500),
          headline2: const TextStyle(
            color: Colors.black,
            fontSize: 14,
          ),
          headline3: const TextStyle(
            color: Colors.black,
            fontSize: 30,
          ),
          headline4: const TextStyle(
              color: Color.fromARGB(255, 64, 63, 66), fontSize: 15),
          headline5: TextStyle(
              color: Colors.blue.shade400,
              fontSize: 19,
              fontWeight: FontWeight.bold),
        ),
      ),
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  List<Item> items = [
    Item(
        name: "iran",
        location: "Tabriz, sharstan malekan",
        distance: 22,
        temp: 7,
        rating: 9.8,
        price: 3450,
        url: "assets/images/iran.jpg",
        description:
            "Jeff Bezos founded Amazon from his garage in Bellevue, Washington,[12] on July 5, 1994. Initially an online marketplace for books, it has expanded into a multitude of product categories: a strategy that has earned it the moniker The Everything Store.[13]"),
    Item(
        name: "jakob",
        location: "Los Angels, america",
        distance: 12,
        temp: 19,
        rating: 7.6,
        price: 2400,
        url: "assets/images/jakob.jpg",
        description:
            "This is the shortest of the three routes, but certainly not any less interesting. The North Wales Way leads you in 120 km from Abergwyngregyn to the beautiful island of Anglesey"),
    Item(
        name: "jordan",
        location: "Paris, city of desert",
        distance: 8,
        temp: 13,
        rating: 9.1,
        price: 2567,
        url: "assets/images/jordan.jpg",
        description:
            "Iran is home to one of the world's oldest civilizations,[13][14] beginning with the formation of the Elamite kingdoms in the fourth millennium BC. It was first unified by the Iranian Medes in the seventh century BC,[15] and reached its territorial height in"),
    Item(
        name: "valentain",
        location: "Germany, north of barlin",
        distance: 2,
        temp: 5,
        rating: 4.6,
        price: 1900,
        url: "assets/images/valentain.jpg",
        description:
            "A loanword is distinguished from a calque (or loan translation), which is a word or phrase whose meaning or idiom is adopted from another language by word-for-word translation into existing words or word-forming roots of the recipient language.[2] "),
  ];

  String name = "jordan";
  String location = "Paris, city of desert";
  int distance = 8;
  int temp = 13;
  double rating = 9.8;
  double price = 2567;
  String url = "assets/images/jordan.jpg";
  String description =
      "Iran is home to one of the world's oldest civilizations,[13][14] beginning with the formation of the Elamite kingdoms in the fourth millennium BC. It was first unified by the Iranian Medes in the seventh century BC,[15] and reached its territorial height in";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: 480,
                    width: 440,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        url,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    height: 80,
                  )
                ],
              ),
              Positioned(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppBarItem(CupertinoIcons.back, false),
                        AppBarItem(CupertinoIcons.heart_fill, false)
                      ]),
                ),
                top: MediaQuery.of(context).padding.top,
                left: 0,
                right: 0,
              ),
              Positioned(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Icon(
                          CupertinoIcons.location,
                          color: Colors.white,
                          size: 15,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          location,
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(fontSize: 16),
                        )
                      ],
                    ),
                  ],
                ),
                bottom: 120,
                left: 50,
              ),
              Positioned(
                child: Container(
                  height: 400,
                  width: 80,
                  child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              url = items[index].url;
                              name = items[index].name;
                              location = items[index].location;
                              description = items[index].description;
                              price = items[index].price;
                              temp = items[index].temp;
                              rating = items[index].rating;
                              distance = items[index].distance;
                            });
                          },
                          child: name == items[index].name
                              ? Container(
                                  height: 90,
                                  width: 90,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                          color: Colors.green.shade300, width: 7)),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        items[index].url,
                                        fit: BoxFit.cover,
                                      )),
                                )
                              : Container(
                                  height: 75,
                                  width: 75,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                          color: Colors.white, width: 6)),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        items[index].url,
                                        fit: BoxFit.cover,
                                      )),
                                ),
                        );
                      },
                      separatorBuilder: (_, index) => SizedBox(
                            height: 20,
                          ),
                      itemCount: items.length),
                ),
                right: 30,
                top: 150,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DescriptinContainer("$distance KM","Distance"),
                    DescriptinContainer("$temp° C","Temp"),
                    DescriptinContainer("$rating","Rating")
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Description(description),
                SizedBox(
                  height: 70,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Total Price",
                          style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 18,
                              color: Colors.black.withOpacity(0.5)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "\$$price",
                          style: Theme.of(context).textTheme.headline3,
                        )
                      ],
                    ),
                    Container(
                      height: 85,
                      width: 86,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.black),
                      child: Icon(
                        CupertinoIcons.forward,
                        color: Colors.white,
                        size: 40,
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class AppBarItem extends StatefulWidget {
  IconData _icon;
  bool _clik;
  AppBarItem(this._icon, this._clik);

  @override
  State<AppBarItem> createState() => _AppBarItemState();
}

class _AppBarItemState extends State<AppBarItem> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          widget._clik = !widget._clik;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Icon(
          widget._icon,
          color: widget._clik == false ? Colors.black : Colors.red,
        ),
      ),
      style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          shape: MaterialStateProperty.all(CircleBorder()),
          backgroundColor: MaterialStateProperty.all(Colors.white54)),
    );
  }
}

class Description extends StatelessWidget {
  String dis;
  Description(this.dis);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Description",
          style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 14),
        ),
        SizedBox(
          height: 5,
        ),
        ReadMoreText(
          dis,
          trimLength: 130,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 11),
        )
      ],
    );
  }
}

class DescriptinContainer extends StatelessWidget {
  String distance;
  String data;
  DescriptinContainer(this.distance,this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 87,
      width: 85,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Colors.grey, width: 1.5)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: Column(
          children: [
            Text(
              data,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              distance,
              style: Theme.of(context).textTheme.headline5,
            )
          ],
        ),
      ),
    );
  }
}
