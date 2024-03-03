import 'package:equatable/equatable.dart';

abstract class BaseException extends Equatable {
  final String message;

  const BaseException(this.message);

  @override
  String toString() {
    return message;
  }

  @override
  List<Object?> get props => [message];
}
