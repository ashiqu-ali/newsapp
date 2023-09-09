import 'package:flutter/material.dart';
import 'package:newsapp/model/model.dart';
import 'package:newsapp/newspage.dart';
import 'package:newsapp/services/api_services.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ApiServices client=ApiServices();
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text('News App'),
        centerTitle: true,
        actions: [
          Icon(Icons.logout_outlined),
          SizedBox(width: 8)
        ],
      ),
      body: FutureBuilder<List<Article>>(
        future: client.getArticle(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              shrinkWrap: true,
                itemCount: snapshot.data?.length,
                itemBuilder: (context,index){
                  var articles = snapshot.data![index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context, MaterialPageRoute(
                          builder: (context)=>News(
                            article : articles,
                          )
                      )
                      );
                    },
                    child: Container(
                      height: 229,
                      width: double.infinity,
                      // Wrap your image in a Stack
                      child: Stack(
                        children: [
                          // Background image
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(snapshot.data![index].urlToImage.toString()),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          // Gradient overlay
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Colors.transparent, Colors.black],
                                stops: [0.3, 1.0], // Adjust the stops to control the gradient height
                              ),
                            ),
                            height: 229, // Adjust this to match your image height
                          ),
                          // Text and other content
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                articles.title.toString(),
                                style: TextStyle(color: Colors.white, fontSize: 23),
                                textAlign: TextAlign.right,
                              ),
                              Text(articles.author.toString()),
                            ],
                          ),
                        ],
                      ),
                    ),

                  );
                }
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          // By default, show a loading spinner.
          return const CircularProgressIndicator();
        },
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 60,
        color: Colors.yellow,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Icon(Icons.home),
                    Text('Top Stories')
                  ],
                ),
              ),
              Expanded(
                  child: Column(
                    children: [
                      Icon(Icons.search),
                      Text('Search')
                    ],
                  )
              )

            ],
          ),
        ),
      ),

    );
  }

 /* Container buildContainer() {
    return  Container(
              height: 229,
              width: double.infinity,
              // color: Colors.blue,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage('assets/images/breaking.jpeg'),
                      fit: BoxFit.fill
                  )
              ),

    );
  }*/
}
