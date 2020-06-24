//import 'package:flutter/cupertino.dart'; //iOS style widgets
import 'package:flutter/material.dart';
// 従属画面
import 'routes/home_route.dart';
import 'routes/news_route.dart';
import 'routes/talk_route.dart';
import 'routes/timeline_route.dart';
import 'routes/wallet_route.dart';

class Footer extends StatefulWidget{
  //const Footer();
  Footer({Key key}):super(key:key);

  @override
  _Footer createState() => _Footer();
}

class _Footer extends State<Footer>
{
  int _selectedIndex = 0;
  final _bottomNavigationBarItems = <BottomNavigationBarItem>[];

  static const _footerIcons = [
    Icons.home,
    Icons.textsms,
    Icons.access_time,
    Icons.content_paste,
    Icons.work,
  ];
  static const _footerItemsNames = [
    'Home',
    'Talk',
    'Timeline',
    'News',
    'Wallet',
  ];
  var _routes = [
    Home(),
    Talk(),
    TimeLine(),
    News(),
    Wallet(),
  ];

  @override
  void initState(){
    super.initState();
    _bottomNavigationBarItems.add(_UpdateActiveState(0));
    for(var i = 1;i< _footerItemsNames.length;i++){
      _bottomNavigationBarItems.add(_UpdateDeactiveState(i));
    }
  }

  BottomNavigationBarItem _UpdateActiveState(int index){
    return BottomNavigationBarItem(
      icon:Icon(
        _footerIcons[index],
        color:Colors.black87,
      ),
      title:Text(
        _footerItemsNames[index],
        style:TextStyle(
          color:Colors.black87,
        )
      ),
    );
  }
  BottomNavigationBarItem _UpdateDeactiveState(int index){
    return BottomNavigationBarItem(
      icon:Icon(
        _footerIcons[index],
        color:Colors.black26,
      ),
      title:Text(
        _footerItemsNames[index],
        style:TextStyle(
          color:Colors.black26,
        )
      ),
    );
  }
  void _onItemTapped(int index){
    setState(() {
      _bottomNavigationBarItems[_selectedIndex] = _UpdateDeactiveState(_selectedIndex);
      _bottomNavigationBarItems[index] = _UpdateActiveState(index);
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body:_routes.elementAt(_selectedIndex),
      bottomNavigationBar:BottomNavigationBar(
          type:BottomNavigationBarType.fixed,
          items:_bottomNavigationBarItems,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
    );
  }
}