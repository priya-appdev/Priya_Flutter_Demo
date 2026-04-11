import 'package:counter_app/Expanded.dart';
import 'package:flutter/material.dart';

class ListviewExample extends StatelessWidget {
  @override
  Widget build(BuildContext contexxt) {
    return Scaffold(
      appBar: AppBar(title: Text('Listview Example')),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'asset/images/logout.png',
                  width: 25,
                  height: 25,
                ),
              ),
              title: Text('Priya agrawal'),
              subtitle: Text('Developer'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  contexxt,
                  MaterialPageRoute(builder: (context) => ExpandedList()),
                );
              },
            ),
          ),
          SizedBox(height: 10),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'asset/images/logout.png',
                  width: 25,
                  height: 25,
                ),
              ),
              title: Text('Muskan agrawal'),
              subtitle: Text('Developer'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  contexxt,
                  MaterialPageRoute(builder: (contexxt) => ExpandedList()),
                );
              },
            ),
          ),

          Container(
            width: 200,
            child: ListTile(
              title: Text('Item1'),
              leading: Icon(Icons.person),
              subtitle: Text('Developer'),
            ),
          ),

          Divider(height: 1, color: Colors.green),
          Container(
            width: 200,
            child: ListTile(
              title: Text('Item1'),
              leading: Icon(Icons.person),
              subtitle: Text('Developer'),
            ),
          ),
          Divider(height: 1, color: Colors.green),
          Container(
            width: 200,
            child: ListTile(
              title: Text('Item1'),
              leading: Icon(Icons.person),
              subtitle: Text('Developer'),
            ),
          ),
          Divider(height: 1, color: Colors.green),
          Container(
            width: 200,
            child: ListTile(
              title: Text('Item1'),
              leading: Icon(Icons.person),
              subtitle: Text('Developer'),
            ),
          ),
          // SizedBox(
          //   width: 150,
          //   height: 150,
          //   child: ListTile(title: Text('data'), subtitle: Text('Hello world')),
          // ),
        ],
      ),
    );
  }
}
