abstract class StatusDefault {}

class StatusIdle implements StatusDefault {}

class StatusLoading implements StatusDefault {}

class StatusSuccess implements StatusDefault {}

class StatusError implements StatusDefault {
  final String? errorMessage;
  const StatusError({this.errorMessage});
}
