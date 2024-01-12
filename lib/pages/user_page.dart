import 'package:flutter/material.dart';
import 'package:flutter_full_course/provider/app_repo.dart';
import 'package:provider/provider.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final scrollController = ScrollController();
  //final Post post;
  // final User? user=context.read<AppRepo>().user;
  @override
  void initState() {
    super.initState();
  // user=  context.read<AppRepo>().user;
    scrollController.addListener(() {
      setState(() {
        // Do something with the scroll position, like triggering a refresh.
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final user=context.read<AppRepo>().user;
    //inal post=ModalRoute.of(context)?.settings.arguments
    return Scaffold(
      // appBar: Toolbar(title: 'User Page'),
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: MyUserAdapter(
                offset:
                    scrollController.hasClients ? scrollController.offset : 0),
          ),
          // SliverAppBar(
          //   pinned: true,
          //   expandedHeight: 300,
          //   flexibleSpace: FlexibleSpaceBar(
          //     title: Text('User name'),
          //     background: Image.asset(
          //       'assets/temp/user1.png',
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          // ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Container(
                padding: const EdgeInsets.all(16),
                child: Text('Text is test post ${user?.firstname}'),
              ),
              childCount: 100,
            ),
          ),
        ],
      ),
    );
  }
}

class MyUserAdapter extends StatelessWidget {
  final double offset;
  var expanded = true;
  MyUserAdapter({super.key, required this.offset});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final progress = offset / width;
    expanded = progress < 0.04;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      //curve: Curves.bounceIn,
      width: double.infinity,
      height: width - (expanded ? 0 : width - 260),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            right: 0,
            left: 0,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: EdgeInsets.only(
                top: expanded ? 0 : MediaQuery.of(context).viewPadding.top + 24,
              ),
              alignment: expanded ? null : Alignment.center,
              width: expanded ? width : 180,
              height: expanded ? width : 180,
              child: Image.asset(
                'assets/temp/user1.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            left: 24,
            right: 24,
            bottom: 24,
            child: AnimatedAlign(
              duration: const Duration(milliseconds: 200),
              curve: Curves.fastOutSlowIn,
              alignment: expanded ? Alignment.centerLeft : Alignment.center,
              child: const Column(
                children: [
                  Text(
                    'User name',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 23,
                    ),
                  ),
                  Text('Canada'),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
