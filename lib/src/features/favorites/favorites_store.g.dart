// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FavoritesStore on FavoritesStoreBase, Store {
  late final _$counterAtom =
      Atom(name: 'FavoritesStoreBase.counter', context: context);

  @override
  int get counter {
    _$counterAtom.reportRead();
    return super.counter;
  }

  @override
  set counter(int value) {
    _$counterAtom.reportWrite(value, super.counter, () {
      super.counter = value;
    });
  }

  late final _$favoriteWordsAtom =
      Atom(name: 'FavoritesStoreBase.favoriteWords', context: context);

  @override
  List<dynamic> get favoriteWords {
    _$favoriteWordsAtom.reportRead();
    return super.favoriteWords;
  }

  @override
  set favoriteWords(List<dynamic> value) {
    _$favoriteWordsAtom.reportWrite(value, super.favoriteWords, () {
      super.favoriteWords = value;
    });
  }

  @override
  String toString() {
    return '''
counter: ${counter},
favoriteWords: ${favoriteWords}
    ''';
  }
}
