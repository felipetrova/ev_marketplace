import '../core/network/api_client.dart';

/// Boundary between Flutter screens and the REST API.
/// Extend this class as backend endpoints become available.
class MarketplaceService {
  final ApiClient client;
  MarketplaceService(this.client);

  Future<Map<String, dynamic>> health() => client.get('/health');
  Future<Map<String, dynamic>> chargingIntegrationStatus() => client.get('/charging/integration/status');
}
