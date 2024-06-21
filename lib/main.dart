import 'package:flutter/material.dart';
import 'package:project/release_model.dart';
import 'package:project/tabcontent.dart';
import 'package:provider/provider.dart';

import 'artist_model.dart';
import 'musicstate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) =>MusicState(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.black,
          textTheme: Theme
              .of(context)
              .textTheme
              .apply(
              bodyColor: Colors.white,
              displayColor: Colors.white

          ),
          useMaterial3: true,
        ),
        home: Home(),
      ),
    );
  }
}

// display ui design
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{
  late TabController _tabController;
  List<String> _tabs= ['relax','party','work out'];
  List<String> get tabs => _tabs;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: context.read<MusicState>().tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation:0,
        leading:
            CircleAvatar(
              backgroundColor: Colors.white30,
              child:Icon(Icons.person,color: Colors.white,),
            ),
        title:Center(child: Text('Hi, John')),
        actions: [CircleAvatar(
            backgroundColor: Colors.white30,
             child: IconButton(onPressed: (){}, icon: Icon(Icons.notifications_none)))],
        bottom: TabBar(
          controller: _tabController,
          tabs: tabs.map((tab) => Tab(text: tab)).toList(),
        ),
      ),

      body:TabBarView(
        controller: _tabController,
        children: tabs.map((tab) => TabContent()).toList(),
      ),

        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home, color:Colors.red), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search,color:Colors.red), label: 'Search'),
            BottomNavigationBarItem(icon: Icon(Icons.explore, color:Colors.red), label: 'Explore'),
            BottomNavigationBarItem(icon: Icon(Icons.library_music,color:Colors.red), label: 'My Music'),
          ],
        ),
    );
  }
}
