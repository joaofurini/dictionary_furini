// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_details_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$WordDetailsStore on _WordDetailsStore, Store {
  late final _$wordDetailsAtom =
      Atom(name: '_WordDetailsStore.wordDetails', context: context);

  @override
  Word? get wordDetails {
    _$wordDetailsAtom.reportRead();
    return super.wordDetails;
  }

  @override
  set wordDetails(Word? value) {
    _$wordDetailsAtom.reportWrite(value, super.wordDetails, () {
      super.wordDetails = value;
    });
  }

  late final _$hasErrorAtom =
      Atom(name: '_WordDetailsStore.hasError', context: context);

  @override
  bool get hasError {
    _$hasErrorAtom.reportRead();
    return super.hasError;
  }

  @override
  set hasError(bool value) {
    _$hasErrorAtom.reportWrite(value, super.hasError, () {
      super.hasError = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_WordDetailsStore.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: '_WordDetailsStore.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$isFavoriteAtom =
      Atom(name: '_WordDetailsStore.isFavorite', context: context);

  @override
  bool get isFavorite {
    _$isFavoriteAtom.reportRead();
    return super.isFavorite;
  }

  @override
  set isFavorite(bool value) {
    _$isFavoriteAtom.reportWrite(value, super.isFavorite, () {
      super.isFavorite = value;
    });
  }

  @override
  String toString() {
    return '''
wordDetails: ${wordDetails},
hasError: ${hasError},
errorMessage: ${errorMessage},
loading: ${loading},
isFavorite: ${isFavorite}
    ''';
  }
}
