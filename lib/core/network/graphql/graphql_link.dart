import 'package:ferry/ferry.dart';
import 'package:flutter_core/core/network/graphql/graphql_config.dart';
import 'package:flutter_core/core/network/graphql/graphql_fresh_link.dart';
import 'package:gql_http_link/gql_http_link.dart';

class GqlLinkBuilder {
  static Link create(GqlConfig config) {
    final httpLink = HttpLink(config.baseUrl);

    final refreshLink = GqlRefreshLink(tokenRepository: config.tokenRepository);

    final authLink = Link.function((request, [forward]) {
      final req = request.updateContextEntry<HttpLinkHeaders>(
        (headers) => HttpLinkHeaders(
          headers: {
            ...?headers?.headers,
            if (config.accessToken != null)
              'Authorization': 'Bearer ${config.accessToken}',
          },
        ),
      );
      return forward!(req);
    });

    return refreshLink.concat(authLink).concat(httpLink);
  }
}
