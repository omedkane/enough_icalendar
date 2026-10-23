import '../enough_icalendar.dart';
import 'text/encoder.dart';
import 'text/l10n/l10n.dart';

/// To explicitly specify the value type format for a property value.
enum ValueType {
  /// `BINARY` value type.
  binary,

  /// `BOOLEAN` value type.
  boolean,

  /// `CAL-ADDRESS` value type.
  calendarAddress,

  /// `DATE` value type.
  date,

  /// `DATE-TIME` value type.
  dateTime,

  /// `DURATION` value type.
  duration,

  /// `FLOAT` value type.
  float,

  /// `INTEGER` value type.
  integer,

  /// `PERIOD` value type.
  period,

  /// A list of periods.
  periodList,

  /// `RECUR` value type.
  recurrence,

  /// `TEXT` value type.
  text,

  /// `TIME` value type.
  time,

  /// `URI` value type.
  uri,

  /// `UTC-OFFSET` value type.
  utcOffset,

  /// Any other value type.
  other,

  /// Classification value type.
  typeClassification,

  /// A list of URIs.
  typeUriList,

  /// A list of date-time values.
  typeDateTimeList,

  /// A free/busy value.
  typeFreeBusy,

  /// A participant status value.
  typeParticipantStatus,

  /// A range value.
  typeRange,

  /// An alarm trigger relationship value.
  typeAlarmTriggerRelationship,

  /// A relationship value.
  typeRelationship,

  /// A role value.
  typeRole,

  /// A generic value type marker.
  typeValue,
}

/// Extends [ValueType] with the corresponding iCalendar type name.
extension ExtensionValueType on ValueType {
  /// Retrieves the iCalendar type name, or `null` when there is none.
  String? get typeName {
    switch (this) {
      case ValueType.binary:
        return 'BINARY';
      case ValueType.boolean:
        return 'BOOLEAN';
      case ValueType.calendarAddress:
        return 'CAL-ADDRESS';
      case ValueType.date:
        return 'DATE';
      case ValueType.dateTime:
        return 'DATE-TIME';
      case ValueType.duration:
        return 'DURATION';
      case ValueType.float:
        return 'FLOAT';
      case ValueType.integer:
        return 'INTEGER';
      case ValueType.period:
        return 'PERIOD';
      case ValueType.recurrence:
        return 'RECUR';
      case ValueType.text:
        return 'TEXT';
      case ValueType.time:
        return 'TIME';
      case ValueType.uri:
        return 'URI';
      case ValueType.utcOffset:
        return 'UTC-OFFSET';
      case ValueType.other:
      case ValueType.typeFreeBusy:
      case ValueType.periodList:
      case ValueType.typeDateTimeList:
      case ValueType.typeParticipantStatus:
      case ValueType.typeRange:
      case ValueType.typeAlarmTriggerRelationship:
      case ValueType.typeRelationship:
      case ValueType.typeRole:
      case ValueType.typeUriList:
      case ValueType.typeValue:
      case ValueType.typeClassification:
        return null;
    }
  }
}

/// The status of an event.
enum EventStatus {
  /// The event is tentatively confirmed.
  tentative,

  /// The event is confirmed.
  confirmed,

  /// The event has been cancelled.
  cancelled,

  /// The status is unknown or not set.
  unknown,
}

/// Extends [EventStatus] with its iCalendar name.
extension ExtensionEventStatus on EventStatus {
  /// Retrieves the `STATUS` value.
  String get name {
    switch (this) {
      case EventStatus.tentative:
        return 'TENTATIVE';
      case EventStatus.confirmed:
        return 'CONFIRMED';
      case EventStatus.cancelled:
        return 'CANCELLED';
      case EventStatus.unknown:
        return 'UNKNOWN';
    }
  }
}

/// The status of a to-do.
enum TodoStatus {
  /// The to-do still needs action.
  needsAction,

  /// The to-do has been completed.
  completed,

  /// The to-do is in process.
  inProcess,

  /// The to-do has been cancelled.
  cancelled,

  /// The status is unknown or not set.
  unknown,
}

/// Extends [TodoStatus] with its iCalendar name.
extension ExtensionTodoStatus on TodoStatus {
  /// Retrieves the `STATUS` value.
  String get name {
    switch (this) {
      case TodoStatus.needsAction:
        return 'NEEDS-ACTION';
      case TodoStatus.completed:
        return 'COMPLETED';
      case TodoStatus.inProcess:
        return 'IN-PROCESS';
      case TodoStatus.cancelled:
        return 'CANCELLED';
      case TodoStatus.unknown:
        return 'UNKNOWN';
    }
  }
}

/// The status of a journal entry.
enum JournalStatus {
  /// The journal entry is a draft.
  draft,

  /// The journal entry has been finalized.
  finalized,

  /// The journal entry has been cancelled.
  cancelled,

  /// The status is unknown or not set.
  unknown,
}

/// Extends [JournalStatus] with its iCalendar name.
extension ExtensionJournalStatus on JournalStatus {
  /// Retrieves the `STATUS` value.
  String get name {
    switch (this) {
      case JournalStatus.draft:
        return 'DRAFT';
      case JournalStatus.finalized:
        return 'FINAL';
      case JournalStatus.cancelled:
        return 'CANCELLED';
      case JournalStatus.unknown:
        return 'UNKNOWN';
    }
  }
}

/// The access classification of a calendar component.
enum Classification {
  /// Public access.
  public,

  /// Private / restricted access.
  private,

  /// Confidential access.
  confidential,

  /// Any other classification.
  other,
}

/// Extends [Classification] with its iCalendar name.
extension ExtensionClassificationValue on Classification {
  /// Retrieves the `CLASS` value, or `null` when there is none.
  String? get name {
    switch (this) {
      case Classification.public:
        return 'PUBLIC';
      case Classification.private:
        return 'PRIVATE';
      case Classification.confidential:
        return 'CONFIDENTIAL';
      case Classification.other:
        return null;
    }
  }
}

/// `FREQ` part of a recurrence role
///
/// Compare [Recurrence]
enum RecurrenceFrequency {
  /// Repeat every second.
  secondly,

  /// Repeat every minute.
  minutely,

  /// Repeat every hour.
  hourly,

  /// Repeat every day.
  daily,

  /// Repeat every week.
  weekly,

  /// Repeat every month.
  monthly,

  /// Repeat every year.
  yearly,
}

/// Extends [RecurrenceFrequency] with its iCalendar name.
extension ExtensionRecurrenceFrequency on RecurrenceFrequency {
  /// Retrieves the `FREQ` value.
  String get name {
    switch (this) {
      case RecurrenceFrequency.secondly:
        return 'SECONDLY';
      case RecurrenceFrequency.minutely:
        return 'MINUTELY';
      case RecurrenceFrequency.hourly:
        return 'HOURLY';
      case RecurrenceFrequency.daily:
        return 'DAILY';
      case RecurrenceFrequency.weekly:
        return 'WEEKLY';
      case RecurrenceFrequency.monthly:
        return 'MONTHLY';
      case RecurrenceFrequency.yearly:
        return 'YEARLY';
    }
  }

  /// Checks if this frequency is shorter (more frequent) than [other].
  bool operator >(RecurrenceFrequency other) => index < other.index;

  /// Checks if this frequency is shorter (more frequent) than or equal to
  /// [other].
  bool operator >=(RecurrenceFrequency other) => index <= other.index;
}

/// Specifies optional attributes of a [Recurrence] rule.
///
///
/// Compare [Recurrence.copyWithout]
enum RecurrenceAttribute {
  /// The `INTERVAL` attribute.
  interval,

  /// The `COUNT` attribute.
  count,

  /// The `UNTIL` attribute.
  until,

  /// The `WKST` (start of work week) attribute.
  startOfWeek,
}

/// This value type is used to identify properties that contain a
/// recurrence rule specification.
class Recurrence {
  /// Creates a new [Recurrence] rule with the specified [frequency] and
  /// other optional settings.
  const Recurrence(
    this.frequency, {
    this.until,
    this.count,
    int? interval,
    this.bySecond,
    this.byMinute,
    this.byHour,
    this.byWeekDay,
    this.byYearDay,
    this.byWeek,
    this.byMonth,
    this.byMonthDay,
    int? startOfWorkWeek,
    this.bySetPos,
  }) : _interval = interval,
       _startOfWorkWeek = startOfWorkWeek;

  /// The `FREQ` rule part identifies the type of recurrence rule.
  ///
  /// This rule part MUST be specified in the recurrence rule.  Valid values
  /// include SECONDLY, to specify repeating events based on an interval
  /// of a second or more; MINUTELY, to specify repeating events based
  /// on an interval of a minute or more; HOURLY, to specify repeating
  /// events based on an interval of an hour or more; DAILY, to specify
  /// repeating events based on an interval of a day or more; WEEKLY, to
  /// specify repeating events based on an interval of a week or more;
  /// MONTHLY, to specify repeating events based on an interval of a
  /// month or more; and YEARLY, to specify repeating events based on an
  /// interval of a year or more.
  final RecurrenceFrequency frequency;

  /// The `UNTIL` rule part defines a DATE or DATE-TIME value that bounds
  /// the recurrence rule in an inclusive manner.
  ///
  ///   If the value
  /// specified by UNTIL is synchronized with the specified recurrence,
  /// this DATE or DATE-TIME becomes the last instance of the
  /// recurrence.  The value of the UNTIL rule part MUST have the same
  /// value type as the "DTSTART" property.  Furthermore, if the
  /// "DTSTART" property is specified as a date with local time, then
  /// the UNTIL rule part MUST also be specified as a date with local
  /// time.  If the "DTSTART" property is specified as a date with UTC
  /// time or a date with local time and time zone reference, then the
  /// UNTIL rule part MUST be specified as a date with UTC time.  In the
  /// case of the "STANDARD" and "DAYLIGHT" sub-components the UNTIL
  /// rule part MUST always be specified as a date with UTC time.  If
  /// specified as a DATE-TIME value, then it MUST be specified in a UTC
  /// time format.  If not present, and the COUNT rule part is also not
  /// present, the "RRULE" is considered to repeat forever.
  final DateTime? until;

  /// The `COUNT` rule part defines the number of occurrences at which to
  /// range-bound the recurrence.
  ///
  /// The "DTSTART" property value always counts as the first occurrence.
  final int? count;

  final int? _interval;

  /// The `INTERVAL` rule part contains a positive integer representing at which
  /// intervals the recurrence rule repeats.
  ///
  /// The default value is
  /// "1", meaning every second for a SECONDLY rule, every minute for a
  /// MINUTELY rule, every hour for an HOURLY rule, every day for a
  /// DAILY rule, every week for a WEEKLY rule, every month for a
  /// MONTHLY rule, and every year for a YEARLY rule.  For example,
  /// within a DAILY rule, a value of "8" means every eight days.
  int get interval => _interval ?? 1;

  /// Seconds modifier / limiter for this Recurrence.
  ///
  /// BYxxx rule parts modify the recurrence in some manner.
  /// BYxxx rule parts for a period of time which is the same or greater
  /// than the frequency generally reduce or limit the number of
  /// occurrences of the recurrence generated. For example,
  /// "FREQ=DAILY;BYMONTH=1" reduces the number of recurrence instances
  /// from all days (if BYMONTH tag is not present) to all days in
  /// January. BYxxx rule parts for a period of time less than the
  /// frequency generally increase or expand the number of occurrences of
  /// the recurrence. For example, "FREQ=YEARLY;BYMONTH=1,2" increases
  /// the number of days within the yearly recurrence set from 1 (if
  /// BYMONTH tag is not present) to 2.
  ///
  /// ```
  /// +----------+--------+--------+-------+-------+------+-------+------+
  /// |          |SECONDLY|MINUTELY|HOURLY |DAILY  |WEEKLY|MONTHLY|YEARLY|
  /// +----------+--------+--------+-------+-------+------+-------+------+
  /// |BYMONTH   |Limit   |Limit   |Limit  |Limit  |Limit |Limit  |Expand|
  /// +----------+--------+--------+-------+-------+------+-------+------+
  /// |BYWEEKNO  |N/A     |N/A     |N/A    |N/A    |N/A   |N/A    |Expand|
  /// +----------+--------+--------+-------+-------+------+-------+------+
  /// |BYYEARDAY |Limit   |Limit   |Limit  |N/A    |N/A   |N/A    |Expand|
  /// +----------+--------+--------+-------+-------+------+-------+------+
  /// |BYMONTHDAY|Limit   |Limit   |Limit  |Limit  |N/A   |Expand |Expand|
  /// +----------+--------+--------+-------+-------+------+-------+------+
  /// |BYDAY     |Limit   |Limit   |Limit  |Limit  |Expand|Note 1 |Note 2|
  /// +----------+--------+--------+-------+-------+------+-------+------+
  /// |BYHOUR    |Limit   |Limit   |Limit  |Expand |Expand|Expand |Expand|
  /// +----------+--------+--------+-------+-------+------+-------+------+
  /// |BYMINUTE  |Limit   |Limit   |Expand |Expand |Expand|Expand |Expand|
  /// +----------+--------+--------+-------+-------+------+-------+------+
  /// |BYSECOND  |Limit   |Expand  |Expand |Expand |Expand|Expand |Expand|
  /// +----------+--------+--------+-------+-------+------+-------+------+
  /// |BYSETPOS  |Limit   |Limit   |Limit  |Limit  |Limit |Limit  |Limit |
  /// +----------+--------+--------+-------+-------+------+-------+------+
  /// ```
  ///
  /// Note 1:  Limit if BYMONTHDAY is present; otherwise, special expand
  ///          for MONTHLY.
  ///
  /// Note 2:  Limit if BYYEARDAY or BYMONTHDAY is present; otherwise,
  ///          special expand for WEEKLY if BYWEEKNO present; otherwise,
  ///          special expand for MONTHLY if BYMONTH present; otherwise,
  ///          special expand for YEARLY.
  ///
  /// Compare [byMinute]
  final List<int>? bySecond;

  /// Checks if there is at least one [bySecond] modifier
  ///
  /// Compare [bySecond]
  bool get hasBySecond => bySecond?.isNotEmpty ?? false;

  /// `BYMINUTE` modifier / limiter for this Recurrence.
  ///
  /// Compare [bySecond] for details
  final List<int>? byMinute;

  /// Checks if there is at least one [byMinute] modifier
  ///
  /// Compare [byMinute]
  bool get hasByMinute => byMinute?.isNotEmpty ?? false;

  /// `BYHOUR` modifier / limiter for this Recurrence.
  ///
  /// Compare [bySecond] for details
  final List<int>? byHour;

  /// Checks if there is at least one [byHour] modifier
  ///
  /// Compare [byHour]
  bool get hasByHour => byHour?.isNotEmpty == true;

  /// `BYDAY` modifier / limiter for this Recurrence.
  ///
  /// Compare [bySecond] and [ByDayRule] for details
  final List<ByDayRule>? byWeekDay;

  /// Checks if there is at least one [byWeekDay] modifier
  ///
  /// Compare [byWeekDay]
  bool get hasByWeekDay => byWeekDay?.isNotEmpty ?? false;

  /// Checks if there is at least one by week day modifier with a
  /// weeks number set.
  ///
  /// Compare [hasByWeekDay], [byWeekDay]
  bool get hasByWeekDayWithWeeks {
    final byWeekDay = this.byWeekDay;

    return byWeekDay != null && byWeekDay.any((day) => day.week != null);
  }

  /// `BYMONTHDAY` modifier / limiter for this Recurrence.
  final List<int>? byMonthDay;

  /// Checks if this rule has at least one byYearDay modifier
  ///
  /// Compare [byMonthDay]
  bool get hasByMonthDay => byMonthDay?.isNotEmpty == true;

  /// `BYYEARDAY` modifier / limiter for this Recurrence.
  final List<int>? byYearDay;

  /// Checks if this rule has at least one byYearDay modifier
  ///
  /// Compare [byYearDay]
  bool get hasByYearDay => byYearDay?.isNotEmpty == true;

  /// `BYWEEKNO` modifier / limiter for this Recurrence.
  ///
  /// Compare [bySecond] for details
  final List<int>? byWeek;

  /// Checks if this rule has at least one byWeek modifier
  ///
  /// Compare [byWeek]
  bool get hasByWeek => byWeek?.isNotEmpty == true;

  /// `BYMONTH` modifier / limiter for this Recurrence.
  ///
  /// Compare [bySecond] for details
  final List<int>? byMonth;

  /// Checks if this rule has at least one byMonth modifier
  ///
  /// Compare [byMonth]
  bool get hasByMonth => byMonth?.isNotEmpty == true;

  /// BYSETPOS modifier / limiter for this Recurrence.
  ///
  /// The BYSETPOS rule part specifies a COMMA-separated list of values
  /// that corresponds to the nth occurrence within the set of
  /// recurrence instances specified by the rule.  BYSETPOS operates on
  /// a set of recurrence instances in one interval of the recurrence
  /// rule.  For example, in a WEEKLY rule, the interval would be one
  /// week A set of recurrence instances starts at the beginning of the
  /// interval defined by the FREQ rule part.  Valid values are 1 to 366
  /// or -366 to -1.  It MUST only be used in conjunction with another
  /// BYxxx rule part.  For example "the last work day of the month"
  /// could be represented as:
  ///
  /// `FREQ=MONTHLY;BYDAY=MO,TU,WE,TH,FR;BYSETPOS=-1`
  final List<int>? bySetPos;

  /// Checks if this rule has `BYSETPOS` rules
  ///
  /// Compare [bySetPos]
  bool get hasBySetPos => bySetPos?.isNotEmpty == true;

  final int? _startOfWorkWeek;

  /// The `WKST` rule part specifies the day on which the workweek starts,
  /// defaults to [DateTime.monday].
  ///
  /// Valid values are MO, TU, WE, TH, FR, SA, and SU.  This is
  /// significant when a WEEKLY "RRULE" has an interval greater than 1,
  /// and a BYDAY rule part is specified.  This is also significant when
  /// in a YEARLY "RRULE" when a BYWEEKNO rule part is specified.  The
  /// default value is MO.
  int get startOfWorkWeek => _startOfWorkWeek ?? DateTime.monday;

  /// Checks if this recurrence rule has any `BY-XXX` limiter/specifier.
  bool get hasByLimiter =>
      bySecond != null ||
      byMinute != null ||
      byHour != null ||
      byWeekDay != null ||
      byMonthDay != null ||
      byYearDay != null ||
      byWeek != null ||
      byMonth != null ||
      byYearDay != null ||
      bySetPos != null;

  /// Checks if this recurrence rule is limited,
  /// either by [count] or by [until].
  bool get hasLimit => count != null || until != null;

  /// Copies this recurrence rule with the given attributes.
  ///
  /// Set [copyByRules] to `false` to not copy any by-rules.
  /// This defaults to `true`, meaning by rules are copied by default.
  ///
  /// Set [copyUntil] to `false` to not copy the until attribute.
  /// This defaults to `true`, meaning the until attribute is copied by default.
  Recurrence copyWith({
    RecurrenceFrequency? frequency,
    DateTime? until,
    int? count,
    int? interval,
    List<int>? bySecond,
    List<int>? byMinute,
    List<int>? byHour,
    List<ByDayRule>? byWeekDay,
    List<int>? byYearDay,
    List<int>? byWeek,
    List<int>? byMonth,
    List<int>? byMonthDay,
    int? startOfWorkWeek,
    List<int>? bySetPos,
    bool copyByRules = true,
    bool copyUntil = true,
  }) {
    if (!copyByRules) {
      return Recurrence(
        frequency ?? this.frequency,
        until: until ?? (copyUntil ? this.until : null),
        count: count ?? this.count,
        interval: interval ?? _interval,
        startOfWorkWeek: startOfWorkWeek ?? _startOfWorkWeek,
        bySecond: bySecond,
        byMinute: byMinute,
        byHour: byHour,
        byWeekDay: byWeekDay,
        byMonthDay: byMonthDay,
        byYearDay: byYearDay,
        byWeek: byWeek,
        byMonth: byMonth,
        bySetPos: bySetPos,
      );
    }

    return Recurrence(
      frequency ?? this.frequency,
      until: until ?? (copyUntil ? this.until : null),
      count: count ?? this.count,
      interval: interval ?? _interval,
      startOfWorkWeek: startOfWorkWeek ?? _startOfWorkWeek,
      bySecond: bySecond ?? this.bySecond,
      byMinute: byMinute ?? this.byMinute,
      byHour: byHour ?? this.byHour,
      byWeekDay: byWeekDay ?? this.byWeekDay,
      byMonthDay: byMonthDay ?? this.byMonthDay,
      byYearDay: byYearDay ?? this.byYearDay,
      byWeek: byWeek ?? this.byWeek,
      byMonth: byMonth ?? this.byMonth,
      bySetPos: bySetPos ?? this.bySetPos,
    );
  }

  /// Copies this recurrence rule without the specified [attribute].
  Recurrence copyWithout(RecurrenceAttribute attribute) {
    switch (attribute) {
      case RecurrenceAttribute.interval:
        return Recurrence(
          frequency,
          until: until,
          count: count,
          startOfWorkWeek: startOfWorkWeek,
          bySecond: bySecond,
          byMinute: byMinute,
          byHour: byHour,
          byWeekDay: byWeekDay,
          byMonthDay: byMonthDay,
          byYearDay: byYearDay,
          byWeek: byWeek,
          byMonth: byMonth,
          bySetPos: bySetPos,
        );
      case RecurrenceAttribute.count:
        return Recurrence(
          frequency,
          until: until,
          interval: interval,
          startOfWorkWeek: startOfWorkWeek,
          bySecond: bySecond,
          byMinute: byMinute,
          byHour: byHour,
          byWeekDay: byWeekDay,
          byMonthDay: byMonthDay,
          byYearDay: byYearDay,
          byWeek: byWeek,
          byMonth: byMonth,
          bySetPos: bySetPos,
        );
      case RecurrenceAttribute.until:
        return Recurrence(
          frequency,
          count: count,
          interval: interval,
          startOfWorkWeek: startOfWorkWeek,
          bySecond: bySecond,
          byMinute: byMinute,
          byHour: byHour,
          byWeekDay: byWeekDay,
          byMonthDay: byMonthDay,
          byYearDay: byYearDay,
          byWeek: byWeek,
          byMonth: byMonth,
          bySetPos: bySetPos,
        );
      case RecurrenceAttribute.startOfWeek:
        return Recurrence(
          frequency,
          until: until,
          count: count,
          interval: interval,
          bySecond: bySecond,
          byMinute: byMinute,
          byHour: byHour,
          byWeekDay: byWeekDay,
          byMonthDay: byMonthDay,
          byYearDay: byYearDay,
          byWeek: byWeek,
          byMonth: byMonth,
          bySetPos: bySetPos,
        );
    }
  }

  @override
  int get hashCode =>
      frequency.index +
      (until?.millisecondsSinceEpoch ?? 0) +
      (count ?? 0) +
      (_interval ?? 0) +
      (bySecond?.length ?? 0) +
      (byMinute?.length ?? 0) +
      (byHour?.length ?? 0) +
      (byWeekDay?.length ?? 0) +
      (byMonthDay?.length ?? 0) +
      (byYearDay?.length ?? 0) +
      (byWeek?.length ?? 0) +
      (byMonth?.length ?? 0) +
      (_startOfWorkWeek ?? 0) +
      (bySetPos?.length ?? 0);

  @override
  bool operator ==(Object other) =>
      other is Recurrence &&
      other.frequency == frequency &&
      other.until == until &&
      other.count == count &&
      other._interval == _interval &&
      other.bySecond == bySecond &&
      other.byMinute == byMinute &&
      other.byHour == byHour &&
      other.byWeekDay == byWeekDay &&
      other.byMonthDay == byMonthDay &&
      other.byYearDay == byYearDay &&
      other.byWeek == byWeek &&
      other.byMonth == byMonth &&
      other._startOfWorkWeek == _startOfWorkWeek &&
      other.bySetPos == bySetPos;

  @override
  String toString() {
    final buffer = StringBuffer()
      ..write('FREQ=')
      ..write(frequency.name);
    final until = this.until;
    if (until != null) {
      buffer.write(';UNTIL=');
      DateHelper.renderDate(until, buffer);
    }
    if (count != null) {
      buffer
        ..write(';COUNT=')
        ..write(count);
    }
    if (_interval != null) {
      buffer
        ..write(';INTERVAL=')
        ..write(interval);
    }
    final bySecond = this.bySecond;
    if (bySecond != null) {
      buffer
        ..write(';BYSECOND=')
        ..write(bySecond.join(','));
    }
    final byMinute = this.byMinute;
    if (byMinute != null) {
      buffer
        ..write(';BYMINUTE=')
        ..write(byMinute.join(','));
    }
    final byHour = this.byHour;
    if (byHour != null) {
      buffer
        ..write(';BYHOUR=')
        ..write(byHour.join(','));
    }
    final byWeekDay = this.byWeekDay;
    if (byWeekDay != null) {
      buffer
        ..write(';BYDAY=')
        ..write(byWeekDay.join(','));
    }
    final byMonthDay = this.byMonthDay;
    if (byMonthDay != null) {
      buffer
        ..write(';BYMONTHDAY=')
        ..write(byMonthDay.join(','));
    }
    final byYearDay = this.byYearDay;
    if (byYearDay != null) {
      buffer
        ..write(';BYYEARDAY=')
        ..write(byYearDay.join(','));
    }
    final byWeek = this.byWeek;
    if (byWeek != null) {
      buffer
        ..write(';BYWEEK=')
        ..write(byWeek.join(','));
    }
    final byMonth = this.byMonth;
    if (byMonth != null) {
      buffer
        ..write(';BYMONTH=')
        ..write(byMonth.join(','));
    }
    final startOfWorkWeek = _startOfWorkWeek;
    if (startOfWorkWeek != null) {
      final days = ['MO', 'TU', 'WE', 'TH', 'FR', 'SA', 'SU'];
      buffer
        ..write(';WKST=')
        ..write(days[startOfWorkWeek - 1]);
    }
    final bySetPos = this.bySetPos;
    if (bySetPos != null) {
      buffer
        ..write(';BYSETPOS=')
        ..write(bySetPos.join(','));
    }

    return buffer.toString();
  }

  /// Tries to convert this recurrence rule to human readable text
  ///
  /// When you specify the optional [startDate], the week day will be
  /// taken into account for recurrences with a weekly frequency.
  ///
  /// You can specify the used [localization] directly, specify it via the
  /// [language] enum or set the [languageCode].
  /// By default US American English is used.
  ///
  /// For example
  /// `RRULE:FREQ=WEEKLY;COUNT=10` would be converted to
  /// `weekly, 10 times`, or when the start date falls on a Tuesday,
  /// `every Tuesday`, for example.
  String toHumanReadableText({
    DateTime? startDate,
    RruleL10n? localization,
    SupportedLanguage? language,
    String? languageCode,
  }) {
    final usedLocalization =
        localization ??
        ((language != null)
            ? RecurrenceRuleToTextEncoder.getForLanguage(language)
            : RecurrenceRuleToTextEncoder.getForLanguageCode(
                languageCode ?? 'en',
              ));
    final encoder = RecurrenceRuleToTextEncoder(usedLocalization);

    return encoder.convert(this, startDate: startDate);
  }

  static const _constByDayRules = <ByDayRule>[
    ByDayRule(DateTime.monday),
    ByDayRule(DateTime.tuesday),
    ByDayRule(DateTime.wednesday),
    ByDayRule(DateTime.thursday),
    ByDayRule(DateTime.friday),
    ByDayRule(DateTime.saturday),
    ByDayRule(DateTime.sunday),
  ];

  static int? _weekdayFromCodeUnits(int c0, int c1) {
    // MO, TU, WE, TH, FR, SA, SU
    switch (c0) {
      case 0x4D: // 'M'
        return c1 == 0x4F /* 'O' */ ? DateTime.monday : null;
      case 0x54: // 'T'
        if (c1 == 0x55 /* 'U' */ ) {
          return DateTime.tuesday;
        }
        if (c1 == 0x48 /* 'H' */ ) {
          return DateTime.thursday;
        }
        return null;
      case 0x57: // 'W'
        return c1 == 0x45 /* 'E' */ ? DateTime.wednesday : null;
      case 0x46: // 'F'
        return c1 == 0x52 /* 'R' */ ? DateTime.friday : null;
      case 0x53: // 'S'
        if (c1 == 0x41 /* 'A' */ ) {
          return DateTime.saturday;
        }
        if (c1 == 0x55 /* 'U' */ ) {
          return DateTime.sunday;
        }
        return null;
      default:
        return null;
    }
  }

  static int? _tryParseIntSlice(String s, int start, int end) {
    if (start >= end) {
      return null;
    }
    var i = start;
    var isNegative = false;
    final first = s.codeUnitAt(i);
    if (first == 0x2D /* '-' */ ) {
      isNegative = true;
      i++;
    } else if (first == 0x2B /* '+' */ ) {
      i++;
    }
    if (i >= end) {
      return null;
    }
    var value = 0;
    for (; i < end; i++) {
      final digit = s.codeUnitAt(i) ^ 0x30;
      if (digit > 9) {
        return null;
      }
      value = value * 10 + digit;
    }
    return isNegative ? -value : value;
  }

  static int _parseIntSlice(
    String content,
    int start,
    int end,
    String fieldName,
  ) {
    final value = _tryParseIntSlice(content, start, end);
    if (value == null) {
      throw FormatException(
        'Invalid $fieldName ${content.substring(start, end)} '
        'in RECUR $content',
      );
    }
    return value;
  }

  static List<int> _parseIntListSlice(
    String content,
    int start,
    int end,
    String fieldName,
    int allowedMin,
    int allowedMax, [
    int? disallowedValue,
  ]) {
    if (start >= end) {
      throw FormatException('Invalid $fieldName: empty in RECUR $content');
    }
    final result = <int>[];
    var itemStart = start;
    for (var i = start; i <= end; i++) {
      if (i == end || content.codeUnitAt(i) == 0x2C /* ',' */ ) {
        final value = _tryParseIntSlice(content, itemStart, i);
        if (value == null ||
            value < allowedMin ||
            value > allowedMax ||
            value == disallowedValue) {
          throw FormatException(
            'Invalid $fieldName: part ${content.substring(itemStart, i)} '
            'invalid in RECUR $content',
          );
        }
        result.add(value);
        itemStart = i + 1;
      }
    }
    if (result.isEmpty) {
      throw FormatException('Invalid $fieldName: empty in RECUR $content');
    }
    return result;
  }

  static List<ByDayRule> _parseByWeekDaySlice(
    String content,
    int start,
    int end,
  ) {
    final result = <ByDayRule>[];
    var itemStart = start;
    for (var i = start; i <= end; i++) {
      if (i == end || content.codeUnitAt(i) == 0x2C /* ',' */ ) {
        final itemLen = i - itemStart;
        if (itemLen < 2) {
          throw FormatException(
            'Invalid weekday in BYDAY rule part '
            '${content.substring(itemStart, i)} in RECUR $content',
          );
        }
        final day = _weekdayFromCodeUnits(
          content.codeUnitAt(i - 2),
          content.codeUnitAt(i - 1),
        );
        if (itemLen == 2) {
          if (day == null) {
            throw FormatException(
              'Invalid weekday ${content.substring(itemStart, i)} '
              'in BYDAY rule part in RECUR $content',
            );
          }
          result.add(_constByDayRules[day - 1]);
        } else {
          final week = _tryParseIntSlice(content, itemStart, i - 2);
          if (week == null || week == 0 || week > 53 || week < -53) {
            final weekText = content.substring(itemStart, i - 2);
            final text = content.substring(itemStart, i);
            throw FormatException(
              'Invalid week "$weekText" in BYDAY rule part "$text" '
              'in RECUR "$content"',
            );
          }
          if (day == null) {
            final dayText = content.substring(i - 2, i);
            final text = content.substring(itemStart, i);
            throw FormatException(
              'Invalid weekday $dayText in BYDAY rule part $text '
              'in RECUR $content',
            );
          }
          result.add(ByDayRule(day, week: week));
        }
        itemStart = i + 1;
      }
    }
    return result;
  }

  static RecurrenceFrequency _parseFrequencySlice(
    String content,
    int start,
    int end,
  ) {
    final len = end - start;
    if (len >= 5) {
      switch (content.codeUnitAt(start)) {
        case 0x44: // 'D' -> DAILY
          if (len == 5 &&
              content.codeUnitAt(start + 1) == 0x41 &&
              content.codeUnitAt(start + 2) == 0x49 &&
              content.codeUnitAt(start + 3) == 0x4C &&
              content.codeUnitAt(start + 4) == 0x59) {
            return RecurrenceFrequency.daily;
          }
          break;
        case 0x57: // 'W' -> WEEKLY
          if (len == 6 &&
              content.codeUnitAt(start + 1) == 0x45 &&
              content.codeUnitAt(start + 2) == 0x45 &&
              content.codeUnitAt(start + 3) == 0x4B &&
              content.codeUnitAt(start + 4) == 0x4C &&
              content.codeUnitAt(start + 5) == 0x59) {
            return RecurrenceFrequency.weekly;
          }
          break;
        case 0x4D: // 'M' -> MONTHLY or MINUTELY
          if (len == 7 &&
              content.codeUnitAt(start + 1) == 0x4F &&
              content.codeUnitAt(start + 2) == 0x4E &&
              content.codeUnitAt(start + 3) == 0x54 &&
              content.codeUnitAt(start + 4) == 0x48 &&
              content.codeUnitAt(start + 5) == 0x4C &&
              content.codeUnitAt(start + 6) == 0x59) {
            return RecurrenceFrequency.monthly;
          }
          if (len == 8 &&
              content.codeUnitAt(start + 1) == 0x49 &&
              content.codeUnitAt(start + 2) == 0x4E &&
              content.codeUnitAt(start + 3) == 0x55 &&
              content.codeUnitAt(start + 4) == 0x54 &&
              content.codeUnitAt(start + 5) == 0x45 &&
              content.codeUnitAt(start + 6) == 0x4C &&
              content.codeUnitAt(start + 7) == 0x59) {
            return RecurrenceFrequency.minutely;
          }
          break;
        case 0x59: // 'Y' -> YEARLY
          if (len == 6 &&
              content.codeUnitAt(start + 1) == 0x45 &&
              content.codeUnitAt(start + 2) == 0x41 &&
              content.codeUnitAt(start + 3) == 0x52 &&
              content.codeUnitAt(start + 4) == 0x4C &&
              content.codeUnitAt(start + 5) == 0x59) {
            return RecurrenceFrequency.yearly;
          }
          break;
        case 0x48: // 'H' -> HOURLY
          if (len == 6 &&
              content.codeUnitAt(start + 1) == 0x4F &&
              content.codeUnitAt(start + 2) == 0x55 &&
              content.codeUnitAt(start + 3) == 0x52 &&
              content.codeUnitAt(start + 4) == 0x4C &&
              content.codeUnitAt(start + 5) == 0x59) {
            return RecurrenceFrequency.hourly;
          }
          break;
        case 0x53: // 'S' -> SECONDLY
          if (len == 8 &&
              content.codeUnitAt(start + 1) == 0x45 &&
              content.codeUnitAt(start + 2) == 0x43 &&
              content.codeUnitAt(start + 3) == 0x4F &&
              content.codeUnitAt(start + 4) == 0x4E &&
              content.codeUnitAt(start + 5) == 0x44 &&
              content.codeUnitAt(start + 6) == 0x4C &&
              content.codeUnitAt(start + 7) == 0x59) {
            return RecurrenceFrequency.secondly;
          }
          break;
      }
    }
    throw FormatException(
      'Invalid FREQ value: ${content.substring(start, end)} in RECUR $content',
    );
  }

  /// Parses the [Recurrence] role from the given [content].
  // ignore: prefer_constructors_over_static_methods
  static Recurrence parse(String content) {
    RecurrenceFrequency? frequency;
    DateTime? until;
    int? count;
    int? interval;
    List<int>? bySecond;
    List<int>? byMinute;
    List<int>? byHour;
    List<ByDayRule>? byWeekDay;
    List<int>? byMonthDay;
    List<int>? byYearDay;
    List<int>? byWeek;
    List<int>? byMonth;
    List<int>? bySetPos;
    int? startOfWorkWeek;

    final len = content.length;
    var segStart = 0;
    while (segStart < len) {
      var eqIndex = -1;
      var segEnd = len;
      for (var i = segStart; i < len; i++) {
        final c = content.codeUnitAt(i);
        if (c == 0x3D /* '=' */ && eqIndex == -1) {
          eqIndex = i;
        } else if (c == 0x3B /* ';' */ ) {
          segEnd = i;
          break;
        }
      }
      if (eqIndex != -1) {
        final keyLen = eqIndex - segStart;
        final valStart = eqIndex + 1;
        final c0 = content.codeUnitAt(segStart);
        switch (keyLen) {
          case 4:
            if (c0 == 0x46 /* 'F' */ ) {
              // FREQ
              frequency = _parseFrequencySlice(content, valStart, segEnd);
            } else if (c0 == 0x57 /* 'W' */ ) {
              // WKST
              if (segEnd - valStart != 2) {
                throw FormatException(
                  'Invalid weekday ${content.substring(valStart, segEnd)} '
                  'in WKST part of RECUR $content',
                );
              }
              final wkst = _weekdayFromCodeUnits(
                content.codeUnitAt(valStart),
                content.codeUnitAt(valStart + 1),
              );
              if (wkst == null) {
                throw FormatException(
                  'Invalid weekday ${content.substring(valStart, segEnd)} '
                  'in WKST part of RECUR $content',
                );
              }
              startOfWorkWeek = wkst;
            }
            break;
          case 5:
            if (c0 == 0x55 /* 'U' */ ) {
              // UNTIL
              if (segEnd - valStart > 8 &&
                  content.codeUnitAt(valStart + 8) == 0x54 /* 'T' */ ) {
                until = DateHelper._parseDateTimeSlice(
                  content,
                  valStart,
                  segEnd,
                );
              } else {
                until = DateHelper._parseDateSlice(content, valStart, segEnd);
              }
            } else if (c0 == 0x43 /* 'C' */ ) {
              // COUNT
              count = _parseIntSlice(content, valStart, segEnd, 'COUNT');
            } else if (c0 == 0x42 /* 'B' */ ) {
              // BYDAY
              byWeekDay = _parseByWeekDaySlice(content, valStart, segEnd);
            }
            break;
          case 6:
            // BYHOUR
            byHour = _parseIntListSlice(
              content,
              valStart,
              segEnd,
              'BYHOUR',
              0,
              23,
            );
            break;
          case 7:
            // BYMONTH
            byMonth = _parseIntListSlice(
              content,
              valStart,
              segEnd,
              'BYMONTH',
              1,
              12,
            );
            break;
          case 8:
            if (c0 == 0x49 /* 'I' */ ) {
              // INTERVAL
              interval = _parseIntSlice(content, valStart, segEnd, 'INTERVAL');
            } else {
              final c2 = content.codeUnitAt(segStart + 2);
              if (c2 == 0x4D /* 'M' */ ) {
                // BYMINUTE
                byMinute = _parseIntListSlice(
                  content,
                  valStart,
                  segEnd,
                  'BYMINUTE',
                  0,
                  59,
                );
              } else if (c2 == 0x57 /* 'W' */ ) {
                // BYWEEKNO
                byWeek = _parseIntListSlice(
                  content,
                  valStart,
                  segEnd,
                  'BYWEEKNO',
                  -53,
                  53,
                  0,
                );
              } else if (content.codeUnitAt(segStart + 4) == 0x54 /* 'T' */ ) {
                // BYSETPOS
                bySetPos = _parseIntListSlice(
                  content,
                  valStart,
                  segEnd,
                  'BYSETPOS',
                  -366,
                  366,
                  0,
                );
              } else {
                // BYSECOND
                bySecond = _parseIntListSlice(
                  content,
                  valStart,
                  segEnd,
                  'BYSECOND',
                  0,
                  60,
                );
              }
            }
            break;
          case 9:
            // BYYEARDAY
            byYearDay = _parseIntListSlice(
              content,
              valStart,
              segEnd,
              'BYYEARDAY',
              -366,
              366,
              0,
            );
            break;
          case 10:
            // BYMONTHDAY
            byMonthDay = _parseIntListSlice(
              content,
              valStart,
              segEnd,
              'BYMONTHDAY',
              -31,
              31,
              0,
            );
            break;
        }
      }
      segStart = segEnd + 1;
    }

    if (frequency == null) {
      throw FormatException('No FREQ found in RECUR $content');
    }

    return Recurrence(
      frequency,
      until: until,
      count: count,
      interval: interval,
      bySecond: bySecond,
      byMinute: byMinute,
      byHour: byHour,
      byWeekDay: byWeekDay,
      byMonthDay: byMonthDay,
      byYearDay: byYearDay,
      byWeek: byWeek,
      byMonth: byMonth,
      bySetPos: bySetPos,
      startOfWorkWeek: startOfWorkWeek,
    );
  }
}

/// Contains BYDAY weekday rules
class ByDayRule {
  /// Creates a new BYDAY rule
  const ByDayRule(this.weekday, {this.week});

  /// Weekday 1 = Monday / DateTime.monday, 7 = Sunday / DateTime.sunday
  final int weekday;

  /// The week, e.g. 1 for first week, 2 for the second week, -1 for the
  /// last week, -2 for the second last week, etc
  ///
  /// This value is relative to the DTSTART / DateTimeStart's month property
  final int? week;

  /// Checks if this rule has a week number
  ///
  /// Compare [week]
  bool get hasWeekNumber => week != null;

  @override
  int get hashCode => weekday + (week ?? 0) * 10;

  @override
  bool operator ==(Object other) =>
      other is ByDayRule && other.weekday == weekday && other.week == week;

  @override
  String toString() {
    final buffer = StringBuffer();
    if (week != null) {
      buffer.write(week);
    }
    switch (weekday) {
      case DateTime.monday:
        buffer.write('MO');
        break;
      case DateTime.tuesday:
        buffer.write('TU');
        break;
      case DateTime.wednesday:
        buffer.write('WE');
        break;
      case DateTime.thursday:
        buffer.write('TH');
        break;
      case DateTime.friday:
        buffer.write('FR');
        break;
      case DateTime.saturday:
        buffer.write('SA');
        break;
      case DateTime.sunday:
        buffer.write('SU');
        break;
      default:
        throw FormatException('Invalid day $weekday - must be between 1 and 7');
    }

    return buffer.toString();
  }
}

/// Extends iterables of [ByDayRule] with week number helpers.
extension ExtensionOnByDayRuleIteration on Iterable<ByDayRule> {
  /// Checks if any rule has a week number set.
  bool get anyHasWeekNumber => any((rule) => rule.hasWeekNumber);

  /// Checks if no rule has a week number set.
  bool get noneHasWeekNumber => !anyHasWeekNumber;
}

/// Represents a time of day with hour, minute and second components.
class TimeOfDayWithSeconds {
  /// Creates a new time of day with the given [hour], [minute] and [second].
  TimeOfDayWithSeconds({
    required this.hour,
    required this.minute,
    required this.second,
  });

  /// The hour component.
  final int hour;

  /// The minute component.
  final int minute;

  /// The second component.
  final int second;

  @override
  int get hashCode => hour + minute * 60 + second * 60 * 60;

  @override
  bool operator ==(Object other) =>
      other is TimeOfDayWithSeconds &&
      other.hour == hour &&
      other.minute == minute &&
      other.second == second;

  /// Renders this time as `HHMMSS` into the given [buffer].
  void render(StringBuffer buffer) {
    if (hour < 10) {
      buffer.write('0');
    }
    buffer.write(hour);
    if (minute < 10) {
      buffer.write('0');
    }
    buffer.write(minute);
    if (second < 10) {
      buffer.write('0');
    }
    buffer.write(second);
  }

  @override
  String toString() {
    final buffer = StringBuffer();
    render(buffer);
    return buffer.toString();
  }

  /// Parses a `HHMMSS` time definition from the given [content].
  // ignore: prefer_constructors_over_static_methods
  static TimeOfDayWithSeconds parse(String content) {
    if (content.length < 6) {
      throw FormatException('Invalid time definition: $content');
    }
    final hour = DateHelper._parse2Digits(content, 0);
    final minute = DateHelper._parse2Digits(content, 2);
    final second = DateHelper._parse2Digits(content, 4);
    if (hour < 0 || minute < 0 || second < 0) {
      throw FormatException('Invalid time definition: $content');
    }
    return TimeOfDayWithSeconds(hour: hour, minute: minute, second: second);
  }

  /// Renders the time part of the given [value] as `HHMMSS` into the
  /// [buffer].
  static void renderTime(DateTime value, StringBuffer buffer) {
    if (value.hour < 10) {
      buffer.write('0');
    }
    buffer.write(value.hour);
    if (value.minute < 10) {
      buffer.write('0');
    }
    buffer.write(value.minute);
    if (value.second < 10) {
      buffer.write('0');
    }
    buffer.write(value.second);
  }
}

/// This value type is used to identify properties that contain an offset
/// from UTC to local time.
class UtcOffset {
  /// Parses a UTC offset from the given [content], e.g. `+0130`.
  UtcOffset(String content)
    : offsetHour = _parseHour(content),
      offsetMinute = _parseMinute(content);

  /// Creates a UTC offset from the given [offsetHour] and [offsetMinute].
  UtcOffset.value({required this.offsetHour, required this.offsetMinute});

  /// The hour offset from UTC.
  final int offsetHour;

  /// The minute offset from UTC.
  final int offsetMinute;

  @override
  String toString() {
    final buffer = StringBuffer();
    if (offsetHour < 0) {
      buffer.write('-');
    }
    final hour = offsetHour.abs();
    if (hour < 10) {
      buffer.write('0');
    }
    buffer.write(hour);
    if (offsetMinute < 10) {
      buffer.write('0');
    }
    buffer.write(offsetMinute);
    return buffer.toString();
  }

  @override
  int get hashCode => offsetHour + (offsetMinute * 60);

  @override
  bool operator ==(Object other) =>
      other is UtcOffset &&
      other.offsetHour == offsetHour &&
      other.offsetMinute == offsetMinute;

  static int _parseHour(String content) {
    if (content.length < 5) {
      throw FormatException('Invalid UTC-OFFSET $content');
    }
    final sign = content.codeUnitAt(0);
    final absHour = DateHelper._parse2Digits(content, 1);
    if (absHour >= 0 && (sign == 0x2B /* '+' */ || sign == 0x2D /* '-' */ )) {
      return sign == 0x2D ? -absHour : absHour;
    }
    final hourText = content.substring(0, 3);
    final hour = int.tryParse(hourText);
    if (hour == null) {
      throw FormatException('Invalid UTC-OFFSET $content');
    }
    return hour;
  }

  static int _parseMinute(String content) {
    if (content.length < 5) {
      throw FormatException('Invalid UTC-OFFSET $content');
    }
    final minute = DateHelper._parse2Digits(content, 3);
    if (minute < 0) {
      throw FormatException('Invalid UTC-OFFSET $content');
    }
    return minute;
  }
}

/// Helper for parsing and rendering date and date-time values.
class DateHelper {
  DateHelper._();

  static int _parse2Digits(String content, int start) {
    final d0 = content.codeUnitAt(start) ^ 0x30;
    final d1 = content.codeUnitAt(start + 1) ^ 0x30;
    if (d0 > 9 || d1 > 9) {
      return -1;
    }
    return d0 * 10 + d1;
  }

  static int _parse4Digits(String content, int start) {
    final d0 = content.codeUnitAt(start) ^ 0x30;
    final d1 = content.codeUnitAt(start + 1) ^ 0x30;
    final d2 = content.codeUnitAt(start + 2) ^ 0x30;
    final d3 = content.codeUnitAt(start + 3) ^ 0x30;
    if (d0 > 9 || d1 > 9 || d2 > 9 || d3 > 9) {
      return -1;
    }
    return d0 * 1000 + d1 * 100 + d2 * 10 + d3;
  }

  static DateTime _parseDateSlice(String content, int start, int end) {
    if (end - start != 8) {
      throw FormatException(
        'Invalid date definition: ${content.substring(start, end)}',
      );
    }
    final year = _parse4Digits(content, start);
    final month = _parse2Digits(content, start + 4);
    final day = _parse2Digits(content, start + 6);
    if (year < 0 || month < 0 || day < 0) {
      throw FormatException(
        'Invalid date definition: ${content.substring(start, end)}',
      );
    }
    return DateTime(year, month, day);
  }

  static DateTime _parseDateTimeSlice(String content, int start, int end) {
    if (end - start < 15 || content.codeUnitAt(start + 8) != 0x54 /* 'T' */ ) {
      throw FormatException(
        'Invalid datetime definition: ${content.substring(start, end)}',
      );
    }
    final year = _parse4Digits(content, start);
    final month = _parse2Digits(content, start + 4);
    final day = _parse2Digits(content, start + 6);
    final hour = _parse2Digits(content, start + 9);
    final minute = _parse2Digits(content, start + 11);
    final second = _parse2Digits(content, start + 13);
    if (year < 0 ||
        month < 0 ||
        day < 0 ||
        hour < 0 ||
        minute < 0 ||
        second < 0) {
      throw FormatException(
        'Invalid datetime definition: ${content.substring(start, end)}',
      );
    }
    final isUtc = content.codeUnitAt(end - 1) == 0x5A; /* 'Z' */
    if (isUtc) {
      return DateTime.utc(year, month, day, hour, minute, second);
    }
    return DateTime(year, month, day, hour, minute, second);
  }

  static String? _lastDateTimeInput;
  static DateTime? _lastDateTimeValue;

  /// Parses a date of format `YYYYMMDD` from the given [content].
  static DateTime parseDate(String content) =>
      _parseDateSlice(content, 0, content.length);

  /// Parses a date-time of format `YYYYMMDDTHHMMSS[Z]` from the given
  /// [content].
  static DateTime parseDateTime(String content) {
    if (content == _lastDateTimeInput) {
      return _lastDateTimeValue!;
    }
    final parsed = _parseDateTimeSlice(content, 0, content.length);
    _lastDateTimeInput = content;
    _lastDateTimeValue = parsed;
    return parsed;
  }

  /// Renders the date part of the given [value] as `YYYYMMDD` into the
  /// [buffer].
  static void renderDate(DateTime value, StringBuffer buffer) {
    if (value.year < 10) {
      buffer.write('000');
    } else if (value.year < 100) {
      buffer.write('00');
    } else if (value.year < 1000) {
      buffer.write('0');
    }
    buffer.write(value.year);
    if (value.month < 10) {
      buffer.write('0');
    }
    buffer.write(value.month);
    if (value.day < 10) {
      buffer.write('0');
    }
    buffer.write(value.day);
  }

  /// Converts the [value] to an iCalendar date-time string.
  static String toDateTimeString(DateTime value) {
    final buffer = StringBuffer();
    renderDate(value, buffer);
    buffer.write('T');
    TimeOfDayWithSeconds.renderTime(value, buffer);
    if (value.isUtc) {
      buffer.write('Z');
    }

    return buffer.toString();
  }
}

/// Contains either a date-time or a duration value.
class DateTimeOrDuration {
  /// Creates a new value that contains either [dateTime] or [duration], but
  /// not both.
  DateTimeOrDuration(this.dateTime, this.duration)
    : assert(
        dateTime != null || duration != null,
        'Either duration or dateTime must be set',
      ),
      assert(
        !(duration != null && dateTime != null),
        'Either duration or dateTime must be set, but not both',
      );

  /// The date-time value, when this is a date-time.
  final DateTime? dateTime;

  /// The duration value, when this is a duration.
  final IsoDuration? duration;

  @override
  String toString() {
    final dateTime = this.dateTime;

    return dateTime != null
        ? DateHelper.toDateTimeString(dateTime)
        : duration?.toString() ?? '';
  }

  /// Parses the [textValue] according to the given value [type].
  // ignore: prefer_constructors_over_static_methods
  static DateTimeOrDuration parse(String textValue, ValueType type) {
    DateTime? dateTime;
    IsoDuration? duration;
    if (type == ValueType.dateTime) {
      dateTime = DateHelper.parseDateTime(textValue);
    } else if (type == ValueType.date) {
      dateTime = DateHelper.parseDate(textValue);
    } else if (type == ValueType.duration) {
      duration = IsoDuration.parse(textValue);
    } else {
      throw FormatException(
        'Unsupported type for DateTimeOrDuration: $type with text '
        '[$textValue].',
      );
    }
    return DateTimeOrDuration(dateTime, duration);
  }
}

/// Contains a precise period of time.
class Period {
  /// Creates a period with the given [startDate] and either [duration] or
  /// [endDate].
  Period(this.startDate, {this.duration, this.endDate})
    : assert(
        duration != null || endDate != null,
        'Either duration or endDate must be set.',
      ),
      assert(
        !(duration != null && endDate != null),
        'Not both duration and endDate can be set at the same time.',
      );

  /// Parses a period from the given [content].
  factory Period.text(String content) => parse(content);

  /// The startdate
  final DateTime startDate;

  /// The duration
  ///
  /// Either the [duration] or the [endDate] will be defined.
  final IsoDuration? duration;

  /// The end date
  ///
  /// Either the [duration] or the [endDate] will be defined.
  final DateTime? endDate;

  static int _getSeparatorIndex(String content) {
    final separatorIndex = content.indexOf('/');
    if (separatorIndex == -1) {
      throw FormatException(
        'Invalid period definition, no / separator found in $content',
      );
    }
    return separatorIndex;
  }

  /// Parses a period from the given [textValue].
  // ignore: prefer_constructors_over_static_methods
  static Period parse(String textValue) {
    final separatorIndex = _getSeparatorIndex(textValue);
    final startDate = DateHelper._parseDateTimeSlice(
      textValue,
      0,
      separatorIndex,
    );
    final endStart = separatorIndex + 1;
    final len = textValue.length;
    if (endStart < len &&
        (textValue.codeUnitAt(endStart) == 0x50 /* 'P' */ ||
            textValue.codeUnitAt(endStart) == 0x2D /* '-' */ ||
            textValue.codeUnitAt(endStart) == 0x2B /* '+' */ )) {
      return Period(
        startDate,
        duration: IsoDuration._parseSlice(textValue, endStart, len),
      );
    }
    return Period(
      startDate,
      endDate: DateHelper._parseDateTimeSlice(textValue, endStart, len),
    );
  }
}

/// ISO 8601 compliant duration
class IsoDuration {
  /// Creates a new ISO duration from the given components.
  IsoDuration({
    this.years = 0,
    this.months = 0,
    this.weeks = 0,
    this.days = 0,
    this.hours = 0,
    this.minutes = 0,
    this.seconds = 0,
    this.isNegativeDuration = false,
  });

  /// The number of years.
  final int years;

  /// The number of months.
  final int months;

  /// The number of weeks.
  final int weeks;

  /// The number of days.
  final int days;

  /// The number of hours.
  final int hours;

  /// The number of minutes.
  final int minutes;

  /// The number of seconds.
  final int seconds;

  /// Whether this is a negative duration.
  final bool isNegativeDuration;

  @override
  int get hashCode =>
      years +
      months * 12 +
      weeks * 53 +
      days * 366 +
      hours * 24 +
      minutes * 60 +
      seconds * 600;

  @override
  bool operator ==(Object other) =>
      other is IsoDuration &&
      other.years == years &&
      other.months == months &&
      other.weeks == weeks &&
      other.days == days &&
      other.hours == hours &&
      other.minutes == minutes &&
      other.seconds == seconds;

  @override
  String toString() {
    final buffer = StringBuffer();
    if (isNegativeDuration) {
      buffer.write('-');
    }
    buffer.write('P');
    if (years != 0) {
      buffer
        ..write(years)
        ..write('Y');
    }
    if (months != 0) {
      buffer
        ..write(months)
        ..write('M');
    }
    if (weeks != 0) {
      buffer
        ..write(weeks)
        ..write('W');
    }
    if (days != 0) {
      buffer
        ..write(days)
        ..write('D');
    }
    if (hours != 0 || minutes != 0 || seconds != 0 || buffer.length == 1) {
      buffer
        ..write('T')
        ..write(hours)
        ..write('H')
        ..write(minutes)
        ..write('M')
        ..write(seconds)
        ..write('S');
    }
    return buffer.toString();
  }

  /// Converts this ISO duration to an approximate Dart duration.
  ///
  /// The `days` are converted by assuming 365 days per year and 30 days
  /// per month: `days: years * 365 + months * 30 + weeks * 7 + days`
  /// Compare [addTo] for a better handling of this duration.
  Duration toDuration() => Duration(
    days: years * 365 + months * 30 + weeks * 7 + days,
    hours: hours,
    minutes: minutes,
    seconds: seconds,
  );

  /// Adds this duration to the given [input] DateTime.
  ///
  /// This is adding this duration precisely and is better than
  /// [toDuration] in most cases.
  DateTime addTo(DateTime input) {
    var y = input.year + years;
    var m = input.month + months;
    while (m > 12) {
      y++;
      m -= 12;
    }
    final intermediate = DateTime(
      y,
      m,
      input.day,
      input.hour,
      input.minute,
      input.second,
      input.millisecond,
      input.microsecond,
    );
    final duration = Duration(
      days: weeks * 7 + days,
      hours: hours,
      minutes: minutes,
      seconds: seconds,
    );

    return intermediate.add(duration);
  }

  // ignore: prefer_constructors_over_static_methods
  static IsoDuration _parseSlice(String textValue, int start, int end) {
    if (end - start < 2) {
      throw FormatException(
        'duration content needs to start with P, $textValue is invalid',
      );
    }
    var i = start;
    var isNegativeDuration = false;
    final first = textValue.codeUnitAt(i);
    if (first == 0x2D /* '-' */ ) {
      isNegativeDuration = true;
      i++;
    } else if (first == 0x2B /* '+' */ ) {
      i++;
    }
    if (i >= end || textValue.codeUnitAt(i) != 0x50 /* 'P' */ ) {
      throw FormatException(
        'duration content needs to start with P, $textValue is invalid',
      );
    }
    i++; // skip 'P'
    var years = 0, months = 0, weeks = 0, days = 0;
    var hours = 0, minutes = 0, seconds = 0;
    var isTime = false;
    var currentVal = 0;
    var hasDigits = false;

    for (; i < end; i++) {
      final c = textValue.codeUnitAt(i);
      final digit = c ^ 0x30;
      if (digit <= 9) {
        currentVal = currentVal * 10 + digit;
        hasDigits = true;
      } else if (c == 0x54 /* 'T' */ ) {
        if (hasDigits) {
          throw FormatException('Invalid duration: $textValue');
        }
        isTime = true;
      } else {
        if (!hasDigits) {
          throw FormatException('Invalid duration: $textValue');
        }
        if (!isTime) {
          if (c == 0x59 /* 'Y' */ ) {
            years = currentVal;
          } else if (c == 0x4D /* 'M' */ ) {
            months = currentVal;
          } else if (c == 0x57 /* 'W' */ ) {
            weeks = currentVal;
          } else if (c == 0x44 /* 'D' */ ) {
            days = currentVal;
          } else {
            throw FormatException('Invalid duration: $textValue');
          }
        } else {
          if (c == 0x48 /* 'H' */ ) {
            hours = currentVal;
          } else if (c == 0x4D /* 'M' */ ) {
            minutes = currentVal;
          } else if (c == 0x53 /* 'S' */ ) {
            seconds = currentVal;
          } else {
            throw FormatException('Invalid duration: $textValue');
          }
        }
        currentVal = 0;
        hasDigits = false;
      }
    }

    return IsoDuration(
      years: years,
      months: months,
      weeks: weeks,
      days: days,
      hours: hours,
      minutes: minutes,
      seconds: seconds,
      isNegativeDuration: isNegativeDuration,
    );
  }

  static String? _lastInput1;
  static IsoDuration? _lastDuration1;
  static String? _lastInput2;
  static IsoDuration? _lastDuration2;

  /// Parses the given [textValue] into a duration.
  ///
  /// The formmat is defined as `P[n]Y[n]M[n]DT[n]H[n]M[n]S`
  /// Example: `P3WT1H` means 3 weeks and 1 hour.
  /// Compare https://en.wikipedia.org/wiki/ISO_8601#Durations
  // ignore: prefer_constructors_over_static_methods
  static IsoDuration parse(String textValue) {
    if (textValue == _lastInput1) {
      return _lastDuration1!;
    }
    if (textValue == _lastInput2) {
      return _lastDuration2!;
    }
    final parsed = _parseSlice(textValue, 0, textValue.length);
    _lastInput2 = _lastInput1;
    _lastDuration2 = _lastDuration1;
    _lastInput1 = textValue;
    _lastDuration1 = parsed;
    return parsed;
  }
}

/// Allows to handle durations
extension DurationExtension on Duration {
  /// Converts this duration to an ISO 8601 compliant duration.
  IsoDuration toIso() {
    final isNegativeDuration = isNegative;

    // Convert the absolute value of each duration component
    final years = inDays ~/ 365;
    final months = (inDays % 365) ~/ 30;
    final weeks = ((inDays % 365) % 30) ~/ 7;
    final days = ((inDays % 365) % 30) % 7;
    final hours = inHours % 24;
    final minutes = inMinutes % 60;
    final seconds = inSeconds % 60;

    return IsoDuration(
      years: years,
      months: months,
      weeks: weeks,
      days: days,
      hours: hours,
      minutes: minutes,
      seconds: seconds,
      isNegativeDuration: isNegativeDuration,
    );
  }
}

/// To specify the free or busy time type.
///
/// Compare [ParameterType.freeBusyTimeType]
enum FreeBusyTimeType {
  /// The user is free.
  free,

  /// The user is busy.
  busy,

  /// The user is busy and unavailable.
  busyUnavailable,

  /// The user is tentatively busy.
  busyTentative,

  /// Any other free/busy type.
  other,
}

/// Extends the [FreeBusyTimeType]
extension ExtensionFreeBusyValue on FreeBusyTimeType {
  /// Retrieves the type's name
  String? get typeName {
    switch (this) {
      case FreeBusyTimeType.free:
        return 'FREE';
      case FreeBusyTimeType.busy:
        return 'BUSY';
      case FreeBusyTimeType.busyUnavailable:
        return 'BUSY-UNAVAILABLE';
      case FreeBusyTimeType.busyTentative:
        return 'BUSY-TENTATIVE';
      case FreeBusyTimeType.other:
        return null;
    }
  }
}

/// The type of a user
enum CalendarUserType {
  /// An individual user.
  individual,

  /// A group of users.
  group,

  /// A resource such as a projector.
  resource,

  /// A room.
  room,

  /// An unknown user type.
  unknown,

  /// Any other user type.
  other,
}

/// Extends [CalendarUserType]
extension ExtensionCommonCalendarUserTypeValue on CalendarUserType {
  /// Retrieves the type name that corresponds to this enum value
  String? get typeName {
    switch (this) {
      case CalendarUserType.individual:
        return 'INDIVIDUAL';
      case CalendarUserType.group:
        return 'GROUP';
      case CalendarUserType.resource:
        return 'RESOURCE';
      case CalendarUserType.room:
        return 'ROOM';
      case CalendarUserType.unknown:
        return 'UNKNOWN';
      case CalendarUserType.other:
        return null;
    }
  }
}

/// Specifies the relationship of the alarm trigger with respect to the
/// start or end of the calendar component.
///
/// It is used for example in the `RELATED` parameter, [VAlarm]
enum AlarmTriggerRelationship {
  /// the trigger is specified relative to the start of the calendar component
  start,

  /// the trigger is specified releative to the end of the calendar component
  end,
}

/// Extends [AlarmTriggerRelationship] with its iCalendar name.
extension ExtensionAlarmTriggerRelationship on AlarmTriggerRelationship {
  /// Retrieves the `RELATED` value.
  String? get typeName {
    switch (this) {
      case AlarmTriggerRelationship.start:
        return 'START';
      case AlarmTriggerRelationship.end:
        return 'END';
    }
  }
}

/// To specify the type of hierarchical relationship associated with the
/// calendar component specified by the property.
enum Relationship {
  /// Parent relationship - Default
  parent,

  /// Child relationship
  child,

  /// Sibling relationship
  sibling,

  /// other
  other,
}

/// Extends [Relationship] with its iCalendar name.
extension ExtensionRelationship on Relationship {
  /// Retrieves the `RELTYPE` value.
  String? get typeName {
    switch (this) {
      case Relationship.parent:
        return 'PARENT';
      case Relationship.child:
        return 'CHILD';
      case Relationship.sibling:
        return 'SIBLING';
      case Relationship.other:
        return null;
    }
  }
}

/// To specify the participation role for the calendar user specified by
/// the property.
enum Role {
  /// Indicates chair of the calendar entity
  chair,

  /// Indicates a participant whose participation is required
  requiredParticipant,

  /// Indicates a participant whose participation is optional
  optionalParticipant,

  /// Indicates a participant who is copied for information purposes only
  nonParticipant,

  /// Other
  other,
}

/// Extends [Role] with its iCalendar name.
extension ExtensionRole on Role {
  /// Retrieves the `ROLE` value.
  String? get typeName {
    switch (this) {
      case Role.chair:
        return 'CHAIR';
      case Role.requiredParticipant:
        return 'REQ-PARTICIPANT';
      case Role.optionalParticipant:
        return 'OPT-PARTICIPANT';
      case Role.nonParticipant:
        return 'NON-PARTICIPANT';
      case Role.other:
        return null;
    }
  }
}

/// Provides the range of a change
///
/// The "RANGE" parameter is used to specify the effective range of
/// recurrence instances from the instance specified by the
/// "RECURRENCE-ID" property value.  The value for the range parameter
/// can only be "THISANDFUTURE" to indicate a range defined by the
/// given recurrence instance and all subsequent instances.
enum Range {
  /// Specifies the effective range of recurrence instances that is
  /// specified by the property.
  ///
  /// The effective range is from the recurrence identifier
  /// specified by the property.  If this parameter is not specified on
  /// an allowed property, then the default range is the single instance
  /// specified by the recurrence identifier value of the property.  The
  /// parameter value can only be "THISANDFUTURE" to indicate a range
  /// defined by the recurrence identifier and all subsequent instances.
  /// The value "THISANDPRIOR" is deprecated by this revision of
  /// iCalendar and MUST NOT be generated by applications.
  thisAndFuture,
}

/// Extends [Range] with its iCalendar name.
extension ExtensionRange on Range {
  /// Retrieves the `RANGE` value.
  String get name => 'THISANDFUTURE';
}

/// The participation status of a calendar user.
enum ParticipantStatus {
  /// Default status
  needsAction,

  /// Accepted
  accepted,

  /// Declined
  declined,

  /// Accepted tentatively
  tentative,

  /// Delegated (for a VTodo task)
  delegated,

  /// In Process (for a VTodo task) also
  inProcess,

  /// partial progres (for a VTodo task)
  partial,

  /// Completed (for a task)
  completed,

  /// Other status
  other,
}

/// Extends [ParticipantStatus] with its iCalendar name.
extension ExtensionParticpantStatus on ParticipantStatus {
  /// Retrieves the `PARTSTAT` value, or `null` when there is none.
  String? get typeName {
    switch (this) {
      case ParticipantStatus.needsAction:
        return 'NEEDS-ACTION';
      case ParticipantStatus.accepted:
        return 'ACCEPTED';
      case ParticipantStatus.declined:
        return 'DECLINED';
      case ParticipantStatus.tentative:
        return 'TENTATIVE';
      case ParticipantStatus.delegated:
        return 'DELEGATED';
      case ParticipantStatus.inProcess:
        return 'IN-PROCESS';
      case ParticipantStatus.completed:
        return 'COMPLETED';
      case ParticipantStatus.partial:
        return 'PARTIAL';
      case ParticipantStatus.other:
        return null;
    }
  }
}

/// Parses classification values.
class ClassificationParser {
  ClassificationParser._();

  /// Parses a [Classification] from the given [textValue].
  static Classification parse(String textValue) {
    switch (textValue) {
      case 'PUBLIC':
        return Classification.public;
      case 'PRIVATE':
        return Classification.private;
      case 'CONFIDENTIAL':
        return Classification.confidential;
      default:
        return Classification.other;
    }
  }
}

/// The action of an alarm
enum AlarmAction {
  /// An audio sound should be played.
  ///
  /// When the action is "AUDIO", the alarm can also include one and
  /// only one "ATTACH" property, which MUST point to a sound resource,
  /// which is rendered when the alarm is triggered.
  audio,

  /// A notice should be displayed.
  ///
  /// When the action is "DISPLAY", the alarm MUST also include a
  /// "DESCRIPTION" property, which contains the text to be displayed
  /// when the alarm is triggered.
  display,

  /// An email should be sent.
  ///
  /// When the action is "EMAIL", the alarm MUST include a "DESCRIPTION"
  /// property, which contains the text to be used as the message body,
  /// a "SUMMARY" property, which contains the text to be used as the
  /// message subject, and one or more "ATTENDEE" properties, which
  /// contain the email address of attendees to receive the message.  It
  /// can also include one or more "ATTACH" properties, which are
  /// intended to be sent as message attachments.  When the alarm is
  /// triggered, the email message is sent.
  email,

  /// A different, non-standard alarm action should be taken.
  other,
}

/// Extends [AlarmAction] with its iCalendar name.
extension ExtensionAlarmAction on AlarmAction {
  /// Retrieves the `ACTION` value, or `null` when there is none.
  String? get name {
    switch (this) {
      case AlarmAction.audio:
        return 'AUDIO';
      case AlarmAction.display:
        return 'DISPLAY';
      case AlarmAction.email:
        return 'EMAIL';
      case AlarmAction.other:
        return null;
    }
  }
}

/// Contains all relevant binary information
class Binary {
  /// Creates new binary data with the given [value], [mediaType] and
  /// [encoding].
  Binary({
    required this.value,
    required this.mediaType,
    required this.encoding,
  });

  /// The data in textual form
  final String value;

  /// The media like `image/png`
  final String? mediaType;

  /// The encoding type like `BASE64`
  final String? encoding;
}

/// Provides access to a geolocation
class GeoLocation {
  /// Creates a new geo location with the given [latitude] and [longitude].
  GeoLocation(this.latitude, this.longitude);

  /// The latitude.
  final double latitude;

  /// The longitude.
  final double longitude;

  @override
  String toString() {
    final buffer = StringBuffer()
      ..write(latitude)
      ..write(';')
      ..write(longitude);
    return buffer.toString();
  }
}

/// The iTIP compatible method.
///
/// Compare https://datatracker.ietf.org/doc/html/rfc5546
enum Method {
  // Post notification of an event / free-busy timeslot / `todo` / journal.
  ///
  // Used primarily as a method of advertising the existence of an
  // event / `todo` / journal / timeslot.
  ///
  /// Applicable for [VEvent], [VFreeBusy], [VTodo], [VJournal]
  publish,

  // Make a request for an event, ask for free-busy timeslots, assign a `todo`.
  ///
  /// This is an explicit invitation to one or more Attendees.
  // Requests are also used to update or change an existing event / `todo`.
  /// Clients that cannot handle REQUEST MAY degrade the event to view it
  /// as a PUBLISH.
  ///
  /// Applicable for [VEvent], [VFreeBusy], [VTodo]
  request,

  // Reply to an event / free-busy / `todo` request.
  ///
  /// Event attendees may set their status (PARTSTAT) to ACCEPTED,
  /// DECLINED, TENTATIVE, or DELEGATED.
  /// Attendees of a [VTodo] MAY set PARTSTAT to ACCEPTED, DECLINED, TENTATIVE,
  /// DELEGATED, PARTIAL, and COMPLETED.
  ///
  /// Applicable for [VEvent], [VFreeBusy], [VTodo]
  /// Compare [ParticipantStatus]
  reply,

  // Add one or more instances to an existing event / `todo` / journal.
  ///
  /// Applicable for [VEvent], [VTodo], [VJournal]
  add,

  // Cancel one or more instances of an existing event / `todo` / journal.
  ///
  /// Applicable for [VEvent], [VTodo], [VJournal]
  cancel,

  // A request is sent to an Organizer by an Attendee asking for the
  // latest version of an event / `todo` to be resent to the requester.
  ///
  /// Applicable for [VEvent], [VTodo]
  refresh,

  /// Counter a REQUEST with an alternative proposal.
  ///
  /// Sent by an Attendee to the Organizer.
  ///
  /// Applicable for [VEvent], [VTodo]
  counter,

  /// Decline a counter proposal.
  ///
  /// Sent to an Attendee by the Organizer.
  ///
  /// Applicable for [VEvent], [VTodo]
  declineCounter,
}

/// Extends [Method] with its iCalendar name.
extension ExtensionMethod on Method {
  /// Retrieves the `METHOD` value.
  String get name {
    switch (this) {
      case Method.publish:
        return 'PUBLISH';
      case Method.request:
        return 'REQUEST';
      case Method.reply:
        return 'REPLY';
      case Method.add:
        return 'ADD';
      case Method.cancel:
        return 'CANCEL';
      case Method.refresh:
        return 'REFRESH';
      case Method.counter:
        return 'COUNTER';
      case Method.declineCounter:
        return 'DECLINECOUNTER';
    }
  }
}

/// The priority of a task or event
enum Priority {
  /// High priority.
  high,

  /// Medium priority.
  medium,

  /// Low priority.
  low,

  /// Undefined priority.
  undefined,
}

/// Extends [Priority] with its numeric value.
extension ExtensionPriority on Priority {
  /// Retrieves the numeric priority between 0 and 9.
  int get numericValue {
    switch (this) {
      case Priority.high:
        return 1;
      case Priority.medium:
        return 5;
      case Priority.low:
        return 9;
      case Priority.undefined:
        return 0;
    }
  }
}

/// Transparency for busy time searches
enum TimeTransparency {
  /// The associated event's timeslot is visible in busy time searches
  opaque,

  /// The associated event's timeslot is hiddem from busy time searches
  transparent,
}

/// Extends [TimeTransparency] with its iCalendar name.
extension ExtensionTimeTransparency on TimeTransparency {
  /// Retrieves the `TRANSP` value.
  String get name {
    switch (this) {
      case TimeTransparency.opaque:
        return 'OPAQUE';
      case TimeTransparency.transparent:
        return 'TRANSPARENT';
    }
  }
}

// /// Possible responses to an [VCalendar] or [VComponent] object.
// ///
// /// The available responses depend on the used method of the component
// /// and the type of the recipient user, ie is the current user the
// /// organizator or not
// enum ResponseOption {
//   /// The participant can change the status
//   ///
//   /// Compare [ParticipantStatus], [VCalendar.replyWithParticipantStatus]
//   changeParticipantStatus,

//   /// The participant can propose a counter event/task, e.g. with a
//   /// different time slot
//   ///
//   /// Compare [VCalendar.counter]
//   counter,

//   /// The organizer can decline a counter proposal
//   ///
//   /// Compare [VCalendar.counterDecline]
//   declineCounter,

//   /// The organizer can acccess a counter proposal
//   ///
//   /// Compare [VCalendar.counterAccept]
//   acceptCounter,

//   /// Update the existing component
//   update,
// }

/// Wraps changes that are to be sent to both the attendee(s) as well as
/// the group.
///
/// Example for this is to cancel an event for one or several attendees.
/// Compare [VCalendar.cancelEventForAttendees]
class AttendeeCancelResult {
  /// Creates a new result with the given requests.
  const AttendeeCancelResult(
    this.requestForCancelledAttendees,
    this.requestUpdateForGroup,
  );

  /// The request / info for attendees for which the participation was
  /// cancelled:
  final VCalendar requestForCancelledAttendees;

  /// The request / update for the remaining attendees.
  final VCalendar requestUpdateForGroup;
}

/// Wraps delegation requests
///
/// Compare [VCalendar.delegate]
class AttendeeDelegatedResult {
  /// Creates a new result with the given requests.
  AttendeeDelegatedResult(this.requestForDelegatee, this.replyForOrganizer);

  /// The request for the attendee to which the particaption should be
  /// delegated:
  final VCalendar requestForDelegatee;

  /// The reply with the information for the organizer
  final VCalendar replyForOrganizer;
}

/// Custom event busy status as defined by `X-MICROSOFT-CDO-BUSYSTATUS`
enum EventBusyStatus {
  /// The user is free.
  free,

  /// The user is tentatively busy.
  tentative,

  /// The user is busy.
  busy,

  /// The user is out of office.
  outOfOffice,
}

/// Extends [EventBusyStatus] with its iCalendar name.
extension ExtensionEventBusyStatus on EventBusyStatus {
  /// Retrieves the `X-MICROSOFT-CDO-BUSYSTATUS` value.
  String get name {
    switch (this) {
      case EventBusyStatus.free:
        return 'FREE';
      case EventBusyStatus.tentative:
        return 'TENTATIVE';
      case EventBusyStatus.busy:
        return 'BUSY';
      case EventBusyStatus.outOfOffice:
        return 'OOF';
    }
  }
}
