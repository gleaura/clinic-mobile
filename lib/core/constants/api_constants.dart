class ApiConstants {
  ApiConstants._();

  static const String baseUrl = 'https://clinic-service.onbtech.com/api/v1';

  // Auth
  static const String login = '/auth/login';
  static const String logout = '/auth/logout';
  static const String refresh = '/auth/refresh';

  // Resources
  static const String patients = '/patients';
  static const String appointments = '/appointments';
  static const String treatments = '/treatments';
  static const String staff = '/staff';
  static const String users = '/users';
  static const String roles = '/roles';
  static const String permissions = '/permissions';
  static const String userRoles = '/user-roles';
  static const String rolePermissions = '/role-permissions';
}
