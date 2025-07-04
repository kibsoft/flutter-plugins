import 'package:flutter/painting.dart';

import 'package:desktop_drop/src/drop_item.dart';

abstract class DropEvent {
  Offset location;

  DropEvent(this.location);

  @override
  String toString() {
    return '$runtimeType($location)';
  }
}

class DropEnterEvent extends DropEvent {
  final List<String>? fileNames;
  DropEnterEvent({required Offset location, this.fileNames}) : super(location);

  @override
  String toString() {
    if (fileNames != null) {
      return '$runtimeType($location, fileNames: $fileNames)';
    }
    return super.toString();
  }
}

class DropExitEvent extends DropEvent {
  DropExitEvent({required Offset location}) : super(location);
}

class DropUpdateEvent extends DropEvent {
  final List<String>? fileNames;
  DropUpdateEvent({required Offset location, this.fileNames}) : super(location);

  @override
  String toString() {
    if (fileNames != null) {
      return '$runtimeType($location, fileNames: $fileNames)';
    }
    return super.toString();
  }
}

class DropDoneEvent extends DropEvent {
  final List<DropItem> files;

  DropDoneEvent({
    required Offset location,
    required this.files,
  }) : super(location);

  @override
  String toString() {
    return '$runtimeType($location, $files)';
  }
}
