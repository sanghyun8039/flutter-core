import 'package:ferry/ferry.dart';
import 'package:flutter_core/core/network/graphql/graphql_config.dart';
import 'package:flutter_core/core/network/graphql/graphql_link.dart';

class GqlClient {
  final Client _client;

  GqlClient({required GqlConfig config})
    : _client = Client(link: GqlLinkBuilder.create(config));

  Client get client => _client;
}
