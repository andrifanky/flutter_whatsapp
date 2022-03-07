import 'package:flutter/material.dart';
import 'package:flutter_whatsapp/themes.dart';

class Status extends StatelessWidget {
  const Status({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
    );
  }

  Widget body() {
    return ListView(
      padding: const EdgeInsets.only(top: defaultMargin, bottom: 130),
      children: [
        const StatusItem(sender: 'My Status', description: 'Tap to add status update', myStatus: true, viewed: false),
        ListTile(
          dense: true,
          title: Text('Recent updates',
            style: TextStyle(fontWeight: bold, fontSize: 15, color: kGreyColor)
          ),
        ),
        const StatusItem(sender: 'User 1', description: 'Today, 10:46 AM', myStatus: false, viewed: false),
        const StatusItem(sender: 'User 2', description: 'Today, 10:45 AM', myStatus: false, viewed: false),
        const StatusItem(sender: 'User 3', description: 'Yesterday, 9:40 AM', myStatus: false, viewed: false),
        ListTile(
          dense: true,
          title: Text('Viewed updates',
            style: TextStyle(fontWeight: bold, fontSize: 15, color: kGreyColor)
          ),
        ),
        const StatusItem(sender: 'User 4', description: '24 minutes ago', myStatus: false, viewed: true),
        const StatusItem(sender: 'User 5', description: 'Today, 8:45 AM', myStatus: false, viewed: true),
        const StatusItem(sender: 'User 6', description: 'Today, 8:40 AM', myStatus: false, viewed: true),
      ],
    );
  }
}

class StatusItem extends StatelessWidget {
  final String sender;
  final String description;
  final bool myStatus;
  final bool viewed;

  const StatusItem({
    Key? key,
    required this.sender,
    required this.description,
    required this.myStatus,
    required this.viewed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      leading: myStatus ?
        SizedBox(
          height: 55,
          width: 55,
          child: Stack(
            clipBehavior: Clip.none,
            fit: StackFit.expand,
            children: const [
              CircleAvatar(
                backgroundColor: kLightGreyColor,
                radius: 25,
                child: Icon(Icons.person, color: kWhiteColor, size: 30),
              ),
              Positioned(
                right: -4,
                bottom: 0,
                child: SizedBox(
                  height: 25,
                  width: 25,
                  child: CircleAvatar(
                    backgroundColor: kTealGreenColor,
                    child: Icon(Icons.add, color: kWhiteColor)
                  ),
                ),
              ),
            ],
          ),
        )
      :
      CircleAvatar(
        backgroundColor: viewed ? kGreyColor : kLightGreenColor,
        radius: 28,
        child: const CircleAvatar(
          backgroundColor: kLightGreyColor,
          radius: 25,
          child: Icon(Icons.person, color: kWhiteColor, size: 30),
        ),
      ),
      title: Text(sender, style: TextStyle(fontWeight: bold)),
      subtitle: Text(description, maxLines: 1, overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontSize: 15),
      ),
    );
  }
}
