import 'package:flutter/material.dart';
import 'package:repromedics_healthcare_app/services/http_service.dart';
import 'package:repromedics_healthcare_app/services/post_details.dart';
import 'package:repromedics_healthcare_app/services/post_model.dart';

class PostsPage extends StatelessWidget {
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
      ),
      body: FutureBuilder(
          future: httpService.getPosts(),
          builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
            if (snapshot.hasData) {
              List<Post>? posts = snapshot.data;
              

              return ListView(
                children: posts!
                .map((Post post) => ListTile(
                  title: Text(post.location),
                  subtitle: Text(post.name.toString(),),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => PostDetail(post: post,
                    ))
                  ),
                  ),
                  )
                .toList(),
              );
            }

            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
