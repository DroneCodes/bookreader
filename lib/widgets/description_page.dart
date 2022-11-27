import 'package:flutter/cupertino.dart';

class DescriptionPage extends StatelessWidget {
  final String title;
  final String author;
  final String description;
  final String imageUrl;
  final int price;
  final int quantity;
  const DescriptionPage(
      {Key? key,
      required this.title,
      required this.author,
      required this.description,
      required this.imageUrl,
      required this.price,
      required this.quantity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CupertinoPageScaffold(
      child: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Container(
                height: size.height * 0.7,
                decoration: BoxDecoration(
                  //color: CupertinoColors.systemGreen.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(25),
                  gradient: LinearGradient(colors: [
                    CupertinoColors.systemGreen.withOpacity(0.65),
                    CupertinoColors.activeGreen.withOpacity(0.65)
                  ], end: Alignment.bottomLeft, begin: Alignment.topRight),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 30,
                          decoration: BoxDecoration(
                            color: CupertinoColors.white,
                            borderRadius: BorderRadius.circular(60),
                          ),
                          child: const Icon(CupertinoIcons.chevron_back),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          height: 30,
                          decoration: BoxDecoration(
                            color: CupertinoColors.white,
                            borderRadius: BorderRadius.circular(60),
                          ),
                          child: const Icon(CupertinoIcons.bookmark),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 400,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: AssetImage(imageUrl),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Text(
                            title,
                            style: const TextStyle(
                                color: CupertinoColors.label,
                                fontWeight: FontWeight.bold),
                          ),
                          Center(
                            child: Text(
                              "By $author",
                              style: const TextStyle(
                                color: CupertinoColors.inactiveGray,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        "Description",
                        style: TextStyle(
                            color: CupertinoColors.label,
                            fontSize: 25,
                            fontWeight: FontWeight.normal),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        "\$$price",
                        style: const TextStyle(
                            color: CupertinoColors.systemGreen,
                            fontSize: 25,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    description,
                    style: const TextStyle(
                      color: CupertinoColors.inactiveGray,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Container(
                    width: size.width * 0.5,
                    height: 75,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: CupertinoColors.systemGreen.withOpacity(0.8),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "QTY",
                            style: TextStyle(
                                color: CupertinoColors.black.withOpacity(0.5)),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                            width: 1,
                            color: CupertinoColors.inactiveGray,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          GestureDetector(
                            child: const Icon(
                              CupertinoIcons.minus,
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            "$quantity",
                            style: TextStyle(
                              color: CupertinoColors.systemGreen.darkColor,
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          GestureDetector(
                            child: const Icon(
                              CupertinoIcons.add,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(
                    width: 8,
                  ),

                  GestureDetector(
                    child: Container(
                      width: size.width * 0.4,
                      height: 75,
                      decoration: BoxDecoration(
                        color: CupertinoColors.activeGreen.darkColor,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Align(
                        child: Text(
                          "Buy Now",
                          style: TextStyle(
                            color: CupertinoColors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
