abstract class RouteConstants {
  static const String homeRoot = '/home';
  static const String homeWildcard = '$homeRoot/*';
  static const String homeDashboard = '$homeRoot/dashboard';
  static const String homeToday = '$homeRoot/today';
  static const String homeGraphs = '$homeRoot/graphs';

  static const String timetableRoot = '/timetable';
  static const String timetableWildcard = '$timetableRoot/*';
  static const String timetable = timetableRoot;

  static const String coursesRoot = '/courses';
  static const String coursesWildcard = '$coursesRoot/*';
  static const String courses = coursesRoot;

  static const String activitiesRoot = '/activities';
  static const String activitiesWildcard = '$activitiesRoot/*';
  static const String activities = activitiesRoot;
}
