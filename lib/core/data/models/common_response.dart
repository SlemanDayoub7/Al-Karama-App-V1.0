class CommonResponse<T> {
  int? statusCode;
  late String message;
  T? data;

  CommonResponse.fromJson(dynamic json) {
    this.statusCode = json['statusCode'];
    print(statusCode);
    if (statusCode.toString().startsWith('2')) {
      this.data = json['response']['data'];
    } else {
      if (json['response']['error'] != null && json['response'] is Map) {
        message = json['response']['error'];
      } else {
        switch (statusCode) {
          case 400:
            message = '400 bad request';
            break;
          case 401:
            message = '401 Not Auth';
            break;
          case 403:
            message = '403 Forbidden';
            break;
          case 404:
            message = '404 Not found';
            break;
          case 405:
            message = '405 Method not allowed';
            break;
          case 500:
            message = '500 Server error';
            break;
          case 503:
            message = '503 Unavalible';
            break;
          default:
            message = 'General Error';
            break;
        }
      }
    }
  }

  bool get getStatus => statusCode.toString().startsWith('2');
}
