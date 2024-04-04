import 'dart:convert';

import 'package:equatable/equatable.dart';

class AccountsModel extends Equatable {
  final int id;
  final String name;
  final String type;
  final String shortCode;
  final Icon icon;

   const AccountsModel(
      {required this.id,
      required this.name ,
      required this.type,
      required this.shortCode,
      required this.icon});

  @override
  String toString() {
    return 'AccountsModel(id: $id, name: $name, type: $type, shortCode: $shortCode, icon: $icon)';
  }

  AccountsModel copyWith({
    int? id,
    String? name,
    String? type,
    String? shortCode,
    Icon? icon,
  }) {
    return AccountsModel(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      shortCode: shortCode ?? this.shortCode,
      icon: icon ?? this.icon,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'type': type,
      'shortCode': shortCode,
      'icon': icon.toMap(),
    };
  }

  factory AccountsModel.fromMap(Map<String, dynamic> map) {
    return AccountsModel(
      id: (map["id"] ?? 0) as int,
      name: (map["name"] ?? '') as String,
      type: (map["type"] ?? '') as String,
      shortCode: (map["shortCode"] ?? '') as String,
      icon: Icon.fromMap((map["icon"] ?? Map<String, dynamic>.from({}))
          as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory AccountsModel.fromJson(String source) =>
      AccountsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object?> get props => [id, name, type, shortCode, icon];
}

class Icon extends Equatable {
  final int id;
  final String name;
  final int width;
  final int height;
  final Formats formats;

  Icon(
      {required this.id,
      required this.name,
      required this.width,
      required this.height,
      required this.formats});

  @override
  String toString() {
    return 'Icon(id: $id, name: $name, width: $width, height: $height, formats: $formats)';
  }

  Icon copyWith({
    int? id,
    String? name,
    int? width,
    int? height,
    Formats? formats,
  }) {
    return Icon(
      id: id ?? this.id,
      name: name ?? this.name,
      width: width ?? this.width,
      height: height ?? this.height,
      formats: formats ?? this.formats,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'width': width,
      'height': height,
      'formats': formats.toMap(),
    };
  }

  factory Icon.fromMap(Map<String, dynamic> map) {
    return Icon(
      id: (map["id"] ?? 0) as int,
      name: (map["name"] ?? '') as String,
      width: (map["width"] ?? 0) as int,
      height: (map["height"] ?? 0) as int,
      formats: Formats.fromMap((map["formats"] ?? Map<String, dynamic>.from({}))
          as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Icon.fromJson(String source) =>
      Icon.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object?> get props => [id, name, width, height, formats];
}

class Formats extends Equatable {
  final int width;
  final int height;
  final Thumbnail thumbnail;

  const Formats(
      {required this.width, required this.height, required this.thumbnail});

  @override
  String toString() =>
      'Formats(width: $width, height: $height, thumbnail: $thumbnail)';

  Formats copyWith({
    int? width,
    int? height,
    Thumbnail? thumbnail,
  }) {
    return Formats(
      width: width ?? this.width,
      height: height ?? this.height,
      thumbnail: thumbnail ?? this.thumbnail,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'width': width,
      'height': height,
      'thumbnail': thumbnail.toMap(),
    };
  }

  factory Formats.fromMap(Map<String, dynamic> map) {
    return Formats(
      width: (map["width"] ?? 0) as int,
      height: (map["height"] ?? 0) as int,
      thumbnail: Thumbnail.fromMap((map["thumbnail"] ??
          Map<String, dynamic>.from({})) as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Formats.fromJson(String source) =>
      Formats.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object?> get props => [width, height, thumbnail];
}

class Thumbnail extends Equatable {
  final String text;
  final String url;

  const Thumbnail({required this.text, required this.url});

  @override
  String toString() => 'Thumbnail(text: $text, url: $url)';

  Thumbnail copyWith({
    String? text,
    String? url,
  }) {
    return Thumbnail(
      text: text ?? this.text,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'text': text,
      'url': url,
    };
  }

  factory Thumbnail.fromMap(Map<String, dynamic> map) {
    return Thumbnail(
      text: (map["text"] ?? '') as String,
      url: (map["url"] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Thumbnail.fromJson(String source) =>
      Thumbnail.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object?> get props => [text, url];
}
