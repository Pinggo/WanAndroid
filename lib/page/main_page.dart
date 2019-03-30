import 'package:flutter/material.dart';
import 'home_page.dart';
import 'wx_page.dart';
import 'project_page.dart';

class MainPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPageWidget(),
    );
  }
}
class MainPageWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainPageState();
  }
}

const List<TabItem> tabItems = <TabItem>[
  const TabItem(title: '首页', icon: Icons.home),
  const TabItem(title: '项目', icon: Icons.assignment),
  const TabItem(title: '公众号', icon: Icons.people),
];

class TabItem {
  final String title;
  final IconData icon;

  const TabItem({this.title, this.icon});
}

class _MainPageState extends State<MainPageWidget> {
  PageController _controller;
  int _tabIndex;
  List<Widget> _pageList = <Widget>[
    HomePage(),
    ProjectPage(),
    WxPage(),
  ];
  @override
  void initState() {
    super.initState();
    _tabIndex = 0;
    _controller = PageController();
  }
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
  void _pageChange(int index){
    if(index!=_tabIndex){
      setState(() {
        _tabIndex = index;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
         physics: NeverScrollableScrollPhysics(),
          onPageChanged: _pageChange,
          controller: _controller,
          itemCount: _pageList.length,
          itemBuilder: (context,index){
           return _pageList[index];
          }
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: tabItems.map(
          (TabItem tabItem) {
            return BottomNavigationBarItem(
              icon: Icon(tabItem.icon),
              title: Text(tabItem.title),
            );
          },
        ).toList(),
        type: BottomNavigationBarType.fixed,
        currentIndex: _tabIndex,
        iconSize: 24,
        onTap: (index){
          _controller.jumpToPage(index);
        },
      ),
    );
  }
}
void main(){
  runApp(MainPage());
}
