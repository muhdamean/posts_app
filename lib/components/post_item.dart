import 'package:flutter/material.dart';
import 'package:flutter_full_course/config/app_config.dart';
import 'package:flutter_full_course/data/model/post.dart';
import 'package:flutter_full_course/styles/app_text.dart';

class PostItem extends StatelessWidget {
  final Post post;
  const PostItem({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                'assets/temp/user1.png',
                width: 40,
                height: 40,
              ),
              const SizedBox(
                width: 16,
              ),
              Text(
                '${post.owner?.firstname} ${post.owner?.lastname}',
                style: AppText.subtitle3,
              ),
            ],
          ),
          if (post.image != null) ...[
            const SizedBox(
              height: 12,
            ),
            Image.network(
                '${AppConfig.baseUrl}${post.image}'), //Image.asset('assets/temp/post1.jpg'),
          ],
          const SizedBox(
            height: 12,
          ),
          Text(
            post.message ??
                '', //'The sun is a daily reminder that we too can shine our own light',
            style: AppText.subtitle3,
          )
        ],
      ),
    );
  }
}
