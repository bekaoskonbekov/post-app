
import 'package:flutter/material.dart';
import 'package:flutter_clean_arcitecture_post_app/feature/domain/entities/post_entity.dart';
import 'package:flutter_clean_arcitecture_post_app/feature/presentation/pages/add_detail_page.dart';

class PostListWidget extends StatelessWidget {
  final List<PostEntity> posts;
  const PostListWidget({Key? key, required this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return ListTile(
        leading: Text(posts[index].id.toString()),
        title: Text(posts[index].title,style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(posts[index].body,style: const TextStyle(fontSize: 16),),
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        onTap: (){
           
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => AddDetailPage(post: posts[index],)),
                  (route) => false);
        },
        );

      },
      separatorBuilder: (context,index)=>Divider()
    );
  }
}
