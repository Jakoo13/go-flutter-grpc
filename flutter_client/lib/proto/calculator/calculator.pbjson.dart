//
//  Generated code. Do not modify.
//  source: calculator.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use calculatorRequestDescriptor instead')
const CalculatorRequest$json = {
  '1': 'CalculatorRequest',
  '2': [
    {'1': 'firstNumber', '3': 1, '4': 1, '5': 3, '10': 'firstNumber'},
    {'1': 'secondNumber', '3': 2, '4': 1, '5': 3, '10': 'secondNumber'},
  ],
};

/// Descriptor for `CalculatorRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List calculatorRequestDescriptor = $convert.base64Decode(
    'ChFDYWxjdWxhdG9yUmVxdWVzdBIgCgtmaXJzdE51bWJlchgBIAEoA1ILZmlyc3ROdW1iZXISIg'
    'oMc2Vjb25kTnVtYmVyGAIgASgDUgxzZWNvbmROdW1iZXI=');

@$core.Deprecated('Use calculatorResponseDescriptor instead')
const CalculatorResponse$json = {
  '1': 'CalculatorResponse',
  '2': [
    {'1': 'result', '3': 1, '4': 1, '5': 3, '10': 'result'},
  ],
};

/// Descriptor for `CalculatorResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List calculatorResponseDescriptor = $convert.base64Decode(
    'ChJDYWxjdWxhdG9yUmVzcG9uc2USFgoGcmVzdWx0GAEgASgDUgZyZXN1bHQ=');

