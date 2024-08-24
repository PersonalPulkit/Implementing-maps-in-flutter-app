import 'package:flutter/material.dart';

class Feeds extends StatefulWidget {
  const Feeds({super.key});

  @override
  State<Feeds> createState() => _FeedsState();
}

class _FeedsState extends State<Feeds> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feeds'),
      ),
      body: ListView.separated(
          itemCount: 10,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Image.network(
                'https://media.istockphoto.com/id/1339466666/vector/breaking-news.jpg?s=612x612&w=0&k=20&c=miuVhN91dJNC5xonwQrSndDTlFGdGrYz866M422cmBQ=',
              ),
              title: Text('Tittle'),
              subtitle: Text('Sub Tittle sgknaksg asgnfakd  agndkfngd hafsndhadfhndlfa afngndsk g '),
              isThreeLine: true,
              trailing: Text('Date and Time'),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(width: 2,
                  style: BorderStyle.solid,
                ),
              ),
              minVerticalPadding: 30,
            );
          }, separatorBuilder: (BuildContext context, int index) { return Divider(height: 25,thickness: 0,); },),
    );
  }
}
