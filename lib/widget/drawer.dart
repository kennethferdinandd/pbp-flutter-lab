import 'package:counter_7/page/form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import '../page/page_watch_list.dart';

class DrawerClass extends StatelessWidget{
  DrawerClass(this.currentPage);
  final String currentPage;

  @override
  Widget build(BuildContext context){

    return Drawer(
      child: Column(
        children: [
          SizedBox(height: 10.0,),
          // Adding clickable menu
          ListTile(
            title: const Text('counter_7'),
            onTap: () {
              Navigator.of(context).pop();
              if(this.currentPage == 'counter_7') return;

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyHomePage()),
              );
            },
          ),
          ListTile(
            title: const Text('Add Budget'),
            onTap: () {
              // Routing the menu to the form page
              Navigator.of(context).pop();
              if(this.currentPage == 'Add Budget Info') return;

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) =>  AddBudgetPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Data Budget'),
            onTap: () {
              // Routing the menu to the form page
              Navigator.of(context).pop();
              if(this.currentPage == 'Data Budget') return;

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) =>  BudgetDataPage(list: AddBudgetPage.listData)),
              );
            },
          ),
          ListTile(
            title: const Text('Watch List'),
            onTap: (){
              Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const PageWatchList())
              );},
          )
        ],
      ),

    );
  }
}


