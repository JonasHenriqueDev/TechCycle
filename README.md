# 🌱 TechCycle

Uma aplicação Flutter para promover a reciclagem e sustentabilidade de equipamentos eletrônicos através de um sistema de recompensas e pontos de coleta.

## 📱 Sobre o Projeto

TechCycle é uma plataforma mobile desenvolvida em Flutter que conecta usuários a pontos de coleta de equipamentos eletrônicos, incentivando a reciclagem através de um sistema de recompensas. O aplicativo oferece uma maneira prática e sustentável de descartar dispositivos eletrônicos antigos.

### ✨ Funcionalidades

- 🗺️ **Mapa de Pontos de Coleta**: Visualize pontos de coleta próximos usando Google Maps
- 📍 **Geolocalização**: Encontre os pontos de coleta mais próximos de você
- 🎁 **Sistema de Recompensas**: Ganhe recompensas ao reciclar seus equipamentos
- 📢 **Anúncios**: Fique por dentro das novidades e campanhas de reciclagem
- 🔐 **Sistema de Autenticação**: Login e cadastro de usuários
- 🌐 **Internacionalização**: Suporte a múltiplos idiomas

## 🚀 Tecnologias Utilizadas

- **Flutter** - Framework multiplataforma
- **Dart** - Linguagem de programação
- **Provider** - Gerenciamento de estado
- **Google Maps Flutter** - Integração com mapas
- **Geolocator** - Serviços de geolocalização
- **HTTP** - Requisições de API

## 📋 Pré-requisitos

Antes de começar, certifique-se de ter os seguintes requisitos instalados:

- Flutter SDK (>=3.4.0 <4.0.0)
- Dart SDK
- Android Studio / Xcode (para desenvolvimento mobile)
- Git

## 🔧 Instalação

1. Clone o repositório:
```bash
git clone https://github.com/JonasHenriqueDev/TechCycle.git
```

2. Entre no diretório do projeto:
```bash
cd TechCycle
```

3. Instale as dependências:
```bash
flutter pub get
```

4. Configure as chaves de API necessárias (Google Maps, etc.)

5. Execute o aplicativo:
```bash
flutter run
```

## 📂 Estrutura do Projeto

```
lib/
├── main.dart                 # Ponto de entrada do aplicativo
└── src/
    ├── model/               # Modelos de dados
    ├── provider/            # Gerenciadores de estado
    │   ├── anuncio_provider.dart
    │   ├── pontos_coleta_provider.dart
    │   └── recompensa_provider.dart
    ├── view/                # Telas do aplicativo
    │   ├── HomePage.dart
    │   ├── LoginPage.dart
    │   └── LoadingPage.dart
    ├── localization/        # Arquivos de internacionalização
    └── settings/            # Configurações do aplicativo
```

## 🧪 Testes

Execute os testes com:

```bash
flutter test
```

## 🌍 Plataformas Suportadas

- ✅ Android
- ✅ iOS
- ✅ Web
- ✅ Windows
- ✅ Linux
- ✅ macOS

## 👨‍💻 Autor

**Jonas Henrique**

- GitHub: [@JonasHenriqueDev](https://github.com/JonasHenriqueDev)

⭐ Se este projeto foi útil para você, considere dar uma estrela!

🌱 **Juntos por um planeta mais sustentável!**
