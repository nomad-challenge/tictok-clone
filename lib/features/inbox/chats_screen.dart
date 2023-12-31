import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mynote/constants/sizes.dart';
import 'package:mynote/features/inbox/chat_detail_screen.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  final GlobalKey<AnimatedListState> _key = GlobalKey<AnimatedListState>();
  final Duration _duration = const Duration(milliseconds: 300);

  final List<int> _list = [];
  void _addItem() {
    if (_key.currentState != null) {
      _key.currentState!.insertItem(
        _list.length,
        duration: _duration,
      );
      _list.add(_list.length);
    }
  }

  void _deleteItem(int index) {
    if (_key.currentState != null) {
      _key.currentState!.removeItem(
        index,
        (context, animation) => SizeTransition(
          sizeFactor: animation,
          child: Container(
            color: Colors.red,
            child: _makeTile(
              index,
            ),
          ),
        ),
        duration: _duration,
      );
      _list.removeAt(index);
    }
  }

  void _onChatTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ChatDetailScreen(),
      ),
    );
  }

  Widget _makeTile(int index) {
    return ListTile(
      onLongPress: () => _deleteItem(index),
      onTap: _onChatTap,
      leading: const CircleAvatar(
        radius: Sizes.size32,
        foregroundImage: NetworkImage(
            "https://avatars.githubusercontent.com/u/16436404?s=400&u=9f0093f6daa7368893efed2058ef043951d1ade2&v=4"),
        child: Text(
          "MIN",
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "AntonioBM ($index)",
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            "2:16 PM",
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: Sizes.size12,
            ),
          ),
        ],
      ),
      subtitle: const Text(
        "Say hi to AntonioBM",
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Direct messages"),
        elevation: 1,
        actions: [
          IconButton(
            onPressed: _addItem,
            icon: const FaIcon(FontAwesomeIcons.plus),
          ),
        ],
      ),
      body: AnimatedList(
        key: _key,
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size10,
        ),
        itemBuilder: (context, index, animation) {
          return FadeTransition(
            key: UniqueKey(),
            opacity: animation,
            child: SizeTransition(
              sizeFactor: animation,
              child: _makeTile(index),
            ),
          );
        },
      ),
    );
  }
}
