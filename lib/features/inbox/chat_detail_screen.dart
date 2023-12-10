import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mynote/constants/gaps.dart';
import 'package:mynote/constants/sizes.dart';

class ChatDetailScreen extends StatefulWidget {
  const ChatDetailScreen({super.key});

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  bool _isWritting = false;

  final TextEditingController _textEditingController = TextEditingController();
  void _onStartTap() {
    print("input");
    setState(() {
      _isWritting = true;
    });
  }

  void _onKeyboardDismissed() {
    FocusScope.of(context).unfocus();
    setState(() {
      _isWritting = false;
    });
  }

  void _onClearText() {
    print("clear text");
    _textEditingController.clear();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const ListTile(
          contentPadding: EdgeInsets.zero,
          horizontalTitleGap: Sizes.size8,
          leading: CircleAvatar(
            radius: Sizes.size24,
            foregroundImage: NetworkImage(
                "https://avatars.githubusercontent.com/u/16436404?s=400&u=9f0093f6daa7368893efed2058ef043951d1ade2&v=4"),
          ),
          title: Text("MIN"),
          subtitle: Text("Active Row"),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(
                FontAwesomeIcons.flag,
                color: Colors.black,
                size: Sizes.size20,
              ),
              Gaps.h32,
              FaIcon(
                FontAwesomeIcons.ellipsis,
                color: Colors.black,
                size: Sizes.size20,
              ),
            ],
          ),
        ),
      ),
      body: GestureDetector(
        onTap: _onKeyboardDismissed,
        child: Stack(
          children: [
            ListView.separated(
              itemBuilder: (context, index) {
                final bool isMine = index % 2 == 0;
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment:
                      isMine ? MainAxisAlignment.end : MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Sizes.size10,
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(
                          Sizes.size14,
                        ),
                        decoration: BoxDecoration(
                          color: isMine
                              ? Theme.of(context).primaryColor
                              : Colors.red,
                          borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(
                              Sizes.size20,
                            ),
                            topRight: const Radius.circular(
                              Sizes.size20,
                            ),
                            bottomLeft: isMine
                                ? const Radius.circular(
                                    Sizes.size20,
                                  )
                                : Radius.zero,
                            bottomRight: isMine
                                ? Radius.zero
                                : const Radius.circular(
                                    Sizes.size20,
                                  ),
                          ),
                        ),
                        child: const Text(
                          "This is a message!",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: Sizes.size16,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) => Gaps.v10,
              itemCount: 20,
            ),
            Positioned(
              bottom: 0,
              width: MediaQuery.of(context).size.width,
              child: BottomAppBar(
                color: Colors.grey.shade100,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: Sizes.size20,
                    right: Sizes.size20,
                    top: Sizes.size10,
                    bottom: Sizes.size20,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: Sizes.size44,
                          child: TextField(
                            controller: _textEditingController,
                            onTap: _onStartTap,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Send a message...",
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: Sizes.size16,
                              ),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    Sizes.size20,
                                  ),
                                ),
                              ),
                              suffixIcon: Padding(
                                padding: const EdgeInsets.all(Sizes.size10),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.faceSmile,
                                      color: Colors.grey.shade600,
                                      size: Sizes.size20,
                                    ),
                                    if (_isWritting)
                                      Row(
                                        children: [
                                          Gaps.h8,
                                          GestureDetector(
                                            onTap: _onClearText,
                                            child: FaIcon(
                                              FontAwesomeIcons.solidCircleXmark,
                                              color: Colors.grey.shade600,
                                              size: Sizes.size20,
                                            ),
                                          ),
                                        ],
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Gaps.h10,
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade400,
                          borderRadius: BorderRadius.circular(Sizes.size20),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(Sizes.size10),
                          child: FaIcon(
                            FontAwesomeIcons.solidPaperPlane,
                            color: Colors.white,
                            size: Sizes.size18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
