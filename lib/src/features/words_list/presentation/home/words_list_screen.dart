import 'package:adaptive_components/adaptive_components.dart';

import 'package:dictionary_furini/src/features/words_list/presentation/home/words_list_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dictionary_furini/src/shared/views/views.dart';
import '../../../../shared/extensions.dart';

class WordsListScreen extends StatefulWidget {
  const WordsListScreen({
    super.key,
  });

  @override
  State<WordsListScreen> createState() => _WordsListScreenState();
}

class _WordsListScreenState extends State<WordsListScreen> {
  final TextEditingController _wordController = TextEditingController();
  WordsListStore wordsListStore = Modular.get<WordsListStore>();

  bool loading = false;

  getData() async {
    await wordsListStore.fetchData();
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.isMobile) {
            return Scaffold(
              appBar: AppBar(
                actions: [BrightnessToggle()],
                centerTitle: false,
                title: const Text('Words list'),
                // actions: const [BrightnessToggle()],
              ),
              body: Visibility(
                replacement: const Center(child: CircularProgressIndicator()),
                visible: !wordsListStore.loading,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      TextField(
                        onChanged: (value) {
                          setState(() {});
                        },
                        decoration: InputDecoration(hintText: "Search a word"),
                        controller: _wordController,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                          onPressed: _wordController.text.isEmpty
                              ? null
                              : () {
                                  Modular.to.pushNamed('details', arguments: {
                                    'word': _wordController.text
                                  });
                                },
                          child: Text('Search Word')),
                      SizedBox(
                        height: 10,
                      ),
                      Flexible(
                        child: GridView.builder(
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 120,
                              childAspectRatio: 3 / 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 20,
                            ),
                            itemCount: wordsListStore.formatedWordsList.length,
                            itemBuilder: (BuildContext ctx, index) {
                              return InkWell(
                                onTap: () {
                                  Modular.to.pushNamed('details', arguments: {
                                    'word':
                                        wordsListStore.formatedWordsList[index]
                                  });
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      // BoxShadow(
                                      //   color: Colors.grey.withOpacity(0.5),
                                      //   spreadRadius: 1,
                                      //   blurRadius: 9,
                                      //   offset: Offset(
                                      //       3, 0), // changes position of shadow
                                      // ),
                                    ],
                                    border: Border.all(color: Colors.grey),
                                  ),
                                  child: Text(
                                      wordsListStore.formatedWordsList[index]),
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          return Scaffold(
            body: SingleChildScrollView(
              child: AdaptiveColumn(
                children: [
                  AdaptiveContainer(
                    columnSpan: 12,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 25, 20, 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              'Good morning',
                              style: context.displaySmall,
                            ),
                          ),
                          const SizedBox(width: 20),
                          const BrightnessToggle(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
