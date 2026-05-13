# 🎮 Dawnforge - Arquitetura do Projeto

## 📋 Instrução Arquitetural para Claude

**IMPORTANTE**: Este documento serve como referência arquitetural para todas as futuras sessões do Claude neste projeto. Sempre consulte esta estrutura antes de fazer modificações no código.

---

## 🎯 Visão Geral da Arquitetura

O **Dawnforge** é um jogo Flutter/Flame que segue os padrões **Clean Architecture** adaptados para games, baseado em práticas consolidadas da indústria (Unity, Unreal, games mobile).

### Princípios Fundamentais

- ✅ **Separação de responsabilidades** entre camadas
- ✅ **Entity Component System (ECS)** para flexibilidade
- ✅ **Clean Architecture** para manutenibilidade
- ✅ **Domain-Driven Design** para clareza de negócio
- ✅ **Feature-based organization** para escalabilidade

---

## 🏗️ Estrutura de Pastas Detalhada

```
lib/
├── core/                           # 🏗️ CORE - Fundações do sistema
│   ├── constants/                  # Constantes globais (cores, sizes, etc)
│   ├── enums/                      # Enumerações (GameState, Difficulty, etc)
│   ├── errors/                     # Classes de erro customizadas
│   ├── extensions/                 # Extensions para tipos primitivos
│   ├── mixins/                     # Mixins reutilizáveis
│   ├── services/                   # Interfaces de serviços
│   └── utils/                      # Utilitários e helpers globais
│
├── data/                           # 📊 DATA LAYER - Persistência e APIs
│   ├── datasources/               # Fontes de dados (local/remote)
│   │   ├── local/                 # SharedPreferences, SQLite, Hive, etc
│   │   └── remote/                # APIs, Firebase, etc
│   ├── models/                    # Data Transfer Objects (DTOs)
│   ├── repositories/              # Implementação dos repositórios
│   └── services/                  # Implementação dos serviços
│
├── domain/                         # 🎯 DOMAIN LAYER - Regras de negócio
│   ├── entities/                  # Entidades de negócio (Player, Level, etc)
│   ├── repositories/              # Interfaces dos repositórios
│   ├── usecases/                  # Casos de uso (SaveGame, LoadLevel, etc)
│   └── value_objects/             # Objetos de valor (Score, Position, etc)
│
├── presentation/                   # 🎨 PRESENTATION LAYER - UI e State Management
│   ├── shared/                    # Componentes compartilhados
│   │   ├── cubits/               # Cubits globais (theme, audio, etc)
│   │   ├── widgets/              # Widgets reutilizáveis
│   │   └── theme/                # Tema, cores, estilos
│   │
│   ├── screens/                   # Telas da aplicação
│   │   ├── splash/               # Tela de splash
│   │   ├── main_menu/            # Menu principal
│   │   ├── game_mode_selection/  # Seleção de modo
│   │   ├── difficulty_selection/ # Seleção de dificuldade
│   │   ├── save_selection/       # Seleção de saves
│   │   ├── settings/             # Configurações
│   │   ├── pause/                # Menu de pausa
│   │   ├── game_over/            # Game over
│   │   └── credits/              # Créditos
│   │
│   └── app/                       # Configuração do app Flutter
│       ├── app.dart              # Widget principal do app
│       ├── router.dart           # Roteamento/navegação
│       └── injection.dart        # Dependency injection
│
├── gameplay/                     # 🎮 GAME LAYER - Engine e Gameplay
│   ├── core/                     # Core do game engine
│   │   ├── game_instance.dart    # Instância principal do jogo
│   │   ├── game_state.dart       # Gerenciamento de estado do jogo
│   │   ├── camera_controller.dart # Controle de câmera
│   │   └── input_manager.dart    # Gerenciamento de input
│   │
│   ├── systems/                   # Sistemas do jogo (ECS pattern)
│   │   ├── movement_system.dart  # Sistema de movimento
│   │   ├── collision_system.dart # Sistema de colisão
│   │   ├── rendering_system.dart # Sistema de renderização
│   │   ├── audio_system.dart     # Sistema de áudio
│   │   └── ui_system.dart        # Sistema de UI in-game
│   │
│   ├── entities/                  # Entidades do jogo
│   │   ├── player/               # Entidade jogador
│   │   ├── enemies/              # Entidades inimigas
│   │   ├── items/                # Items do jogo
│   │   ├── environment/          # Elementos do ambiente
│   │   └── effects/              # Efeitos visuais/sonoros
│   │
│   ├── components/                # Componentes reutilizáveis (ECS)
│   │   ├── transform_component.dart    # Posição, rotação, escala
│   │   ├── sprite_component.dart       # Renderização de sprites
│   │   ├── collider_component.dart     # Componente de colisão
│   │   ├── health_component.dart       # Componente de vida
│   │   ├── inventory_component.dart    # Componente de inventário
│   │   └── behavior_component.dart     # Componentes de comportamento
│   │
│   ├── levels/                    # Gerenciamento de níveis/fases
│   │   ├── level_manager.dart    # Gerenciador de níveis
│   │   ├── level_loader.dart     # Carregador de níveis
│   │   └── level_data/           # Dados dos níveis (JSON, etc)
│   │
│   ├── ai/                        # Inteligência artificial
│   │   ├── behavior_trees/       # Árvores de comportamento
│   │   ├── state_machines/       # Máquinas de estado
│   │   └── pathfinding/          # Algoritmos de pathfinding
│   │
│   └── utils/                     # Utilitários específicos do jogo
│       ├── math_utils.dart       # Utilitários matemáticos
│       ├── collision_utils.dart  # Utilitários de colisão
│       └── performance_utils.dart # Utilitários de performance
│
├── infrastructure/                 # 🔧 INFRASTRUCTURE - Serviços externos
│   ├── audio/                     # Gerenciamento de áudio
│   ├── storage/                   # Persistência local
│   ├── analytics/                 # Analytics e métricas
│   ├── ads/                       # Sistemas de publicidade
│   ├── iap/                       # In-App Purchases
│   └── cloud/                     # Serviços de nuvem
│
├── assets/                         # 🎨 ASSETS - Recursos do jogo
│   ├── images/                    # Imagens e sprites
│   │   ├── ui/                   # Elementos de interface
│   │   ├── characters/           # Personagens
│   │   ├── environment/          # Cenários
│   │   └── effects/              # Efeitos visuais
│   ├── audio/                     # Áudios
│   │   ├── music/                # Músicas de fundo
│   │   ├── sfx/                  # Efeitos sonoros
│   │   └── voice/                # Vozes/narrações
│   ├── fonts/                     # Fontes
│   ├── data/                      # Dados do jogo (JSON, XML, etc)
│   └── shaders/                   # Shaders customizados
│
├── localization/                   # 🌍 L10N - Internacionalização
│   ├── l10n.dart                 # Configuração de localização
│   └── arb/                      # Arquivos de tradução
│
└── generated/                      # 🤖 GENERATED - Arquivos gerados
    ├── assets.gen.dart           # Assets gerados
    └── l10n/                     # Localização gerada
```

---

## 📏 Regras e Diretrizes para Claude

### 🎯 Ao Criar/Modificar Arquivos:

1. **SEMPRE seguir a estrutura de pastas** definida acima
2. **Colocar arquivos na pasta correta** baseado na responsabilidade
3. **Usar naming conventions** consistentes (snake_case para arquivos)
4. **Criar interfaces** para todos os serviços (pasta `domain/repositories/`)
5. **Implementar use cases** para ações importantes (pasta `domain/usecases/`)

### 🏗️ Padrões Arquiteturais Obrigatórios:

#### **Entity Component System (ECS)**

- Entidades são compostas por **Components** reutilizáveis
- **Systems** processam Components específicos
- Máxima flexibilidade e performance

#### **Clean Architecture Layers**

- **Domain**: Regras de negócio puras (sem dependências externas)
- **Data**: Implementação de repositórios e serviços
- **Presentation**: UI Flutter (screens, widgets, cubits)
- **Infrastructure**: Serviços externos (APIs, storage, etc)

#### **Dependency Injection**

- Usar `get_it` ou similar
- Configurar no arquivo `presentation/app/injection.dart`
- Injetar dependências via interfaces

### 🎮 Específico para Game Layer:

1. **Components** devem ser **pequenos e focados** (SRP)
2. **Systems** devem processar **um tipo de comportamento**
3. **Entities** são **combinações de Components**
4. **Evitar dependências** entre Systems
5. **Usar eventos** para comunicação entre Systems

### 🎨 Específico para Presentation Layer:

1. **Uma pasta por feature** em `screens/`
2. **Cubits** para gerenciamento de estado
3. **Widgets** reutilizáveis em `shared/widgets/`
4. **Tema centralizado** em `shared/theme/`

### 📊 Específico para Data Layer:

1. **Models** são DTOs (Data Transfer Objects)
2. **Repositories** implementam interfaces do Domain
3. **DataSources** abstraem local/remote
4. **Services** encapsulam lógica de infraestrutura

---

## 🔧 Stack Tecnológica

### **Core**

- Flutter ^3.35.0
- Dart ^3.9.0

### **Game Engine**

- Flame ^1.32.0
- Flame Audio ^2.11.10
- Flame Behaviors ^1.2.0

### **State Management**

- flutter_bloc ^9.1.1
- bloc ^9.0.0

### **UI**

- google_fonts ^6.3.1
- Material Design 3

### **Audio**

- audioplayers ^6.5.1

### **Utilities**

- equatable ^2.0.7
- intl ^0.20.2

---

## 📚 Referências de Boas Práticas

### **Naming Conventions**

- **Arquivos**: `snake_case.dart`
- **Classes**: `PascalCase`
- **Variáveis/Métodos**: `camelCase`
- **Constantes**: `UPPER_SNAKE_CASE`

### **Organização de Imports**

```dart
// 1. Dart imports
import 'dart:async';

// 2. Flutter imports
import 'package:flutter/material.dart';

// 3. Package imports
import 'package:bloc/bloc.dart';

// 4. Project imports
import 'package:dawnforge/core/core.dart';
```

### **Estrutura de Arquivo**

```dart
// 1. Imports
// 2. Constants/Enums
// 3. Main class
// 4. Private methods
// 5. Extensions (se necessário)
```

---

## 🚀 Migração da Estrutura Atual

### **Status Atual**

```
lib/
├── app/           # → presentation/
├── game/          # → game/ (manter, mas reorganizar)
├── gen/           # → generated/
└── l10n/          # → localization/
```

### **Prioridades de Migração**

1. **Criar estrutura de pastas**
2. **Mover arquivos gradualmente**
3. **Implementar dependency injection**
4. **Criar interfaces de repositórios**
5. **Implementar use cases principais**

---

## 🎯 Benefícios Esperados

1. **📈 Escalabilidade**: Fácil adicionar novas features
2. **🔧 Manutenibilidade**: Código mais organizado e legível
3. **🧪 Testabilidade**: Estrutura que facilita testes
4. **👥 Colaboração**: Padrão familiar para devs de games
5. **🔄 Reutilização**: Componentes e systems reutilizáveis
6. **🚀 Performance**: Estrutura otimizada para games

---

**⚠️ LEMBRETE PARA CLAUDE**: Sempre consulte este documento antes de fazer qualquer modificação estrutural no projeto. Esta arquitetura é obrigatória e deve ser seguida rigorosamente.
