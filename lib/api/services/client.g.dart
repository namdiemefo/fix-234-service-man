// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _Client implements Client {
  _Client(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://fix234.herokuapp.com/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<dynamic> token(token, tokenModel) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(tokenModel.toJson());
    final _result = await _dio.fetch(_setStreamType<dynamic>(Options(
            method: 'POST',
            headers: <String, dynamic>{r'Authorization': token},
            extra: _extra)
        .compose(_dio.options, 'technician/auth/token', data: _data,
            queryParameters: queryParameters)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    return value;
  }

  @override
  Future<MyResponseModel> login(loginRequestModel) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(loginRequestModel.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MyResponseModel>(
            Options(method: 'POST', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, 'technician/auth/login', data: _data,
                    queryParameters: queryParameters)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MyResponseModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<MyResponseModel> forgot(forgotPasswordRequestModel) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(forgotPasswordRequestModel.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MyResponseModel>(
            Options(method: 'POST', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, 'technician/auth/forgot', data: _data,
                    queryParameters: queryParameters)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MyResponseModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<MyResponseModel> change(token, changePasswordRequestModel) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(changePasswordRequestModel.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MyResponseModel>(Options(
                method: 'POST',
                headers: <String, dynamic>{r'Authorization': token},
                extra: _extra)
            .compose(_dio.options, 'technician/auth/change', data: _data,
                queryParameters: queryParameters)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MyResponseModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<MyResponseModel> verify(token, verifyOtpRequestModel) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(verifyOtpRequestModel.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MyResponseModel>(Options(
                method: 'POST',
                headers: <String, dynamic>{r'Authorization': token},
                extra: _extra)
            .compose(_dio.options, 'technician/auth/verify', data: _data,
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
            .compose(_dio.options, 'technician/auth/upload', data: _data,
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
            .compose(_dio.options, 'technician/auth/image', data: _data,
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
            .compose(_dio.options, 'technician/booking/', data: _data,
                queryParameters: queryParameters)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MyResponseModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<MyResponseModel> completedBookings(token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MyResponseModel>(Options(
                method: 'GET',
                headers: <String, dynamic>{r'Authorization': token},
                extra: _extra)
            .compose(_dio.options, 'technician/booking/completed', data: _data,
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
    _data.addAll(updateStatusRequestModel.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MyResponseModel>(Options(
                method: 'PUT',
                headers: <String, dynamic>{r'Authorization': token},
                extra: _extra)
            .compose(_dio.options, 'technician/booking/status', data: _data,
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
    _data.addAll(reassignmentRequestModel.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MyResponseModel>(Options(
                method: 'PUT',
                headers: <String, dynamic>{r'Authorization': token},
                extra: _extra)
            .compose(_dio.options, 'technician/booking/request', data: _data,
                queryParameters: queryParameters)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MyResponseModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<MyResponseModel> requestForAssistance(
      token, requestForAssistanceRequest) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(requestForAssistanceRequest.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MyResponseModel>(Options(
                method: 'PUT',
                headers: <String, dynamic>{r'Authorization': token},
                extra: _extra)
            .compose(
                _dio.options, 'technician/booking/assistant-request', data: _data,
                queryParameters: queryParameters)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MyResponseModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<MyResponseModel> createBill(token, createBillModel) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(createBillModel.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MyResponseModel>(Options(
                method: 'POST',
                headers: <String, dynamic>{r'Authorization': token},
                extra: _extra)
            .compose(_dio.options, 'technician/booking/bill', data: _data,
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
            .compose(_dio.options, 'technician/booking/bills', data: _data,
                queryParameters: queryParameters)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MyResponseModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<MyResponseModel> complete(token, completeBillRequest) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(completeBillRequest.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MyResponseModel>(Options(
                method: 'POST',
                headers: <String, dynamic>{r'Authorization': token},
                extra: _extra)
            .compose(_dio.options, 'technician/booking/complete', data: _data,
                queryParameters: queryParameters)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MyResponseModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<MyResponseModel> parts(token, search) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'name': search};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MyResponseModel>(Options(
                method: 'GET',
                headers: <String, dynamic>{r'Authorization': token},
                extra: _extra)
            .compose(_dio.options, 'technician/booking/parts', data: _data,
                queryParameters: queryParameters)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MyResponseModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<MyResponseModel> servicing(token, search) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'name': search};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MyResponseModel>(Options(
                method: 'GET',
                headers: <String, dynamic>{r'Authorization': token},
                extra: _extra)
            .compose(_dio.options, 'technician/booking/servicing', data: _data,
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
