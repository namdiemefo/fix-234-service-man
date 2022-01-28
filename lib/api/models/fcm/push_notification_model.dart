class PushNotificationModel {
  PushNotificationModel(
      {this.title,
        this.body,
        this.dataTitle,
        this.dataBody,
        this.notificationType});
  String title;
  String body;
  String dataTitle;
  String dataBody;
  int notificationType;
}

class PushNotificationPayloadFromData {
  PushNotificationPayloadFromData({
    this.icon,
    this.recipient,
    this.notificationType,
    this.body,
    this.title,
    this.user,
  });

  int icon;
  String recipient;
  int notificationType;
  String body;
  String title;
  dynamic user;

  factory PushNotificationPayloadFromData.fromJson(Map<String, dynamic> json) =>
      PushNotificationPayloadFromData(
        icon: json["icon"] == null ? null : json["icon"],
        recipient: json["recipient"] == null ? null : json["recipient"],
        notificationType:
        json["notificationType"] == null ? null : json["notificationType"],
        body: json["body"] == null ? null : json["body"],
        title: json["title"] == null ? null : json["title"],
        user: json["user"],
      );

  Map<String, dynamic> toJson() => {
    "icon": icon == null ? null : icon,
    "recipient": recipient == null ? null : recipient,
    "notificationType": notificationType == null ? null : notificationType,
    "body": body == null ? null : body,
    "title": title == null ? null : title,
    "user": user,
  };
}
