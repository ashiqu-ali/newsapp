import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/model/model.dart';
import 'package:newsapp/services/api_services.dart';

class News extends StatelessWidget {
  Article article;
  News({required this.article});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(CupertinoIcons.back),
          onPressed: (){
              Navigator.pop(context);
          },
        ),
        actions: [
          TextButton.icon(
            onPressed: (){},
            icon: Icon(
              Icons.share,
              color: Colors.black,
            ),
            label: Text(
              'Share',
              style: TextStyle(color: Colors.black),
            ),
          ),
          ElevatedButton(
              onPressed: (){},
              child: Text('Remove Ads'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
              image: NetworkImage(article.urlToImage.toString()),
          ),
          SizedBox(height: 10),
          Text(
            article.source.toString(),
            style: TextStyle(
              fontSize: 17,

            ),

          ),
          SizedBox(height: 15,),
          Text(
            article.title.toString(),
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Date, Time',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.normal
            ),


          ),
          Divider(
            thickness: 2,
          ),
          TextButton.icon(
              onPressed: (){},
              icon: Icon(
                  Icons.share,
                color: Colors.blue,
              ),
            label: Text(
                'Share',
              style: TextStyle(color: Colors.blue),
            ),
          ),
          Divider(
            thickness: 2,
          ),
          Text(
            article.description.toString(),
            style: TextStyle(
              fontSize: 15
            ),


          )


        ],
      ),
    );
  }
}
