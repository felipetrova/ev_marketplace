# EV Marketplace — CarCharge

Marketplace brasileiro de recarga de veículos elétricos. Este repositório contém o **app Flutter** (frontend) e a **API NestJS** (backend).

Este guia explica como preparar uma máquina **macOS, Windows ou Linux** do zero e rodar o projeto.

---

## Sumário

1. [Estrutura do repositório](#1-estrutura-do-repositório)
2. [Ferramentas necessárias](#2-ferramentas-necessárias)
3. [Instalação por sistema operacional](#3-instalação-por-sistema-operacional)
   - [macOS](#31-macos)
   - [Windows](#32-windows)
   - [Linux (Ubuntu/Debian)](#33-linux-ubuntudebian)
4. [Verificando o ambiente](#4-verificando-o-ambiente)
5. [Rodando o backend](#5-rodando-o-backend)
6. [Rodando o frontend](#6-rodando-o-frontend)
7. [URL da API por destino](#7-url-da-api-por-destino)
8. [Checklist rápido](#8-checklist-rápido)
9. [Solução de problemas](#9-solução-de-problemas)

---

## 1. Estrutura do repositório

```
.
├── EV_Marketplace_Flutter_Frontend_V1/   # App Flutter (Android, iOS, Web, macOS, Windows, Linux)
│   ├── lib/                              # Código Dart
│   ├── test/                             # Testes
│   └── pubspec.yaml
└── ev-marketplace-v1/                    # API NestJS + Prisma
    ├── backend/
    │   ├── src/                          # Código TypeScript
    │   ├── prisma/schema.prisma          # Modelo de dados
    │   └── .env.example                  # Variáveis de ambiente
    ├── docker-compose.yml                # PostgreSQL
    └── package.json                      # Workspace npm
```

---

## 2. Ferramentas necessárias

| Ferramenta | Versão | Para quê | Obrigatória? |
|---|---|---|---|
| Git | qualquer recente | Clonar o repositório | Sim |
| Node.js | **20.12+** (recomendado 22 LTS) | Rodar o backend | Sim |
| Flutter SDK | **3.44+** (Dart 3.12+) | Rodar o app | Sim |
| Google Chrome | qualquer recente | Rodar o app no navegador | Recomendada (destino mais simples) |
| Docker | Docker Desktop / Docker Engine | Banco PostgreSQL | Só para banco/migrations |
| Android Studio | qualquer recente | Emulador Android | Só para Android |
| Xcode + CocoaPods | Xcode recente | iOS Simulator e app macOS | Só para iOS/macOS (apenas no macOS) |
| Visual Studio 2022 | workload "Desktop development with C++" | App desktop Windows | Só para Windows desktop |

> **Qual destino posso rodar em cada sistema?**
>
> | Destino | macOS | Windows | Linux |
> |---|:-:|:-:|:-:|
> | Chrome (Web) | ✅ | ✅ | ✅ |
> | Emulador Android | ✅ | ✅ | ✅ |
> | iOS Simulator | ✅ | ❌ | ❌ |
> | Desktop nativo | ✅ macOS | ✅ Windows | ✅ Linux |

---

## 3. Instalação por sistema operacional

Siga **apenas** a seção do seu sistema. Itens marcados como *(opcional)* dependem do destino que você quer usar.

### 3.1 macOS

- [ ] **Homebrew** (gerenciador de pacotes)
  ```bash
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  ```
- [ ] **Git**
  ```bash
  brew install git
  ```
- [ ] **Node.js** (via nvm)
  ```bash
  brew install nvm
  mkdir -p ~/.nvm
  # Adicione ao ~/.zshrc as linhas que o brew exibir ao final da instalação e abra um novo terminal
  nvm install 22
  nvm use 22
  ```
- [ ] **Flutter SDK**
  ```bash
  mkdir -p ~/development && cd ~/development
  git clone https://github.com/flutter/flutter.git -b stable
  echo 'export PATH="$HOME/development/flutter/bin:$PATH"' >> ~/.zshrc
  source ~/.zshrc
  flutter --version
  ```
- [ ] **Google Chrome**: https://www.google.com/chrome/
- [ ] *(opcional — banco)* **Docker Desktop**: https://www.docker.com/products/docker-desktop/
- [ ] *(opcional — iOS/macOS)* **Xcode** pela App Store, depois:
  ```bash
  sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
  sudo xcodebuild -runFirstLaunch
  sudo xcodebuild -license accept
  brew install cocoapods
  ```
  Abra o Xcode uma vez e instale os componentes/plataforma iOS que ele oferecer.
- [ ] *(opcional — Android)* **Android Studio**: https://developer.android.com/studio
  - No primeiro uso, instale o Android SDK pelo assistente.
  - Em **Settings → Languages & Frameworks → Android SDK → SDK Tools**, marque **Android SDK Command-line Tools**.
  - Em **Device Manager**, crie um emulador (ex.: Pixel, API recente).
  ```bash
  flutter doctor --android-licenses
  ```

### 3.2 Windows

> Use o **PowerShell**. Os comandos `winget` já vêm no Windows 10/11 atualizado.

- [ ] **Git**
  ```powershell
  winget install --id Git.Git -e
  ```
- [ ] **Node.js 22 LTS**
  ```powershell
  winget install --id OpenJS.NodeJS.LTS -e
  ```
- [ ] **Flutter SDK**
  ```powershell
  mkdir C:\dev
  cd C:\dev
  git clone https://github.com/flutter/flutter.git -b stable
  ```
  Adicione `C:\dev\flutter\bin` ao **PATH**: *Iniciar → "Editar as variáveis de ambiente do sistema" → Variáveis de Ambiente → Path (usuário) → Novo*. Feche e abra o terminal e rode:
  ```powershell
  flutter --version
  ```
  > Não instale o Flutter em pastas com espaços ou que exijam permissão de administrador (ex.: `C:\Program Files`).
- [ ] **Google Chrome**
  ```powershell
  winget install --id Google.Chrome -e
  ```
- [ ] *(opcional — banco)* **Docker Desktop** (requer WSL 2)
  ```powershell
  wsl --install
  winget install --id Docker.DockerDesktop -e
  ```
  Reinicie o computador e abra o Docker Desktop uma vez.
- [ ] *(opcional — Android)* **Android Studio**
  ```powershell
  winget install --id Google.AndroidStudio -e
  ```
  Siga os mesmos passos do macOS (SDK, Command-line Tools, emulador) e depois:
  ```powershell
  flutter doctor --android-licenses
  ```
- [ ] *(opcional — Windows desktop)* **Visual Studio 2022 Community** com o workload **"Desktop development with C++"**: https://visualstudio.microsoft.com/

### 3.3 Linux (Ubuntu/Debian)

> Em outras distribuições, troque `apt` pelo gerenciador equivalente.

- [ ] **Pacotes básicos** (Git e dependências do Flutter)
  ```bash
  sudo apt update
  sudo apt install -y git curl unzip xz-utils zip libglu1-mesa
  ```
- [ ] **Node.js** (via nvm)
  ```bash
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
  source ~/.bashrc
  nvm install 22
  nvm use 22
  ```
- [ ] **Flutter SDK**
  ```bash
  mkdir -p ~/development && cd ~/development
  git clone https://github.com/flutter/flutter.git -b stable
  echo 'export PATH="$HOME/development/flutter/bin:$PATH"' >> ~/.bashrc
  source ~/.bashrc
  flutter --version
  ```
- [ ] **Google Chrome**: https://www.google.com/chrome/ (ou Chromium; se necessário, aponte o Flutter para ele com `export CHROME_EXECUTABLE=/usr/bin/chromium`)
- [ ] *(opcional — banco)* **Docker Engine**: https://docs.docker.com/engine/install/ubuntu/
  ```bash
  sudo usermod -aG docker $USER   # permite usar docker sem sudo (faça logout/login depois)
  ```
- [ ] *(opcional — Linux desktop)*
  ```bash
  sudo apt install -y clang cmake ninja-build pkg-config libgtk-3-dev liblzma-dev libstdc++-12-dev
  ```
- [ ] *(opcional — Android)* **Android Studio**: https://developer.android.com/studio (ou `sudo snap install android-studio --classic`). Siga os mesmos passos do macOS e rode `flutter doctor --android-licenses`.
  > O emulador Android precisa de aceleração KVM: `sudo apt install -y qemu-kvm && sudo usermod -aG kvm $USER`.

---

## 4. Verificando o ambiente

Em qualquer sistema, rode:

```bash
git --version
node -v          # deve ser v20.12 ou superior
npm -v
flutter --version
flutter doctor
```

O `flutter doctor` mostra um ✓ para cada destino configurado. Não é preciso ter tudo verde: basta que o destino que você vai usar esteja OK (por exemplo, apenas **Chrome**).

---

## 5. Rodando o backend

### 5.1 Clonar o repositório

```bash
git clone <URL-DO-REPOSITORIO>
cd <PASTA-DO-REPOSITORIO>
```

### 5.2 Instalar e configurar

```bash
cd ev-marketplace-v1
npm install
```

Crie o arquivo de ambiente a partir do exemplo:

| macOS / Linux | Windows (PowerShell) |
|---|---|
| `cp backend/.env.example backend/.env` | `Copy-Item backend\.env.example backend\.env` |

Variáveis disponíveis em `backend/.env`:

| Variável | Padrão | Descrição |
|---|---|---|
| `DATABASE_URL` | `postgresql://evmarketplace:evmarketplace@localhost:5432/evmarketplace?schema=public` | Conexão com o PostgreSQL do Docker Compose |
| `PORT` | `3000` | Porta da API |
| `API_PREFIX` | `api/v1` | Prefixo das rotas |

Gere o cliente do Prisma:

```bash
npm run prisma:generate
```

### 5.3 Subir a API

```bash
npm run start:dev
```

Teste no navegador ou no terminal: http://localhost:3000/api/v1/health

```json
{"status":"ok","service":"ev-marketplace-backend","version":"0.1.0", "...": "..."}
```

### 5.4 Banco de dados (opcional nesta V1)

Os endpoints atuais (`/health` e `/charging/integration/status`) **não usam o banco**, então este passo pode ser pulado para rodar o app. Para criar as tabelas no PostgreSQL:

```bash
docker compose up -d        # sobe o PostgreSQL na porta 5432
npm run prisma:migrate      # cria as tabelas a partir do schema.prisma
```

Para parar o banco: `docker compose down` (os dados ficam no volume `postgres_data`).

### 5.5 Comandos do backend

| Comando (dentro de `ev-marketplace-v1/`) | O que faz |
|---|---|
| `npm run start:dev` | API em modo desenvolvimento (reinicia ao salvar) |
| `npm run build` | Compila para `backend/dist` |
| `npm run prisma:generate` | Gera o cliente Prisma |
| `npm run prisma:migrate` | Aplica migrations no banco |

---

## 6. Rodando o frontend

> Mantenha o backend rodando em outro terminal. Sem ele, o app abre em **modo demonstração**.

### 6.1 Instalar dependências

```bash
cd EV_Marketplace_Flutter_Frontend_V1
flutter pub get
```

### 6.2 Escolher o destino e rodar

Liste os destinos disponíveis:

```bash
flutter devices
```

| Destino | Como preparar | Comando |
|---|---|---|
| **Chrome** (todos os SO) | Nada | `flutter run -d chrome` |
| **iOS Simulator** (macOS) | `open -a Simulator` | `flutter run -d "iPhone 16"` *(use o nome exibido em `flutter devices`)* |
| **Emulador Android** | Inicie pelo Android Studio (Device Manager) ou `flutter emulators --launch <id>` | `flutter run -d emulator-5554` *(ou o id exibido)* |
| **macOS desktop** | Xcode instalado | `flutter run -d macos` |
| **Windows desktop** | Visual Studio C++ | `flutter run -d windows` |
| **Linux desktop** | Pacotes da seção 3.3 | `flutter run -d linux` |

Com o backend acessível, o rodapé da tela inicial mostra **"Backend conectado"**.

Durante a execução, no terminal: `r` = hot reload, `R` = hot restart, `q` = sair.

> A primeira execução em iOS/macOS roda o `pod install` e pode levar alguns minutos.

### 6.3 Testes e análise

```bash
flutter analyze
flutter test
```

---

## 7. URL da API por destino

O app escolhe a URL automaticamente (`lib/core/network/api_config.dart`):

| Destino | URL usada |
|---|---|
| Emulador Android | `http://10.0.2.2:3000/api/v1` (endereço do computador visto pelo emulador) |
| Chrome, iOS Simulator, desktop | `http://localhost:3000/api/v1` |

**Celular físico** (ou backend em outra máquina): use o IP do computador na rede local e informe na execução:

```bash
flutter run --dart-define=API_BASE_URL=http://192.168.0.10:3000/api/v1
```

Para descobrir o IP: `ipconfig getifaddr en0` (macOS), `ipconfig` (Windows), `hostname -I` (Linux). O celular e o computador precisam estar na mesma rede Wi-Fi.

---

## 8. Checklist rápido

Para quem já tem as ferramentas instaladas:

- [ ] `git clone <URL-DO-REPOSITORIO>`
- [ ] `cd ev-marketplace-v1 && npm install`
- [ ] Copiar `backend/.env.example` para `backend/.env`
- [ ] `npm run prisma:generate`
- [ ] `npm run start:dev` → abrir http://localhost:3000/api/v1/health
- [ ] Em outro terminal: `cd EV_Marketplace_Flutter_Frontend_V1 && flutter pub get`
- [ ] `flutter run -d chrome` (ou outro destino)
- [ ] Ver **"Backend conectado"** na tela inicial

---

## 9. Solução de problemas

| Problema | Solução |
|---|---|
| `flutter: command not found` / `'flutter' não é reconhecido` | A pasta `flutter/bin` não está no PATH. Revise a instalação do Flutter e **abra um novo terminal**. |
| App mostra **"Modo demonstração — backend indisponível"** | Confirme que a API está rodando (`/health` responde) e que a URL está correta para o destino (seção 7). No celular físico, use `--dart-define` com o IP do computador. |
| iPhone não aparece em `flutter devices` | O simulador precisa estar ligado: `open -a Simulator` ou `xcrun simctl boot "iPhone 16"`. |
| `Unable to find application named 'Simulator'` | Instalação do Xcode incompleta. Rode `sudo xcodebuild -runFirstLaunch`, abra o Xcode e instale os componentes; se persistir, reinstale o Xcode. |
| `CocoaPods not installed` | `brew install cocoapods` |
| `Android license status unknown` | `flutter doctor --android-licenses` e aceite tudo. |
| `cmdline-tools component is missing` | No Android Studio: **SDK Manager → SDK Tools → Android SDK Command-line Tools**. |
| `Error: listen EADDRINUSE :::3000` | A porta 3000 está em uso. Feche o outro processo ou mude `PORT` em `backend/.env` (e use `--dart-define=API_BASE_URL` no app). |
| `Environment variable not found: DATABASE_URL` | O arquivo `backend/.env` não foi criado (seção 5.2). |
| `Can't reach database server at localhost:5432` | O PostgreSQL não está rodando: `docker compose up -d` e verifique com `docker ps`. |
| `docker: command not found` / daemon não responde | Instale e **abra** o Docker Desktop (macOS/Windows) ou inicie o serviço: `sudo systemctl start docker` (Linux). |
| `process.loadEnvFile is not a function` | Node.js antigo. Atualize para 20.12+ (`nvm install 22`). |
| Erros estranhos após atualizar dependências | Frontend: `flutter clean && flutter pub get`. Backend: apague `node_modules` e rode `npm install`. |

---

## Stack

- **Frontend:** Flutter / Dart, Material 3, Provider, HTTP, Shared Preferences
- **Backend:** Node.js, TypeScript, NestJS 11, Prisma 6, PostgreSQL 16, Docker Compose

Documentação específica de cada parte:

- [`EV_Marketplace_Flutter_Frontend_V1/README.md`](EV_Marketplace_Flutter_Frontend_V1/README.md)
- [`ev-marketplace-v1/README.md`](ev-marketplace-v1/README.md)
- [`ev-marketplace-v1/docs/API-V1.md`](ev-marketplace-v1/docs/API-V1.md)
- [`ev-marketplace-v1/docs/ARCHITECTURE.md`](ev-marketplace-v1/docs/ARCHITECTURE.md)
