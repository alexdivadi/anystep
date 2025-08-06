import 'package:anystep/database/database.dart';
import 'package:anystep/database/filter.dart';
import 'package:anystep/core/common/data/irepository.dart';
import 'package:anystep/core/features/location/domain/address_model.dart';
import 'package:anystep/env/env.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'address_repository.g.dart';

class AddressRepository implements IRepository<AddressModel> {
  const AddressRepository({required this.database, required this.collectionId});
  final Database database;
  final String collectionId;

  @override
  Future<AddressModel> createOrUpdate({
    required AddressModel obj,
    String? documentId,
    String? userId,
  }) async {
    // TODO: implement createOrUpdate
    throw UnimplementedError();
  }

  @override
  Future<AddressModel> get({required String documentId}) {
    // TODO: AddressModel get
    throw UnimplementedError();
  }

  @override
  Future<List<AddressModel>> list({
    List<AnyStepFilter>? filters,
    AnyStepOrder? order,
    int? limit,
    int? page,
  }) {
    // TODO: implement list
    throw UnimplementedError();
  }
}

@riverpod
AddressRepository addressRepository(Ref ref) {
  final database = ref.watch(databaseProvider);
  final collectionId = Env.addressCollectionId;
  return AddressRepository(database: database, collectionId: collectionId);
}
