//
//  Generated code. Do not modify.
//  source: calculator.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'calculator.pb.dart' as $0;

export 'calculator.pb.dart';

class CalculatorServiceClient extends $grpc.Client {
  static final _$addNumbers = $grpc.ClientMethod<$0.CalculatorRequest, $0.CalculatorResponse>(
      '/proto.CalculatorService/AddNumbers',
      ($0.CalculatorRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CalculatorResponse.fromBuffer(value));

  CalculatorServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.CalculatorResponse> addNumbers($0.CalculatorRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$addNumbers, request, options: options);
  }
}

abstract class CalculatorServiceBase extends $grpc.Service {
  $core.String get $name => 'proto.CalculatorService';

  CalculatorServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.CalculatorRequest, $0.CalculatorResponse>(
        'AddNumbers',
        addNumbers_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CalculatorRequest.fromBuffer(value),
        ($0.CalculatorResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.CalculatorResponse> addNumbers_Pre($grpc.ServiceCall call, $async.Future<$0.CalculatorRequest> request) async {
    return addNumbers(call, await request);
  }

  $async.Future<$0.CalculatorResponse> addNumbers($grpc.ServiceCall call, $0.CalculatorRequest request);
}
