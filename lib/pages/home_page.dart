import 'package:flutter/material.dart';
import 'package:posts_app/components/post_item.dart';
import 'package:posts_app/components/toolbar.dart';
import 'package:posts_app/config/app_icons.dart';
import 'package:posts_app/config/app_routes.dart';
import 'package:posts_app/config/app_strings.dart';
import 'package:posts_app/provider/post_provider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<PostProvider>().getPost();
  }

  //List<String> users = [];
  @override
  Widget build(BuildContext context) {
    // mockUsersFromServer();
    return Scaffold(
      appBar: Toolbar(
        title: AppStrings.appName,
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).pushNamed(AppRoutes.nearby),
            icon: SvgPicture.asset(AppIcons.icLocation),
          ),
        ],
      ),
      body: Consumer<PostProvider>(
        builder: (context, value, child) {
          return ListView.separated(
            itemBuilder: (context, index) {
              return PostItem(
                post: value.list[index],
              );
            },
            itemCount: value.list.length,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 24,
              );
            },
          );
        },
      ),
    );
  }
}
