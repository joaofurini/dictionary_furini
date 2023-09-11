import 'package:dictionary_furini/src/features/favorites/favorites_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dictionary_furini/src/features/history/history_store.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({
    super.key,
    this.axis = Axis.horizontal,
  });

  final Axis axis;

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  FavoritesStore favoritesStore = Modular.get<FavoritesStore>();

  @override
  void initState() {
    // TODO: implement initState
    favoritesStore.init();

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Widget buildFavoritesScreen() {
    final searchedUsernamesList = favoritesStore.favoriteWords;
    return Center(
      child: Visibility(
        replacement: Center(
          child: Text("You don't have any favorite words yet!"),
        ),
        visible: searchedUsernamesList.length > 0,
        child: ListView.builder(
          itemCount: searchedUsernamesList.length,
          itemBuilder: (context, index) {
            return ListTile(
              trailing: GestureDetector(
                child: const Icon(Icons.close),
                onTap: () {
                  print('chegou');
                  favoritesStore
                      .removeItemFromFavorites(searchedUsernamesList[index]);
                  setState(() {});
                },
              ),
              leading: const Icon(
                Icons.favorite,
              ),
              onTap: () async {
                await Modular.to.pushNamed('/details/word',
                    arguments: {'word': searchedUsernamesList[index]});
                setState(() {});
              },
              title: Text(searchedUsernamesList[index]),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print("teste");
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Words'),
      ),
      body: Observer(
        builder: (context) => buildFavoritesScreen(),
      ),
      // body: buildFavoritesScreen(),
    );
  }
}
