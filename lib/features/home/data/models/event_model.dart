class EventModel {
  const EventModel({
    required this.name,
    required this.location,
    required this.date,
    required this.numberTicket,
    required this.thumbImage,
    required this.description,
    required this.creatorName,
    required this.creatorLogo,
    required this.isVerified,
    required this.price,
  });

  final String name;
  final String location;
  final String date;
  final String numberTicket;
  final String thumbImage;
  final String description;
  final String price;

  // Event Creator
  final String creatorName;
  final String creatorLogo;
  final bool isVerified;
}
