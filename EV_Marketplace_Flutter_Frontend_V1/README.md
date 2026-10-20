# EV Marketplace — Flutter Frontend V1

Frontend inicial do marketplace de recarga de veículos elétricos.

## Stack

- Flutter / Dart
- Material 3
- Provider
- HTTP REST
- Shared Preferences

## Requisitos

- Flutter SDK 3.44+ (Dart 3.12+) no `PATH`
- Conforme o destino:
  - **Web:** Google Chrome
  - **Android:** Android Studio + Android SDK + um emulador (`flutter doctor --android-licenses`)
  - **iOS / macOS:** Xcode completo + CocoaPods (`brew install cocoapods`)

Verifique o ambiente com `flutter doctor`.

## Backend

Suba o backend (`ev-marketplace-v1`) antes do app — veja o README dele. A URL da API é escolhida automaticamente:

| Destino | URL padrão |
|---|---|
| Emulador Android | `http://10.0.2.2:3000/api/v1` |
| Chrome, iOS Simulator, macOS, Windows, Linux | `http://localhost:3000/api/v1` |

Para dispositivo físico (ou outro servidor), informe a URL na execução, usando o IP da máquina que roda o backend:

```bash
flutter run --dart-define=API_BASE_URL=http://192.168.0.10:3000/api/v1
```

Se o backend não estiver acessível, o app funciona em modo demonstração.

## Executar

```bash
flutter pub get
flutter devices          # lista os destinos disponíveis
flutter run -d chrome    # ou -d macos, ou o id do emulador
```

As pastas de plataforma (`android/`, `ios/`, `web/`, `macos/`, `windows/`, `linux/`) já estão no projeto. Se estiverem ausentes, gere-as com `flutter create .`.

## Testes

```bash
flutter analyze
flutter test
```

## Funcionalidades V1

- Login/cadastro demonstrativo
- Home com busca e carregadores de exemplo
- Integração com health do backend
- Integração com status OCPP futuro
- Detalhe do carregador
- Seleção de data/horário
- Reserva com primeira recarga em cortesia
- Histórico
- Perfil e veículo
- Área inicial para anfitrião

A API de autenticação/reservas ainda é preparada como interface no frontend, pois o backend V1 ainda expõe apenas health e status de integração.
