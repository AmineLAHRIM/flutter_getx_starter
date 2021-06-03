import 'package:equatable/equatable.dart';

class FcmPushNotificationDto extends Equatable {
  FcmMessage? advancedMessage;

  String? token;
  String? topic;
  String? title;
  String? body;
  String? imageUrl;
  Map<String, String>? data;
  String? condition;

  FcmPushNotificationDto({this.token, this.topic, this.title, this.body, this.imageUrl, this.data, this.condition, this.advancedMessage}) {
    if (advancedMessage == null) {
      advancedMessage = FcmMessage(
        notification: FcmNotification(title: title, body: body),
        token: this.token,
        topic: this.topic,
        data: this.data,
        condition: this.topic,
        android: FcmAndroid(
          notification: FcmAndroidNotification(
            image: imageUrl,
          ),
        ),
        apns: FcmApns(
          payload: FcmPayload(
            aps: FcmAps(
              mutableContent: 1,
            ),
          ),
          fcmOptions: FcmOptions(
            image: imageUrl,
          ),
        ),
        webpush: FcmWebpush(
          headers: FcmOptions(
            image: imageUrl,
          ),
        ),
      );
    }
  }

  //FcmPushNotification({this.message});

  FcmPushNotificationDto.fromJson(Map<String, dynamic> json) {
    advancedMessage = json['message'] != null ? new FcmMessage.fromJson(json['message']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.advancedMessage != null) {
      data['message'] = this.advancedMessage!.toJson();
    }
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [advancedMessage];
}

class FcmMessage extends Equatable {
  String? token;
  String? topic;
  String? condition;
  FcmNotification? notification;
  Map<String, String>? data;
  FcmAndroid? android;
  FcmApns? apns;
  FcmWebpush? webpush;

  FcmMessage({this.token, this.topic, this.condition, this.notification, this.android, this.data, this.apns, this.webpush});

  FcmMessage.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    topic = json['topic'];
    condition = json['condition'];
    notification = json['notification'] != null ? new FcmNotification.fromJson(json['notification']) : null;
    if (json['data'] != null) {
      data = json['data'] as Map<String, String>?;
    }
    android = json['android'] != null ? new FcmAndroid.fromJson(json['android']) : null;
    apns = json['apns'] != null ? new FcmApns.fromJson(json['apns']) : null;
    webpush = json['webpush'] != null ? new FcmWebpush.fromJson(json['webpush']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['topic'] = this.topic;
    if (this.notification != null) {
      data['notification'] = this.notification!.toJson();
    }
    if (data != null) {
      data['data'] = this.data;
    }
    if (this.android != null) {
      data['android'] = this.android!.toJson();
    }
    if (this.apns != null) {
      data['apns'] = this.apns!.toJson();
    }
    if (this.webpush != null) {
      data['webpush'] = this.webpush!.toJson();
    }
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [token, topic, notification, data, android, apns, webpush];

  @override
  // TODO: implement stringify
  bool get stringify => true;
}

class FcmNotification extends Equatable {
  String? title;
  String? body;

  FcmNotification({this.title, this.body});

  FcmNotification.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [title, body];

  @override
  // TODO: implement stringify
  bool get stringify => true;
}

class FcmAndroid extends Equatable {
  FcmAndroidNotification? notification;

  FcmAndroid({this.notification});

  FcmAndroid.fromJson(Map<String, dynamic> json) {
    notification = json['notification'] != null ? new FcmAndroidNotification.fromJson(json['notification']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.notification != null) {
      data['notification'] = this.notification!.toJson();
    }
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [notification];

  @override
  // TODO: implement stringify
  bool get stringify => true;
}

class FcmAndroidNotification extends Equatable {
  String? image;
  String? icon;
  String? color;

  FcmAndroidNotification({this.image, this.icon, this.color});

  FcmAndroidNotification.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    icon = json['icon'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['icon'] = this.icon;
    data['color'] = this.color;
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [image, icon, color];

  @override
  // TODO: implement stringify
  bool get stringify => true;
}

class FcmApns extends Equatable {
  FcmPayload? payload;
  FcmOptions? fcmOptions;

  FcmApns({this.payload, this.fcmOptions});

  FcmApns.fromJson(Map<String, dynamic> json) {
    payload = json['payload'] != null ? new FcmPayload.fromJson(json['payload']) : null;
    fcmOptions = json['fcm_options'] != null ? new FcmOptions.fromJson(json['fcm_options']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.payload != null) {
      data['payload'] = this.payload!.toJson();
    }
    if (this.fcmOptions != null) {
      data['fcm_options'] = this.fcmOptions!.toJson();
    }
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [payload, fcmOptions];

  @override
  // TODO: implement stringify
  bool get stringify => true;
}

class FcmPayload extends Equatable {
  FcmAps? aps;

  FcmPayload({this.aps});

  FcmPayload.fromJson(Map<String, dynamic> json) {
    aps = json['aps'] != null ? new FcmAps.fromJson(json['aps']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.aps != null) {
      data['aps'] = this.aps!.toJson();
    }
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [aps];

  @override
  // TODO: implement stringify
  bool get stringify => true;
}

class FcmAps extends Equatable {
  int? mutableContent;

  FcmAps({this.mutableContent = 1});

  FcmAps.fromJson(Map<String, dynamic> json) {
    mutableContent = json['mutable-content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mutable-content'] = this.mutableContent;
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [mutableContent];

  @override
  // TODO: implement stringify
  bool get stringify => true;
}

class FcmOptions extends Equatable {
  String? image;

  FcmOptions({this.image});

  FcmOptions.fromJson(Map<String, dynamic> json) {
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [image];

  @override
  // TODO: implement stringify
  bool get stringify => true;
}

class FcmWebpush extends Equatable {
  FcmOptions? headers;

  FcmWebpush({this.headers});

  FcmWebpush.fromJson(Map<String, dynamic> json) {
    headers = json['headers'] != null ? new FcmOptions.fromJson(json['headers']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.headers != null) {
      data['headers'] = this.headers!.toJson();
    }
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [headers];

  @override
  // TODO: implement stringify
  bool get stringify => true;
}
