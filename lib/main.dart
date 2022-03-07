import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_whatsapp/calls.dart';
import 'package:flutter_whatsapp/camera.dart';
import 'package:flutter_whatsapp/chats.dart';
import 'package:flutter_whatsapp/status.dart';
import 'package:flutter_whatsapp/themes.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: kTealGreenColor,
    )
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kTealGreenColor,
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: kTealGreenColor),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    _tabController.index = 1;
    _tabController.addListener(() {
      setState(() {
        fab();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: kWhiteColor,
          body: body(context),
          floatingActionButton: fab(),
        ),
      ),
    );
  }

  Widget appBar(BuildContext context, bool innerBoxIsScrolled) {
    double width = MediaQuery.of(context).size.width;

    return SliverAppBar(
      backgroundColor: kTealGreenColor,
      title: const Text('WhatsApp'),
      pinned: true,
      floating: true,
      forceElevated: innerBoxIsScrolled,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search_rounded),
        ),
        PopupMenuButton(
          tooltip: 'More options',
          itemBuilder: (BuildContext context) => popUpMenu(),
        ),
      ],
      bottom: TabBar(
        indicatorColor: kWhiteColor,
        labelStyle: TextStyle(fontWeight: bold),
        isScrollable: true,
        controller: _tabController,
        tabs: [
          const SizedBox(
            width: 20,
            child: Tab(icon: Icon(Icons.camera_alt_rounded)),
          ),
          Tab(
            child: SizedBox(
              width: width * 0.2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Tab(text: 'CHATS'),
                  SizedBox(width: 7),
                  Tab(
                    icon: CircleAvatar(
                      backgroundColor: kWhiteColor,
                      child: Text('5', style: TextStyle(fontSize: 13)),
                      radius: 10,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Tab(
            child: SizedBox(
              width: width * 0.2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Tab(text: 'STATUS'),
                ],
              ),
            ),
          ),
          Tab(
            child: SizedBox(
              width: width * 0.2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Tab(text: 'CALLS'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<PopupMenuEntry> popUpMenu() {
    if (_tabController.index == 1) {
      return <PopupMenuEntry>[
        const PopupMenuItem(
          child: Text('New group')
        ),
        const PopupMenuItem(
          child: Text('New broadcast')
        ),
        const PopupMenuItem(
          child: Text('Linked devices')
        ),
        const PopupMenuItem(
          child: Text('Starred messages')
        ),
        const PopupMenuItem(
          child: Text('Settings')
        ),
      ];
    } else if (_tabController.index == 2) {
      return <PopupMenuEntry>[
        const PopupMenuItem(
          child: Text('Status privacy')
        ),
        const PopupMenuItem(
          child: Text('Settings')
        ),
      ];
    } else if (_tabController.index == 3) {
      return <PopupMenuEntry>[
        const PopupMenuItem(
          child: Text('Clear call log')
        ),
        const PopupMenuItem(
          child: Text('Settings')
        ),
      ];
    }
    return <PopupMenuEntry>[];
  }

  Widget body(BuildContext content) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          appBar(context, innerBoxIsScrolled),
        ];
      },
      body: TabBarView(
        controller: _tabController,
        children: const [
          Camera(),
          Chats(),
          Status(),
          Calls(),
        ]
      ),
    );
  }

  Widget fab() {
    if (_tabController.index == 1) {
      return FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.chat_rounded),
        backgroundColor: kTealGreenColor,
      );
    } else if (_tabController.index == 2) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            mini: true,
            onPressed: () {},
            child: const Icon(Icons.edit, color: Colors.black54),
            backgroundColor: kLightGreyColor,
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.camera_alt_rounded),
            backgroundColor: kTealGreenColor,
          ),
        ],
      );
    } else if (_tabController.index == 3) {
      return FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add_ic_call_rounded),
        backgroundColor: kTealGreenColor,
      );
    }
    return Container();
  }
}
