//
//  Generated code. Do not modify.
//  source: greet.proto
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

import 'greet.pb.dart' as $0;

export 'greet.pb.dart';

class GreetServiceClient extends $grpc.Client {
  static final _$greet = $grpc.ClientMethod<$0.GreetRequest, $0.GreetResponse>(
      '/proto.GreetService/Greet',
      ($0.GreetRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GreetResponse.fromBuffer(value));
  static final _$greetManyTimes = $grpc.ClientMethod<$0.GreetRequest, $0.GreetResponse>(
      '/proto.GreetService/GreetManyTimes',
      ($0.GreetRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GreetResponse.fromBuffer(value));

  GreetServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.GreetResponse> greet($0.GreetRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$greet, request, options: options);
  }

  $grpc.ResponseStream<$0.GreetResponse> greetManyTimes($0.GreetRequest request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$greetManyTimes, $async.Stream.fromIterable([request]), options: options);
  }
}

abstract class GreetServiceBase extends $grpc.Service {
  $core.String get $name => 'proto.GreetService';

  GreetServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.GreetRequest, $0.GreetResponse>(
        'Greet',
        greet_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GreetRequest.fromBuffer(value),
        ($0.GreetResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GreetRequest, $0.GreetResponse>(
        'GreetManyTimes',
        greetManyTimes_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.GreetRequest.fromBuffer(value),
        ($0.GreetResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.GreetResponse> greet_Pre($grpc.ServiceCall call, $async.Future<$0.GreetRequest> request) async {
    return greet(call, await request);
  }

  $async.Stream<$0.GreetResponse> greetManyTimes_Pre($grpc.ServiceCall call, $async.Future<$0.GreetRequest> request) async* {
    yield* greetManyTimes(call, await request);
  }

  $async.Future<$0.GreetResponse> greet($grpc.ServiceCall call, $0.GreetRequest request);
  $async.Stream<$0.GreetResponse> greetManyTimes($grpc.ServiceCall call, $0.GreetRequest request);
}
