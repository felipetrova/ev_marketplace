# EV Marketplace V1

Marketplace brasileiro de recarga de veículos elétricos.

## Stack
- Node.js + TypeScript + NestJS
- Prisma + PostgreSQL
- REST API `/api/v1`
- Docker Compose
- Arquitetura preparada para OCPP, sem dependência do OCPP no MVP

## MVP
- Usuário, veículo e anfitrião
- Estações e conectores
- Planos e tarifas
- Reserva
- Primeira carga como cortesia
- Pagamento preparado
- Sessão de carga preparada para medição futura
- Avaliações

## Requisitos
- Node.js 20.12+ (testado com Node 22)
- Docker Desktop (para o PostgreSQL) — necessário apenas para o banco/migrations

## Execução local

```bash
cp backend/.env.example backend/.env
npm install
npm run prisma:generate
npm run start:dev
```

O arquivo `.env` fica em `backend/` porque é lido tanto pela API quanto pela CLI do Prisma.

### Banco de dados (opcional nesta V1)

Os endpoints atuais (`health` e `charging/integration/status`) não acessam o banco. Para criar o schema no PostgreSQL:

```bash
docker compose up -d
npm run prisma:migrate
```

## Endpoints

API: http://localhost:3000/api/v1

- `GET /api/v1/health`
- `GET /api/v1/charging/integration/status`

CORS está habilitado para permitir o acesso do app Flutter rodando no navegador.
