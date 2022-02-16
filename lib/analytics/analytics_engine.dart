class AnalyticsEngine {
  void handleEvent(AnalyticsEvent event) {
    switch (event.runtimeType) {
      case AnalyticsViewEvent:
        var viewEvent = event as AnalyticsViewEvent;
        print('==== ViewEvent received ====');
        print('meta-data: ${event.exampleMetaData}');
        print('from: ${viewEvent.from}');
        print('to: ${(viewEvent).to}');
        print('==== End of ViewEvent ====');
        break;

      case AnalyticsActionEvent:
        var actionEvent = event as AnalyticsActionEvent;
        print('==== ActionEvent received ====');
        print('meta-data: ${event.exampleMetaData}');
        print('${actionEvent.name}');
        print('Data...');
        actionEvent.data?.forEach((key, value) {
          print('$key: ${value.toString()}');
        });
        print('==== End of ActionEvent ====');
        break;

      default:
        print('Event not recognised');
    }
  }
}

abstract class AnalyticsEvent {
  // TODO: This gets and houses all the meta data.
  // Device ID, User ID, session data etc.
  final exampleMetaData = 'Example metadata';
}

class AnalyticsViewEvent extends AnalyticsEvent {
  final Type? from;
  final Type to;

  AnalyticsViewEvent({
    required this.from,
    required this.to,
  });
}

class AnalyticsActionEvent extends AnalyticsEvent {
  late String name;
  Map<String, dynamic>? data;

  AnalyticsActionEvent({required Type blocEvent, this.data}) {
    this.name = blocEvent.runtimeType.toString();
  }
}
