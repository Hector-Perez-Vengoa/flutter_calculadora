# Componentes y definiciones de la calculadora estática

Este documento describe los componentes introducidos en `lib/main.dart` para crear una calculadora con diseño oscuro y acentos plateados, puramente estética.

## Widgets principales

- **`CalculatorApp`** (`lib/main.dart`): Aplicación principal que configura el tema oscuro con colores plateados y establece la pantalla inicial.
- **`CalculatorScreen`** (`lib/main.dart`): Pantalla única de la calculadora que contiene el panel de visualización y la grilla de botones.

## Widgets de apoyo

- **`CalculatorButton`** (`lib/main.dart`): Botón personalizado que representa cada tecla de la calculadora, con diferentes estilos según el tipo (número, operador).

## Propiedades y definiciones

### Colores utilizados
- **Fondo principal**: `Color(0xFF0F1117)` - Gris oscuro casi negro
- **Panel de visualización**: `Color(0xFF171B22)` - Gris oscuro con tinte azulado
- **Botones normales**: `Color(0xFF1A2030)` - Azul grisáceo oscuro
- **Botones operadores**: `Color(0xFF2A2F3A)` - Azul grisáceo más claro
- **Texto plateado**: `Color(0xFFCFCFCF)` - Plateado claro
- **Texto secundario**: `Color(0xFF9EA3AE)` - Gris medio
- **Bordes**: `Color(0x66C0C0C0)` - Plateado semitransparente

### Parámetros del widget `CalculatorButton`
- **`label`**: Texto que se muestra en el botón
- **`isOperator`**: Boolean que determina si el botón es un operador (cambia el estilo visual)

### Layout
- **GridView**: Organiza los botones en una cuadrícula de 4 columnas
- **Container con decoración**: Cada botón tiene bordes redondeados y colores específicos
- **SafeArea**: Respeta las áreas seguras del dispositivo

Todos los elementos son estáticos y no contienen lógica funcional; solo replican la apariencia visual deseada con tema oscuro y acentos plateados.
