/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-20 14:44:55 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-04-21 17:24:09
 */
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:implicitly_animated_reorderable_list/implicitly_animated_reorderable_list.dart';
import 'package:implicitly_animated_reorderable_list/transitions.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:positioncollect/generated/l10n.dart';
import 'package:positioncollect/src/blocs/map/map_bloc.dart';
import 'package:positioncollect/src/models/etablissements_model/datum.dart';
import 'package:positioncollect/src/utils/colors.dart';
import 'package:positioncollect/src/utils/config.dart';
import 'package:positioncollect/src/widgets/mapbox.dart';

Widget buildFloatingSearchBar(
    BuildContext context, MapBloc? mapBloc, String style, Position position) {
  final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

  return BlocBuilder<MapBloc, MapState>(
    builder: (context, state) {
      return FloatingSearchBar(
        backgroundColor: Theme.of(context).backgroundColor,
        hint: S.of(context).search,
        hintStyle: Theme.of(context).textTheme.bodyText1,
        queryStyle: Theme.of(context).textTheme.bodyText1,
        elevation: 80,
        iconColor: Theme.of(context).backgroundColor == whiteColor
            ? blackColor
            : whiteColor,
        clearQueryOnClose: true,
        debounceDelay: const Duration(milliseconds: 500),
        progress: state is SearchLoading ? true : false,
        scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
        transitionDuration: const Duration(milliseconds: 800),
        transitionCurve: Curves.easeInOut,
        physics: const BouncingScrollPhysics(),
        axisAlignment: isPortrait ? 0.0 : -1.0,
        openAxisAlignment: 0.0,
        width: isPortrait ? 600 : 500,
        onQueryChanged: (query) {
          if (query.length > 3) {
            mapBloc?.add(SearchEtablissements(query));
          }
        },
        body: buildMapBoxMap(style, mapBloc, position),
        transition: CircularFloatingSearchBarTransition(),
        actions: [
          FloatingSearchBarAction(
            showIfOpened: false,
            child: CircularButton(
              icon: Icon(Icons.mic,
                  color: Theme.of(context).backgroundColor == whiteColor
                      ? blackColor
                      : whiteColor),
              onPressed: () {},
            ),
          ),
          FloatingSearchBarAction.searchToClear(
            showIfClosed: false,
          ),
        ],
        builder: (context, transition) {
          if (state is SearchComplete) {
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Material(
                elevation: 80,
                color: Theme.of(context).backgroundColor,
                borderRadius: BorderRadius.circular(8),
                clipBehavior: Clip.antiAlias,
                child: state.etablissements!.isNotEmpty
                    ? ImplicitlyAnimatedList<Datum>(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        items: state.etablissements!,
                        insertDuration: const Duration(milliseconds: 700),
                        itemBuilder: (context, animation, item, i) {
                          return SizeFadeTransition(
                            animation: animation,
                            child: buildItem(context, item, state, mapBloc!),
                          );
                        },
                        updateItemBuilder: (context, animation, item) {
                          return FadeTransition(
                            opacity: animation,
                            child: buildItem(context, item, state, mapBloc!),
                          );
                        },
                        areItemsTheSame: (a, b) => a == b,
                      )
                    : Center(
                        heightFactor: 3,
                        child: Text(S.of(context).noData),
                      ),
              ),
            );
          }
          return Container();
        },
      );
    },
  );
}

Widget buildItem(BuildContext context, Datum etablissement,
    SearchComplete state, MapBloc mapBloc) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      InkWell(
        onTap: () {
          mapBloc.add(ZoomInSearchResult(etablissement.batiment!.longitude,
              etablissement.batiment!.latitude));
          FloatingSearchBar.of(context)?.close();
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              SizedBox(
                width: 36,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: etablissement.sousCategories!.isNotEmpty
                      ? SvgPicture.network(
                          Configs.apiUrl +
                              etablissement
                                  .sousCategories![0].categorie!.logourl!,
                        )
                      : const Icon(
                          Icons.place,
                          color: greyColor,
                        ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      etablissement.nom!,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      etablissement.sousCategories!.isNotEmpty
                          ? etablissement.sousCategories![0].nom! +
                              "," +
                              etablissement.sousCategories![0].categorie!.nom!
                          : "",
                      style: const TextStyle(
                              fontStyle: FontStyle.italic, fontSize: 14)
                          .copyWith(color: Colors.grey.shade600),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
