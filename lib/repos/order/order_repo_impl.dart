import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:restaurant_orders/core/exceptions_and_failures/failures.dart';
import 'package:restaurant_orders/core/resources/resources.dart';
import 'package:restaurant_orders/models/open_order_model.dart';
import 'package:restaurant_orders/repos/order/order_repo.dart';

import '../dio/i_dio_http.dart';

class OrderRepoImpl implements OrderRepo {
  final IHttpClient _client;

  OrderRepoImpl(this._client);

  @override
  Future<Either<Failure, List<OpenOrderModel>>> get openOrders async {
    return (await _client.post(
      ApiEndPoints.kOpenOrders,
      requiresMobileNumber: true,
      requiresToken: true,
    ))
        .fold((l) => Left(l), (response) {
      final Map<String, dynamic> data = response.data;
      return Right(data['result'] == null
          ? []
          : ((jsonDecode(data['result']) as List?)
                      ?.cast<Map<String, dynamic>>() ??
                  [])
              .map((e) => OpenOrderModel.fromJson(e))
              .toList(growable: false));
    });
  }

  @override
  Future<Either<Failure, void>> saveOrders(
    String tableNum,
    String iNum,
    double quantity,
  ) async {
    final Map<String, dynamic> json = {
      'TableNum': tableNum,
      'INum': iNum,
      'PostingType': 'AD',
      'Qty': quantity,
    };
    return (await _client.post(
      ApiEndPoints.kSaveOrder,
      queryParameters: json,
      requiresToken: true,
      requiresMobileNumber: true,
    ))
        .fold((failure) => Left(failure), (response) {
      return const Right(null);
    });
  }
}
