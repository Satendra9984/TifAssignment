class EventModel {
  int? _id;
  String? _title;
  String? _description;
  String? _bannerImage;
  DateTime? _dateTime;
  String? _organiserName;
  String? _organiserIcon;
  String? _venueName;
  String? _venueCity;
  String? _venueCountry;

  EventModel({
    int? id,
    String? title,
    String? description,
    String? bannerImage,
    DateTime? dateTime,
    String? organiserName,
    String? organiserIcon,
    String? venueName,
    String? venueCity,
    String? venueCountry,
  }) {
    if (id != null) {
      this._id = id;
    }
    if (title != null) {
      this._title = title;
    }
    if (description != null) {
      this._description = description;
    }
    if (bannerImage != null) {
      this._bannerImage = bannerImage;
    }
    if (dateTime != null) {
      this._dateTime = dateTime;
    }
    if (organiserName != null) {
      this._organiserName = organiserName;
    }
    if (organiserIcon != null) {
      this._organiserIcon = organiserIcon;
    }
    if (venueName != null) {
      this._venueName = venueName;
    }
    if (venueCity != null) {
      this._venueCity = venueCity;
    }
    if (venueCountry != null) {
      this._venueCountry = venueCountry;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get title => _title;
  set title(String? title) => _title = title;
  String? get description => _description;
  set description(String? description) => _description = description;
  String? get bannerImage => _bannerImage;
  set bannerImage(String? bannerImage) => _bannerImage = bannerImage;
  DateTime? get dateTime => _dateTime;
  set dateTime(DateTime? dateTime) => _dateTime = dateTime;
  String? get organiserName => _organiserName;
  set organiserName(String? organiserName) => _organiserName = organiserName;
  String? get organiserIcon => _organiserIcon;
  set organiserIcon(String? organiserIcon) => _organiserIcon = organiserIcon;
  String? get venueName => _venueName;
  set venueName(String? venueName) => _venueName = venueName;
  String? get venueCity => _venueCity;
  set venueCity(String? venueCity) => _venueCity = venueCity;
  String? get venueCountry => _venueCountry;
  set venueCountry(String? venueCountry) => _venueCountry = venueCountry;

  EventModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _title = json['title'];
    _description = json['description'];
    _bannerImage = json['banner_image'];
    _dateTime = DateTime.parse(json['date_time']);
    _organiserName = json['organiser_name'];
    _organiserIcon = json['organiser_icon'];
    _venueName = json['venue_name'];
    _venueCity = json['venue_city'];
    _venueCountry = json['venue_country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['title'] = _title;
    data['description'] = _description;
    data['banner_image'] = _bannerImage;
    data['date_time'] = _dateTime;
    data['organiser_name'] = _organiserName;
    data['organiser_icon'] = _organiserIcon;
    data['venue_name'] = _venueName;
    data['venue_city'] = _venueCity;
    data['venue_country'] = _venueCountry;
    return data;
  }
}
