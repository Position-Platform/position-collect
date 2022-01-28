/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-20 14:44:55 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-01-28 07:31:21
 */
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:implicitly_animated_reorderable_list/implicitly_animated_reorderable_list.dart';
import 'package:implicitly_animated_reorderable_list/transitions.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:positioncollect/generated/l10n.dart';
import 'package:positioncollect/src/blocs/map/map_bloc.dart';
import 'package:positioncollect/src/models/search_model/datum.dart';
import 'package:positioncollect/src/utils/config.dart';
import 'package:positioncollect/src/widgets/mapbox.dart';

Widget buildFloatingSearchBar(
    BuildContext context, MapBloc? mapBloc, String style, Position position) {
  final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

  return BlocBuilder<MapBloc, MapState>(
    builder: (context, state) {
      return FloatingSearchBar(
        hint: S.of(context).search,
        elevation: 80,
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
              icon: const Icon(Icons.mic),
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
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                clipBehavior: Clip.antiAlias,
                child: ImplicitlyAnimatedList<Datum>(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  items: state.etablissements!,
                  insertDuration: const Duration(milliseconds: 700),
                  itemBuilder: (context, animation, item, i) {
                    return SizeFadeTransition(
                      animation: animation,
                      child: buildItem(context, item, state),
                    );
                  },
                  updateItemBuilder: (context, animation, item) {
                    return FadeTransition(
                      opacity: animation,
                      child: buildItem(context, item, state),
                    );
                  },
                  areItemsTheSame: (a, b) => a == b,
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

Widget buildItem(
    BuildContext context, Datum etablissement, SearchComplete state) {
  final theme = Theme.of(context);
  final textTheme = theme.textTheme;

  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      InkWell(
        onTap: () {
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
                      ? Image.network(
                          apiUrl +
                              etablissement
                                  .sousCategories![0].categorie!.logoUrl!,
                        )
                      : const Icon(Icons.place),
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
                      style: textTheme.subtitle2,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      etablissement.sousCategories!.isNotEmpty
                          ? etablissement.sousCategories![0].nom! +
                              "," +
                              etablissement.sousCategories![0].categorie!.nom!
                          : "",
                      style: const TextStyle(fontStyle: FontStyle.italic)
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
