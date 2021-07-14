// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _Client implements Client {
  _Client(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://fix-234.herokuapp.com/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<MyResponseModel> login(loginResponseModel) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MyResponseModel>(
            Options(method: 'POST', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, 'technician/auth/login',
                    queryParameters: queryParameters)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MyResponseModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<MyResponseModel> forgot(forgotPasswordResponseModel) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MyResponseModel>(
            Options(method: 'POST', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, 'technician/auth/forgot',
                    queryParameters: queryParameters)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MyResponseModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<MyResponseModel> change(token, changePasswordResponseModel) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MyResponseModel>(Options(
                method: 'POST',
                headers: <String, dynamic>{r'Authorization': token},
                extra: _extra)
            .compose(_dio.options, 'technician/auth/change',
                queryParameters: queryParameters)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MyResponseModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<MyResponseModel> verify(token, verifyOtpResponseModel) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MyResponseModel>(Options(
                method: 'POST',
                headers: <String, dynamic>{r'Authorization': token},
                extra: _extra)
            .compose(_dio.options, 'technician/auth/verify',
                queryParameters: queryParameters)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MyResponseModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<MyResponseModel> uploadImage(token, image) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = FormData();
    _data.files.add(MapEntry(
        'image',
        MultipartFile.fromFileSync(image.path,
            filename: 'image', contentType: MediaType.parse('image/png'))));
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MyResponseModel>(Options(
                method: 'POST',
                headers: <String, dynamic>{r'Authorization': token},
                extra: _extra)
            .compose(_dio.options, 'technician/auth/upload',
                queryParameters: queryParameters)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MyResponseModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<MyResponseModel> image(token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MyResponseModel>(Options(
                method: 'POST',
                headers: <String, dynamic>{r'Authorization': token},
                extra: _extra)
            .compose(_dio.options, 'technician/auth/image',
                queryParameters: queryParameters)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MyResponseModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<MyResponseModel> bookings(token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MyResponseModel>(Options(
                method: 'GET',
                headers: <String, dynamic>{r'Authorization': token},
                extra: _extra)
            .compose(_dio.options, 'technician/booking/',
                queryParameters: queryParameters)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MyResponseModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<MyResponseModel> status(token, updateStatusRequestModel) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MyResponseModel>(Options(
                method: 'PUT',
                headers: <String, dynamic>{r'Authorization': token},
                extra: _extra)
            .compose(_dio.options, 'technician/booking/status',
                queryParameters: queryParameters)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MyResponseModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<MyResponseModel> request(token, reassignmentRequestModel) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MyResponseModel>(Options(
                method: 'PUT',
                headers: <String, dynamic>{r'Authorization': token},
                extra: _extra)
            .compose(_dio.options, 'technician/booking/request',
                queryParameters: queryParameters)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MyResponseModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<MyResponseModel> createBill(token, billRequestModel) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MyResponseModel>(Options(
                method: 'POST',
                headers: <String, dynamic>{r'Authorization': token},
                extra: _extra)
            .compose(_dio.options, 'technician/booking/bill',
                queryParameters: queryParameters)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MyResponseModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<MyResponseModel> bills(token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MyResponseModel>(Options(
                method: 'GET',
                headers: <String, dynamic>{r'Authorization': token},
                extra: _extra)
            .compose(_dio.options, 'technician/booking/bills',
                queryParameters: queryParameters)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MyResponseModel.fromJson(_result.data);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}