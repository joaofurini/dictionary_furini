import 'package:dictionary_furini/src/features/history/history_store.dart';
import 'package:dictionary_furini/src/features/words_list/presentation/word/word_details_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_tts/flutter_tts.dart';

class WordDetailsScreen extends StatefulWidget {
  const WordDetailsScreen({
    super.key,
    required this.word,
    this.axis = Axis.horizontal,
  });
  final String? word;

  final Axis axis;

  @override
  State<WordDetailsScreen> createState() => _WordDetailsScreenState();
}

class _WordDetailsScreenState extends State<WordDetailsScreen> {
  WordDetailsStore wordDetailsStore = Modular.get<WordDetailsStore>();
  HistoryStore historyStore = Modular.get<HistoryStore>();
  final FlutterTts flutterTts = Modular.get<FlutterTts>();
  Future _speak(String word) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1.5);
    await flutterTts.speak(word);
  }

  @override
  void initState() {
    wordDetailsStore.init(widget.word);
    wordDetailsStore.getWordDetails(widget.word!);

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    wordDetailsStore.resetState();
  }

  Widget buildWordDetailsScreen() {
    print(wordDetailsStore.wordDetails);

    return Visibility(
      replacement: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(wordDetailsStore.errorMessage ?? ''),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            child: const Text('Back'),
            onPressed: () {
              Modular.to.pop();
            },
          )
        ]),
      ),
      visible: !wordDetailsStore.hasError,
      child: Visibility(
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        visible: !wordDetailsStore.loading && !wordDetailsStore.hasError,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      child: Text('Pronunciation:',
                          textAlign: TextAlign.start,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          child: Icon(Icons.play_arrow),
                          onTap: () {
                            _speak(wordDetailsStore.wordDetails!.word!);
                          },
                        ),
                        Text(wordDetailsStore.wordDetails?.pronunciation?.all ??
                            ""),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      child: Text('Frequency:',
                          textAlign: TextAlign.start,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(wordDetailsStore.wordDetails?.frequency.toString() ??
                        "")
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      child: Text('Definition:',
                          textAlign: TextAlign.start,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(wordDetailsStore.wordDetails?.word ?? ""),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 2,
                      child: ListView.builder(
                        itemBuilder: (context, index) => ListTile(
                          title: Text(wordDetailsStore
                                  .wordDetails?.results?[index].definition ??
                              ""),
                        ),
                        itemCount:
                            wordDetailsStore.wordDetails?.results?.length ?? 0,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            Observer(
              builder: (context) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GestureDetector(
                    onTap: () {
                      wordDetailsStore.favoriteWord(widget.word);
                    },
                    child: Icon(
                      Icons.favorite,
                      color: wordDetailsStore.isFavorite
                          ? Colors.red
                          : Colors.grey,
                    )),
              ),
            )
          ],
          title: Text(widget.word ?? ""),
        ),
        body: Observer(
          builder: (context) => buildWordDetailsScreen(),
        ));
  }
}
