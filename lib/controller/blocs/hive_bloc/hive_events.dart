part of 'hive_bloc.dart';

abstract class HiveEvents {}

class FetchDataEvent extends HiveEvents {}

class UpdateDataEvent extends HiveEvents {
  final String email;
  final String name;

  UpdateDataEvent({
    required this.name,
    required this.email,
  });
}
