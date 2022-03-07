import 'package:flutter/material.dart';
import 'package:flutter_whatsapp/themes.dart';

class Chats extends StatelessWidget {
  const Chats({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
    );
  }

  Widget body() {
    return ListView(
      padding: const EdgeInsets.only(top: defaultMargin, bottom: 100),
      children: const [
        ChatItem(title: 'User 1', sender: '', message: 'Hi, how are you ?', time: '10:01 PM', mute: false, unread: 2),
        ChatItem(title: 'User 2', sender: '', message: 'Hi, how are you ?', time: '9:28 AM', mute: true, unread: 3),
        ChatItem(title: 'User 3', sender: '', message: 'Hi, how are you ?', time: '7:34 AM', mute: false, unread: 0),
        ChatItem(title: '', sender: '+62 802-0220-055', message: 'Hi, how are you ?', time: 'Yesterday', mute: true, unread: 0),
      ],
    );
  }
}

class ChatItem extends StatelessWidget {
  final String title;
  final String sender;
  final String message;
  final String time;
  final bool mute;
  final int unread;

  const ChatItem({
    Key? key,
    required this.title,
    required this.sender,
    required this.message,
    required this.time,
    required this.mute,
    required this.unread,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      leading: const CircleAvatar(
        backgroundColor: kLightGreyColor,
        radius: 25,
        child: Icon(Icons.person, color: kWhiteColor, size: 30),
      ),
      title: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: Row(
          children: [
            Text(title.isNotEmpty ? title : sender, style: TextStyle(fontWeight: bold)),
            const Spacer(),
            Text(time, style: const TextStyle(fontSize: 13)),
          ],
        ),
      ),
      subtitle: Row(
        children: [
          Text(message, maxLines: 1, overflow: TextOverflow.ellipsis),
          const Spacer(),
          mute ? const Icon(Icons.volume_off, color: kGreyColor) : Container(),
          mute && unread > 0 ? const SizedBox(width: 3) : Container(),
          unread > 9 ?
          Container(
            padding: const EdgeInsets.all(5),
            decoration: const BoxDecoration(
              color: kLightGreenColor,
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: Text(unread.toString(), style: TextStyle(fontSize: 13, color: kWhiteColor, fontWeight: semiBold)),
          ) :
          (unread > 0 ?
            CircleAvatar(
              backgroundColor: kLightGreenColor,
              child: Text(unread.toString(), style: const TextStyle(fontSize: 13, color: kWhiteColor)),
              radius: 10,
            ) : Container()
          ),
        ],
      ),
    );
  }
}
