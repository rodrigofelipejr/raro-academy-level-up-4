import 'package:flutter/material.dart';

class ErrorIndicatorWidget extends StatelessWidget {
  const ErrorIndicatorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.cancel,
            size: 42.0,
            color: Colors.red[400],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text('Erro ao carregar posts.'),
          ),
        ],
      ),
    );
  }
}
