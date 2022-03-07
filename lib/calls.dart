import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_whatsapp/themes.dart';

class Calls extends StatelessWidget {
  const Calls({ Key? key }) : super(key: key);

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
        CallItem(sender: 'User 1', description: '5 minutes ago', status: 'out', type: 'video'),
        CallItem(sender: 'User 1', description: 'February 20, 4:40 PM', status: 'out', type: 'audio'),
        CallItem(sender: 'User 2', description: 'February 16, 12:34 PM', status: 'in', type: 'audio'),
        CallItem(sender: '+62 802-0220-055', description: 'February 15, 8:00 AM', status: 'out', type: 'audio'),
      ],
    );
  }
}

class CallItem extends StatelessWidget {
  final String sender;
  final String description;
  final String status;
  final String type;

  const CallItem({
    Key? key,
    required this.sender,
    required this.description,
    required this.status,
    required this.type,
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
      title: Text(sender, style: TextStyle(fontWeight: bold)),
      subtitle: Row(
        children: [
          status == 'in' ?
          const Icon(CupertinoIcons.arrow_down_left, size: 18, color: kRedColor)
          : const Icon(CupertinoIcons.arrow_up_right, size: 18, color: kTealGreenColor),
          const SizedBox(width: 5),
          Text(description, maxLines: 1, overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 15),
          ),
        ],
      ),
      trailing: type == 'audio' ? const Icon(Icons.call_rounded, color: kTealGreenColor)
      : const Icon(Icons.videocam_rounded, color: kTealGreenColor),
    );
  }
}
