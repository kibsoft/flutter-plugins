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
  final List<String>? mimeTypes;
  DropEnterEvent({required Offset location, this.fileNames, this.mimeTypes}) : super(location);

  @override
  String toString() {
    final details = <String>[];
    if (fileNames != null) details.add('fileNames: $fileNames');
    if (mimeTypes != null) details.add('mimeTypes: $mimeTypes');
    if (details.isNotEmpty) {
      return ' [36m$runtimeType($location, ${details.join(', ')}) [0m';
    }
    return super.toString();
  }
}

class DropExitEvent extends DropEvent {
  DropExitEvent({required Offset location}) : super(location);
}

class DropUpdateEvent extends DropEvent {
  final List<String>? fileNames;
  final List<String>? mimeTypes;
  DropUpdateEvent({required Offset location, this.fileNames, this.mimeTypes}) : super(location);

  @override
  String toString() {
    final details = <String>[];
    if (fileNames != null) details.add('fileNames: $fileNames');
    if (mimeTypes != null) details.add('mimeTypes: $mimeTypes');
    if (details.isNotEmpty) {
      return ' [36m$runtimeType($location, ${details.join(', ')}) [0m';
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
