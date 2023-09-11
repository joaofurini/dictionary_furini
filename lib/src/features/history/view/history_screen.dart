import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dictionary_furini/src/features/history/history_store.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({
    super.key,
    this.axis = Axis.horizontal,
  });

  final Axis axis;

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  HistoryStore historyStore = Modular.get<HistoryStore>();

  Widget buildHistoryPage() {
    final searchedWordsList = historyStore.searchedWords;
    return Center(
      child: Visibility(
        replacement: Center(
          child: Text("You don't have any history yet!"),
        ),
        visible: searchedWordsList.isNotEmpty,
        child: ListView.builder(
          itemCount: searchedWordsList.length,
          itemBuilder: (context, index) {
            return ListTile(
              trailing: GestureDetector(
                child: const Icon(Icons.close),
                onTap: () {
                  historyStore.removeItemFromHistory(searchedWordsList[index]);
                  setState(() {});
                },
              ),
              leading: const Icon(Icons.history),
              onTap: () async {
                await Modular.to.pushNamed('/details/word',
                    arguments: {'word': searchedWordsList[index]});
                setState(() {});
              },
              title: Text(searchedWordsList[index]),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search History'),
      ),
      body: Observer(
        builder: (context) => buildHistoryPage(),
      ),
      // body: buildHistoryPage(),
    );
  }
}
