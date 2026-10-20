# Arquitetura V1

O marketplace funciona sem OCPP. OCPP será uma integração futura para telemetria, medição automática e controle.

## Domínios
- Identity: usuários, veículos e autenticação
- Marketplace: anfitriões, estações e conectores
- Pricing: planos e tarifas
- Booking: disponibilidade e reservas
- Billing: pagamentos, descontos e repasses
- Charging: sessões de carga
- Reputation: avaliações
- Admin: operação e moderação
- Charging Integration: OCPP

## Cortesia
A primeira reserva elegível pode registrar preço de referência, desconto integral, valor líquido zero e `isCourtesy=true`.

## Planos iniciais
- Plano A: R$ 20/hora
- Plano B: R$ 10/carga express
- Plano C: R$ 100/10 cargas por mês
- Futuros: kWh, combinado, corporativo e personalizado
