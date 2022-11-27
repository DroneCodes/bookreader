import 'package:bookreader/widgets/description_page.dart';
import 'package:flutter/cupertino.dart';

class PopularNow extends StatelessWidget {
  final String name;
  final String author;
  final String imageUrl;
  final String description;
  final int price;
  final int quantity;

  const PopularNow(
      {Key? key,
      required this.name,
      required this.author,
      required this.imageUrl,
      required this.description,
      this.price = 20,
      this.quantity = 6})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: GestureDetector(
        onTap: () {
          Navigator.pop(
              context,
              CupertinoPageRoute(
                builder: (context) => DescriptionPage(
                    title: name,
                    author: author,
                    description: description,
                    imageUrl: imageUrl,
                    price: price,
                    quantity: quantity),
              ));
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: CupertinoColors.white,
          ),
          width: 150,
          height: 200,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: CupertinoColors.lightBackgroundGray.withOpacity(0.6),
                ),
                child: SizedBox(
                    height: 130, width: 150, child: Image.asset(imageUrl)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                              color: CupertinoColors.black,
                              fontWeight: FontWeight.normal),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "By $author",
                          style: const TextStyle(
                              color: CupertinoColors.inactiveGray),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Icon(CupertinoIcons.bookmark)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
