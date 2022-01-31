// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GenericResponse _$$_GenericResponseFromJson(Map<String, dynamic> json) =>
    _$_GenericResponse(
      message: json['Message'] as String,
      payload: json['Payload'],
    );

Map<String, dynamic> _$$_GenericResponseToJson(_$_GenericResponse instance) =>
    <String, dynamic>{
      'Message': instance.message,
      'Payload': instance.payload,
    };
