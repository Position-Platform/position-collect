/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-17 00:18:02 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-01-28 17:00:51
 */
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:positioncollect/generated/l10n.dart';
import 'package:positioncollect/src/blocs/home/home_bloc.dart';
import 'package:positioncollect/src/blocs/map/map_bloc.dart';
import 'package:positioncollect/src/di/di.dart';
import 'package:positioncollect/src/models/user_model/user.dart';
import 'package:positioncollect/src/utils/colors.dart';
import 'package:positioncollect/src/utils/tools.dart';
import 'package:positioncollect/src/views/mapScreen/mapPage.dart';
import 'package:positioncollect/src/widgets/errorWidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, this.user}) : super(key: key);
  final User? user;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc? _homeBloc;

  @override
  void initState() {
    super.initState();
    _homeBloc = BlocProvider.of<HomeBloc>(context);
    _homeBloc!.add(HomeGetLocation());
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(transparent);
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                backgroundColor: primaryColor,
                valueColor: AlwaysStoppedAnimation<Color>(accentPrimaryColor),
              ),
            ),
          );
        }
        if (state is HomeLocation) {
          return BlocProvider<MapBloc>(
            create: (context) => getIt<MapBloc>(),
            child: MapPage(
              position: state.position,
              user: widget.user,
            ),
          );
        }
        if (state is HomeError) {
          return errorWidget(context, S.of(context).serverError,
              () => _homeBloc!.add(HomeGetLocation()));
        }
        if (state is HomeNoInternet) {
          return errorWidget(context, S.of(context).noInternet,
              () => _homeBloc!.add(HomeGetLocation()));
        }
        return Container();
      },
    );
  }
}
