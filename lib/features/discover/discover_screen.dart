import 'package:flutter/material.dart';
import 'package:mynote/constants/sizes.dart';

class DiscoverScreen extends StatelessWidget {
  DiscoverScreen({super.key});

  final tabs = [
    "Top",
    "Users",
    "Videos",
    "Sounds",
    "LIVE",
    "Shopping",
    "Brands",
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          title: const Text("Discover"),
          bottom: TabBar(
              splashFactory: NoSplash.splashFactory,
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size16,
              ),
              isScrollable: true,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey.shade500,
              labelStyle: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: Sizes.size16,
              ),
              tabs: [
                for (var tab in tabs)
                  Tab(
                    text: tab,
                  )
              ]),
        ),
        body: TabBarView(children: [
          GridView.builder(
              padding: const EdgeInsets.all(
                Sizes.size6,
              ),
              itemCount: 20,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: Sizes.size10,
                mainAxisSpacing: Sizes.size10,
                childAspectRatio: 9 / 16,
              ),
              itemBuilder: (context, index) {
                return FadeInImage.assetNetwork(
                  placeholder: "assets/images/tictok_placeholder.png",
                  image:
                      "https://images.unsplash.com/photo-1701114413455-875c598cd407?q=80&w=2959&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                );
              }),
          for (var tab in tabs.skip(1))
            Center(
              child: Text(
                tab,
                style: const TextStyle(
                  fontSize: Sizes.size44,
                ),
              ),
            )
        ]),
      ),
    );
  }
}
