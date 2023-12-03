import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mynote/constants/gaps.dart';
import 'package:mynote/constants/sizes.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key, required this.goBack});

  final void Function(int) goBack;
  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen>
    with SingleTickerProviderStateMixin {
  final tabs = [
    "Top",
    "Users",
    "Videos",
    "Sounds",
    "LIVE",
    "Shopping",
    "Brands",
  ];

  bool _isWritting = false;

  final TextEditingController _textEditingController = TextEditingController();

  late TabController _tabController;
  void _onSearchChanged(String text) {
    print("_onSearchChanged:$text");
  }

  void _onSearchSumitted(String text) {
    print("_onSearchSumitted:$text");
  }

  void _onBodyTap() {
    FocusScope.of(context).unfocus();
    setState(() {
      _isWritting = true;
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        FocusScope.of(context).unfocus();
        setState(() {
          _isWritting = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  void _onStartTap() {
    print("stat");
    setState(() {
      _isWritting = true;
    });
  }

  void _onSearchClearTap() {
    print("clear");
    _textEditingController.clear();
  }

  void _onBackTap() {
    widget.goBack(0);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 1,
          title: Row(children: [
            GestureDetector(
              onTap: _onBackTap,
              child: const FaIcon(
                FontAwesomeIcons.angleLeft,
              ),
            ),
            Gaps.h20,
            Expanded(
              child: SizedBox(
                height: Sizes.size44,
                child: TextField(
                  onTap: _onStartTap,
                  controller: _textEditingController,
                  style: const TextStyle(
                    fontSize: Sizes.size16 + Sizes.size2,
                  ),
                  decoration: InputDecoration(
                    focusColor: Colors.red,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(Sizes.size4),
                      borderSide: BorderSide.none,
                    ),
                    hintText: "Search",
                    filled: true,
                    fillColor: Colors.grey.shade300,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: Sizes.size10,
                    ),
                    prefixIcon: const Padding(
                      padding: EdgeInsets.all(Sizes.size10),
                      child: FaIcon(
                        FontAwesomeIcons.magnifyingGlass,
                        color: Colors.black,
                      ),
                    ),
                    suffixIcon: _isWritting
                        ? Padding(
                            padding: const EdgeInsets.all(Sizes.size10),
                            child: GestureDetector(
                              onTap: _onSearchClearTap,
                              child: FaIcon(
                                FontAwesomeIcons.solidCircleXmark,
                                color: Colors.grey.shade600,
                                // size: Sizes.size24,
                              ),
                            ),
                          )
                        : null,
                  ),
                ),
              ),
            ),
            Gaps.h20,
            const FaIcon(FontAwesomeIcons.baby)
          ]),
          bottom: TabBar(
              controller: _tabController,
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
        body: GestureDetector(
          onTap: _onBodyTap,
          onPanStart: (details) {
            print("test");
          },
          child: TabBarView(controller: _tabController, children: [
            GridView.builder(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                padding: const EdgeInsets.all(
                  Sizes.size6,
                ),
                itemCount: 20,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: Sizes.size10,
                  mainAxisSpacing: Sizes.size10,
                  childAspectRatio: 9 / 21,
                ),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Sizes.size4)),
                        child: AspectRatio(
                          aspectRatio: 9 / 16,
                          child: FadeInImage.assetNetwork(
                            fit: BoxFit.cover,
                            placeholderFit: BoxFit.cover,
                            placeholder: "assets/images/tictok_placeholder.png",
                            image:
                                "https://images.unsplash.com/photo-1701114413455-875c598cd407?q=80&w=2959&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                          ),
                        ),
                      ),
                      Gaps.v10,
                      const Text(
                        "This is a long title. this is a long title. This is a long title. Oh My God. Very long.",
                        style: TextStyle(
                          fontSize: Sizes.size16 + Sizes.size2,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      Gaps.v8,
                      DefaultTextStyle(
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade600,
                        ),
                        child: Row(
                          children: [
                            const CircleAvatar(
                              radius: 12,
                              backgroundImage: NetworkImage(
                                  "https://avatars.githubusercontent.com/u/16436404?s=400&u=9f0093f6daa7368893efed2058ef043951d1ade2&v=4"),
                            ),
                            Gaps.h4,
                            const Expanded(
                              child: Text(
                                "This is a my name. Very long name",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Gaps.h4,
                            FaIcon(
                              FontAwesomeIcons.heart,
                              size: Sizes.size16,
                              color: Colors.grey.shade600,
                            ),
                            Gaps.h2,
                            const Text(
                              "2.5M",
                            ),
                          ],
                        ),
                      )
                    ],
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
      ),
    );
  }
}
