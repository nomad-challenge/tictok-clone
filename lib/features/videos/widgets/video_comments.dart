import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mynote/constants/gaps.dart';
import 'package:mynote/constants/sizes.dart';

class VideoComments extends StatefulWidget {
  const VideoComments({super.key});

  @override
  State<VideoComments> createState() => _VideoCommentsState();
}

class _VideoCommentsState extends State<VideoComments> {
  final ScrollController _scrollbarController = ScrollController();
  bool _isWritting = false;
  void _onClosePressed() {
    Navigator.of(context).pop();
  }

  void _onStopWriting() {
    FocusScope.of(context).unfocus();
    setState(() {
      _isWritting = false;
    });
  }

  void _onStarting() {
    setState(() {
      _isWritting = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.8,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.size14),
      ),
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade50,
          automaticallyImplyLeading: false,
          title: const Text("2334 comments"),
          actions: [
            IconButton(
              onPressed: _onClosePressed,
              icon: const FaIcon(FontAwesomeIcons.xmark),
            ),
          ],
        ),
        body: GestureDetector(
          onTap: _onStopWriting,
          child: Stack(
            children: [
              Scrollbar(
                controller: _scrollbarController,
                child: ListView.separated(
                  controller: _scrollbarController,
                  padding: const EdgeInsets.only(
                    top: Sizes.size10,
                    left: Sizes.size16,
                    bottom: Sizes.size96 + Sizes.size20,
                    right: Sizes.size16,
                  ),
                  itemCount: 10,
                  separatorBuilder: (context, index) => Gaps.v20,
                  itemBuilder: (context, index) => Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        radius: 18,
                        child: Text("min"),
                      ),
                      Gaps.h10,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "MIN",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: Sizes.size14,
                                color: Colors.grey.shade500,
                              ),
                            ),
                            Gaps.v3,
                            const Text(
                              "That's not is I've seen the same thing but also in a caveT",
                            )
                          ],
                        ),
                      ),
                      Gaps.h10,
                      Column(
                        children: [
                          FaIcon(
                            FontAwesomeIcons.heart,
                            size: Sizes.size20,
                            color: Colors.grey.shade500,
                          ),
                          Gaps.v3,
                          Text(
                            "52.3K",
                            style: TextStyle(
                              color: Colors.grey.shade500,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                  bottom: 0,
                  width: size.width,
                  child: BottomAppBar(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Sizes.size16,
                        vertical: Sizes.size10,
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 18,
                            backgroundColor: Colors.grey.shade500,
                            foregroundColor: Colors.white,
                            child: const Text("MIN"),
                          ),
                          Gaps.h10,
                          Expanded(
                            child: SizedBox(
                              height: Sizes.size44,
                              child: TextField(
                                onTap: _onStarting,
                                minLines: null,
                                maxLines: null,
                                expands: true,
                                textInputAction: TextInputAction.newline,
                                cursorColor: Theme.of(context).primaryColor,
                                decoration: InputDecoration(
                                    hintText: "Write a Comment...",
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(Sizes.size10),
                                      borderSide: BorderSide.none,
                                    ),
                                    filled: true,
                                    fillColor: Colors.grey.shade300,
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: Sizes.size10,
                                      // vertical: Sizes.size12,
                                    ),
                                    suffixIcon: Padding(
                                      padding: const EdgeInsets.only(
                                        right: Sizes.size14,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          FaIcon(
                                            FontAwesomeIcons.at,
                                            color: Colors.grey.shade900,
                                          ),
                                          Gaps.h8,
                                          FaIcon(
                                            FontAwesomeIcons.gift,
                                            color: Colors.grey.shade900,
                                          ),
                                          Gaps.h8,
                                          FaIcon(
                                            FontAwesomeIcons.faceSmile,
                                            color: Colors.grey.shade900,
                                          ),
                                          Gaps.h8,
                                          if (_isWritting)
                                            GestureDetector(
                                              onTap: _onStopWriting,
                                              child: FaIcon(
                                                FontAwesomeIcons.circleArrowUp,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                              ),
                                            )
                                        ],
                                      ),
                                    )),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
