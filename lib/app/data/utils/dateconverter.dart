import 'package:flutter_getx_starter/app/core/constant.dart';
import 'package:intl/intl.dart';


enum DateFormatSource {
  API,
  ISO,
  FIRESTORE,
}

/*
* this is DateConverter to sync between UTC(Backend Time Zone) and diffrents devices
* */
class DateConverter {
  /// we make isUtc true in case we save model to the local storage
  /// we should store it in utc timezone in case the device change their time zone
  /// after period of save to local storage

  /// Response if is not null will get DateTime parced to Utc DateFormat and Local Device Time Zone
  static DateTime? fromJson({String? jsonDateString, bool isUtc = true, DateFormatSource? dateFormatSource}) {
    try {
      if (jsonDateString != null) {
        //dateFormatSource is where From the DateFormatSource come from
        final dateFormat = getDateFormat(dateFormatSource: dateFormatSource);
        var dateTime = dateFormat != null ? (isUtc ? dateFormat.parseUtc(jsonDateString).toLocal() : dateFormat.parse(jsonDateString)) : (isUtc ? DateTime.parse(jsonDateString).toLocal() : DateTime.parse(jsonDateString));

        /*if (isUtc) {
          // from Utc(Gmt) to Local Time Zone
          dateTime = dateTime.toLocal();
        } else {
          // from Local to Utc(Gmt) Time Zone
          dateTime = dateTime.toUtc();
        }*/
        var d = dateTime;
        return dateTime;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  /// we make isUtc true in case we save model to the local storage
  /// we should store it in utc timezone in case the device change their time zone
  /// after period of save to local storage

  /// Response if is not null will get String parced to Utc DateFormat and Local Device Time Zone
  static String? toJson({DateTime? date, bool isUtc = true, DateFormatSource? dateFormatSource}) {
    try {
      if (date != null) {
        //dateFormatSource is what DateFormatSource want to convert to
        final dateFormat = getDateFormat(dateFormatSource: dateFormatSource);
        late DateTime dateTime;
        if (isUtc) {
          // from Utc to Local Device Time Zone
          dateTime = date;
        } else {
          // from Local Device Time Zone to Utc
          dateTime = date.toUtc();
        }
        final dateTimeText = dateFormat != null ? dateFormat.format(dateTime) : dateTime.toIso8601String();
        return dateTimeText;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  static DateFormat? getDateFormat({DateFormatSource? dateFormatSource}) {
    var dateFormat;
    if (dateFormatSource != null) {
      if (dateFormatSource == DateFormatSource.API)
        dateFormat = Constant.backendDateFormat;
      else if (dateFormatSource == DateFormatSource.ISO)
        dateFormat = null;
      //else if (dateFormatSource == DateFormatSource.FIRESTORE) dateFormat = Constant.firebaseDateFormat;
    } else {
      dateFormat = Constant.backendDateFormat;
    }
    return dateFormat;
  }
}
