import 'package:bookreader/pages/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  bool _isDrawerOpen = false;
  List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(label: 'Home', icon: Icon(CupertinoIcons.home)),
    const BottomNavigationBarItem(label: 'Reading', icon: Icon(CupertinoIcons.book)),
    const BottomNavigationBarItem(label: 'Explore', icon: Icon(CupertinoIcons.compass)),
    const BottomNavigationBarItem(label: 'Settings', icon: Icon(CupertinoIcons.settings)),
  ];
  List<String> titles = ["Home", "Reading", "Explore", "Settings",];
  List<Widget> contents = [const HomePage(), Column(), Column(), Column(),];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: 0.0,
          left: 0.0,
          right: 0.0,
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: CupertinoTabScaffold(
              tabBar: CupertinoTabBar(
                items: items,
              ),
              tabBuilder: (BuildContext context, int index) {
                return CupertinoTabView(
                  builder: (BuildContext context) {
                    return CupertinoPageScaffold(
                      navigationBar: CupertinoNavigationBar(
                        middle: Text(titles[index], style: TextStyle(color: CupertinoColors.label),),
                      ),
                      child: SafeArea(
                          child: Center(
                              child: Container(
                                  child: contents[index],
                              ))),
                    );
                  },
                );
              },
            ),
          ),
        ),
        Positioned(
          top: 30,
          left: -30.0,
          //right: 0.0,
          child: Container(
            width: 100,
            child: GestureDetector(
                onTap: () {
                  setState(() => _isDrawerOpen = true);
                },
                child: const Icon(Icons.menu, size: 30,)),
          ),
        ),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
          top: 0.0,
          bottom: 0.0,
          left: _isDrawerOpen
              ? 0.0
              : -(MediaQuery.of(context).size.width / 3) * 2,
          child: Container(
            width: (MediaQuery.of(context).size.width / 3) * 2,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 5.0,
                ),
              ],
            ),
            child: Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height -
                      (MediaQuery.of(context).size.height / 1.8 - 90.0) -
                      120.0,
                  color: Color(0xFFB42827),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 30.0,
                        left: 10.0,
                        child: GestureDetector(
                          onTap: () => setState(() => _isDrawerOpen = false),
                          child: const Icon(
                            CupertinoIcons.clear,
                            color: Colors.black,
                            size: 30.0,
                          ),
                        ),
                      ),
                      const Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding:
                          EdgeInsets.only(left: 50.0, bottom: 50.0),
                          child: UserInfo(
                            picture: "assets/profile_image2.png",
                            name: 'Ryan',
                            id: '0023-Ryan',
                            company: 'Universal Data Center',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 1.8 + 30.0,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 46.0, top: 46.0),
                      child: Column(
                        children: const <Widget>[
                          MenuItem(
                            icon: Icon(Icons.accessibility),
                            label: 'Message center',
                          ),
                          MenuItem(
                            icon: Icon(Icons.height),
                            label: 'Ticket research',
                          ),
                          MenuItem(
                            icon: Icon(Icons.event),
                            label: 'Suggestion',
                          ),
                          MenuItem(
                            icon: Icon(Icons.phone),
                            label: 'Contact us',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class MenuItem extends StatelessWidget {
  final Icon icon;
  final String label;

  const MenuItem({super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 42.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon.icon,
            color: const Color(0xFFB42827),
          ),
          const SizedBox(
            width: 8.0,
          ),
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  final String picture;
  final String name;
  final String id;
  final String company;

  const UserInfo({super.key,
    required this.picture,
    required this.name,
    required this.id,
    required this.company,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Card(
          margin: EdgeInsets.zero,
          elevation: 2.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: SizedBox(
            width: 80.0,
            height: 80.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset(picture),
            ),
          ),
        ),
        const SizedBox(
          height: 9.0,
        ),
        Row(
          children: <Widget>[
            Text(
              name,
              style: Theme.of(context)
                  .textTheme
                  .headline2
                  ?.copyWith(color: Colors.white),
            ),
            const SizedBox(
              width: 8.0,
            ),
            Container(
              width: 12.0,
              height: 12.0,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Icon(
                  CupertinoIcons.play_arrow_solid,
                  size: 8.0,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 6.0,
        ),
        Text(
          id,
          style: Theme.of(context)
              .textTheme
              .caption
              ?.copyWith(color: Colors.white.withOpacity(0.6)),
        ),
        const SizedBox(
          height: 6.0,
        ),
        Text(
          company,
          style: Theme.of(context)
              .textTheme
              .caption
              ?.copyWith(color: Colors.white.withOpacity(0.6)),
        )
      ],
    );
  }
}
