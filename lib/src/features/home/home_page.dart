import 'package:flutter/material.dart';

import 'home_controller.dart';
import 'widgets/widgets.dart';
import '../../shared/helpers/helpers.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeController _controller;

  @override
  void initState() {
    super.initState();
    _controller = HomeController();
    _controller.getAllPosts(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Posts',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
        if (_controller.state == AppStates.loading) {
          return ProgressIndicatorWidget();
        }

        if (_controller.state == AppStates.error) {
          return ErrorIndicatorWidget();
        }

        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 12.0),
          child: ListView.separated(
            itemBuilder: (context, index) {
              final post = _controller.posts[index];
              return ListTile(
                dense: true,
                visualDensity: VisualDensity.comfortable,
                contentPadding: const EdgeInsets.all(8.0),
                leading: CircleAvatar(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Center(
                      child: Text(post.id.toString()),
                    ),
                  ),
                ),
                title: Text(post.title.capitalize()),
              );
            },
            itemCount: _controller.posts.length,
            separatorBuilder: (context, index) {
              return Container(
                height: 2,
                color: Colors.grey[200],
              );
            },
          ),
        );
      }),
    );
  }
}
