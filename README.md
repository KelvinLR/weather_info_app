# ☀️ WeatherInfo APP

O WeatherInfo é um aplicativo desenvolvido em Flutter para o Desafio Mobile do Laboratório de Processamento de Imagens, Sinais e Computação Aplicada (LAPISCO) do IFCE, com o objetivo de avaliar o nível de conhecimento em cada stack escolhida durante o processo seletivo para o laboratório.

O app disponibiliza informações detalhadas a respeito do tempo atual, bem como previsão de temperatura máxima e mínima para os próximos sete dias.

A UI do aplicativo conta com possibilidade de modo claro e escuro, definido automaticamente de acordo com o tema do dispositivo onde está sendo utilizado.

### 📋 Objetivos principais
- Retornar dados meteorológicos de acordo com a cidade pesquisada
    - Dados atuais: Temperatura, Índice UV, Velocidade do Vento
    - Previsão para 7 dias: Temperatura máxima e mínima
- Mostrar informações meteorológicas para o local atual
- UI adaptativa com modo claro e escuro

### 💻 Ferramentas utilizadas
- **Dart:** Linguagem de programação
- **Flutter:** Framework de desenvolvimento mobile multiplataforma
- **BloC:** Gerenciamento de estados
- **Visual Studio Code:** IDE
- **Figma:** Inspiração para UI design

### 🛠️ Requisitos necessários
- Smartphone Android ou iOS
- Flutter SDK mais recente

### 🛜 APIs
- OpenMeteo API

### ⚙️ Dependências
pubspec.yaml
```
  carousel_slider: ^5.0.0
  fl_chart: ^0.70.2
  flutter_bloc: ^9.0.0
  geocoding: ^3.0.0
  geolocator: ^13.0.2
  get_ip_address: ^0.0.7
  http: ^1.3.0
```

### 📱 Utilização
**1.** Configure as dependências do pubspec.yaml
```
flutter pub get
```
**2.** Conecte um dispositivo Android ou iOS
**3.** Rode a aplicação com o comando abaixo
```
flutter run
```


