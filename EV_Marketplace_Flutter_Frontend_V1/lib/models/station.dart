class Station {
  final String id;
  final String name;
  final String address;
  final double rating;
  final double pricePerHour;
  final String connector;
  final double powerKw;
  final bool available;

  const Station({required this.id, required this.name, required this.address, required this.rating, required this.pricePerHour, required this.connector, required this.powerKw, required this.available});
}

const demoStations = [
  Station(id: 'st-001', name: 'EV Home Charging', address: 'Centro — Indaiatuba/SP', rating: 4.9, pricePerHour: 20, connector: 'Tipo 2', powerKw: 7.4, available: true),
  Station(id: 'st-002', name: 'Power Mall', address: 'Jardim Morada do Sol — Indaiatuba/SP', rating: 4.7, pricePerHour: 20, connector: 'Tipo 2', powerKw: 22, available: true),
  Station(id: 'st-003', name: 'Charge Point Business', address: 'Campinas/SP', rating: 4.8, pricePerHour: 20, connector: 'CCS2', powerKw: 60, available: false),
];
