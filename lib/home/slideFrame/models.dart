class ChartModel {
  final String name;
  final String message;
  final String time;

  ChartModel({
    required this.name,
    required this.message,
    required this.time,
  });
}

final List<ChartModel> items = [
  ChartModel(
    name: 'Gradient',
    message: 'Acara 21 - Gradient Flutter',
    time: '12.00',
  ),
  ChartModel(
    name: 'Page View',
    message: 'Acara 22 - Page View Flutter',
    time: '12.00',
  ),
  ChartModel(
    name: 'Dropdown',
    message: 'Acara 23 - Dropdown Flutter',
    time: '12.00',
  ),
];
