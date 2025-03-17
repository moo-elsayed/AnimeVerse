abstract class CollectionStates {}

class FavoriteInitial extends CollectionStates {}

// ==========================

class InsertAnimeLoading extends CollectionStates {}

class InsertAnimeSuccess extends CollectionStates {}

class InsertAnimeFailure extends CollectionStates {
  final String errorMessage;

  InsertAnimeFailure({required this.errorMessage});
}

// ==========================
// ==========================

class GetFavoritesLoading extends CollectionStates {}

class GetFavoritesSuccess extends CollectionStates {}

class GetFavoritesFailure extends CollectionStates {
  final String errorMessage;

  GetFavoritesFailure({required this.errorMessage});
}

// ==========================
// ==========================

class IsFavoriteLoading extends CollectionStates {}

class IsFavoriteSuccess extends CollectionStates {}

class IsFavoriteFailure extends CollectionStates {
  final String errorMessage;

  IsFavoriteFailure({required this.errorMessage});
}

// ==========================
// ==========================

class RemoveFavoriteLoading extends CollectionStates {}

class RemoveFavoriteSuccess extends CollectionStates {}

class RemoveFavoriteFailure extends CollectionStates {
  final String errorMessage;

  RemoveFavoriteFailure({required this.errorMessage});
}

// ==========================
// ==========================

class IsWatchingNowLoading extends CollectionStates {}

class IsWatchingNowSuccess extends CollectionStates {}

class IsWatchingNowFailure extends CollectionStates {
  final String errorMessage;

  IsWatchingNowFailure({required this.errorMessage});
}

// ==========================
// ==========================

class GetWatchingLoading extends CollectionStates {}

class GetWatchingSuccess extends CollectionStates {}

class GetWatchingFailure extends CollectionStates {
  final String errorMessage;

  GetWatchingFailure({required this.errorMessage});
}

// ==========================

// ==========================

class RemoveWatchingLoading extends CollectionStates {}

class RemoveWatchingSuccess extends CollectionStates {}

class RemoveWatchingFailure extends CollectionStates {
  final String errorMessage;

  RemoveWatchingFailure({required this.errorMessage});
}

// ==========================
