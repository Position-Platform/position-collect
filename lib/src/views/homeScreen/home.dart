import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:positioncollect/src/blocs/home/home_bloc.dart';
import 'package:positioncollect/src/models/user_model/user.dart';
import 'package:positioncollect/src/utils/colors.dart';
import 'package:positioncollect/src/utils/tools.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, this.user}) : super(key: key);
  final User? user;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(transparent);
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: Text(widget.user!.name!),
          ),
        );
      },
    );
  }
}
