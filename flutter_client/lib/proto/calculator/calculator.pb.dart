//
//  Generated code. Do not modify.
//  source: calculator.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class CalculatorRequest extends $pb.GeneratedMessage {
  factory CalculatorRequest() => create();
  CalculatorRequest._() : super();
  factory CalculatorRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CalculatorRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CalculatorRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'firstNumber', protoName: 'firstNumber')
    ..aInt64(2, _omitFieldNames ? '' : 'secondNumber', protoName: 'secondNumber')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CalculatorRequest clone() => CalculatorRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CalculatorRequest copyWith(void Function(CalculatorRequest) updates) => super.copyWith((message) => updates(message as CalculatorRequest)) as CalculatorRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CalculatorRequest create() => CalculatorRequest._();
  CalculatorRequest createEmptyInstance() => create();
  static $pb.PbList<CalculatorRequest> createRepeated() => $pb.PbList<CalculatorRequest>();
  @$core.pragma('dart2js:noInline')
  static CalculatorRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CalculatorRequest>(create);
  static CalculatorRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get firstNumber => $_getI64(0);
  @$pb.TagNumber(1)
  set firstNumber($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFirstNumber() => $_has(0);
  @$pb.TagNumber(1)
  void clearFirstNumber() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get secondNumber => $_getI64(1);
  @$pb.TagNumber(2)
  set secondNumber($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSecondNumber() => $_has(1);
  @$pb.TagNumber(2)
  void clearSecondNumber() => clearField(2);
}

class CalculatorResponse extends $pb.GeneratedMessage {
  factory CalculatorResponse() => create();
  CalculatorResponse._() : super();
  factory CalculatorResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CalculatorResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CalculatorResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'result')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CalculatorResponse clone() => CalculatorResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CalculatorResponse copyWith(void Function(CalculatorResponse) updates) => super.copyWith((message) => updates(message as CalculatorResponse)) as CalculatorResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CalculatorResponse create() => CalculatorResponse._();
  CalculatorResponse createEmptyInstance() => create();
  static $pb.PbList<CalculatorResponse> createRepeated() => $pb.PbList<CalculatorResponse>();
  @$core.pragma('dart2js:noInline')
  static CalculatorResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CalculatorResponse>(create);
  static CalculatorResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get result => $_getI64(0);
  @$pb.TagNumber(1)
  set result($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasResult() => $_has(0);
  @$pb.TagNumber(1)
  void clearResult() => clearField(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
