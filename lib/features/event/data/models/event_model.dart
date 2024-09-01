import 'dart:convert';

EventModel eventModelFromJson(String str) => EventModel.fromJson(
      json.decode(str) as Map<String, dynamic>,
    );

String eventModelToJson(EventModel data) => json.encode(data.toJson());

class EventModel {
  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
        user: json['user'] as String?,
        name: json['name'] as String?,
        date: json['date'] as String?,
        location: json['location'] as String?,
        price: json['price'] as double?,
        availableTickets: json['availableTickets'] as int?,
        description: json['description'] as String?,
        eventCover: json['eventCover'] as String?,
        id: json['_id'] as String?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
      );

  EventModel({
    this.user,
    this.name,
    this.date,
    this.location,
    this.price,
    this.availableTickets,
    this.description,
    this.eventCover,
    this.id,
    this.createdAt,
    this.updatedAt,
  });
  final String? user;
  final String? name;
  final String? date;
  final String? location;
  final double? price;
  final int? availableTickets;
  final String? description;
  final String? eventCover;
  final String? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Map<String, dynamic> toJson() => {
        'user': user,
        'name': name,
        'location': location,
        'price': price,
        'availableTickets': availableTickets,
        'description': description,
        'eventCover': eventCover,
        '_id': id,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
      };
}
