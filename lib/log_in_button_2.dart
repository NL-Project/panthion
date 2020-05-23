import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:panthion/AllMarks.dart';
import 'package:panthion/MarkButton.dart';
import 'package:panthion/NewMark.dart';
import 'package:panthion/home.dart';
import 'dart:core';
class Log extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple[300],
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
//              bottom: TabBar(controller: TabController(),tabs: <Widget>[Chip(backgroundColor: Colors.white, label: Text('Tech'),)]),
              actions: <Widget>[
                IconButton(
                    iconSize: 50,
                  icon: Icon(
                      Icons.plus_one,
                      color: Colors.white),
                  onPressed:() => Navigator.of(context).push(
                    PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: NewMark("New Mark","Write here..."),
                  )))
              ],
//              shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
              centerTitle: true,
//              title: Text('Привет!', style: Theme.of(context).textTheme.headline5),
              elevation: 30,
              backgroundColor: Colors.deepPurple[300],
              pinned: false,
              expandedHeight: 200.0,
              flexibleSpace: FlexibleSpaceBar(
                title: Text('Logs', style: TextStyle(fontSize: 24, color: Colors.white)),
              ),
            ),
            SliverFixedExtentList(
              itemExtent: 200.0,
              delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int total) {
                    return Container(
                        padding: EdgeInsets.only(top: 30),
                        child: Card(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                            elevation: 30,
                            color: Colors.white,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  ListTile(
                                    title: Text(
                                      '${logs[total][1].substring(0, 35)}...',
                                      style: Theme.of(context).textTheme.headline6)
                                  ),
                                  ButtonBar(
                                      alignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        FlatButton(
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                                          color: Colors.deepPurple[300],
                                          child: Text('Edit', style: TextStyle(fontSize: 20, color: Colors.white)),
                                          onPressed: () => Navigator.of(context).push(
                                            PageTransition(
                                                type: PageTransitionType.rightToLeft,
                                                child: OldMark("${logs[total][0]}", "${logs[total][1]}")
                                            ),
                                          ),
                                        )
                                      ]
                                  )
                                ]
                            )
                        ));
                  },
                  childCount: logs.length
              ),
            ),
          ],
        )
    );
  }
}