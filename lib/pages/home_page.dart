import 'package:bookreader/widgets/popular_now_card.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: const [
          PopularNow(name: "Bol", author: "John", imageUrl: "assets/profile_image3.png", description: 'Hello Bitches fuck you',),
        ],
      ),
    );
  }
}
