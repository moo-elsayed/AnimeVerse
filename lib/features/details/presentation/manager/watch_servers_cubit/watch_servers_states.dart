import '../../../data/models/watch_servers.dart';

abstract class WatchServersStates {}

class WatchServersInitial extends WatchServersStates {}

//-----------------------------------

class GetWatchServersLoading extends WatchServersStates {}

class GetWatchServersSuccess extends WatchServersStates {
  final WatchServers watchServers;

  GetWatchServersSuccess({required this.watchServers});
}

class GetWatchServersFailure extends WatchServersStates {
  final String errorMessage;

  GetWatchServersFailure({required this.errorMessage});
}

//-----------------------------------
