# 🏋️ GymTracker

App web personal para registrar entrenamientos, seguir tu progreso y gestionar rutinas de gimnasio. Sin instalación, sin servidor, sin cuenta — abre el archivo y empieza a entrenar.

---

## ✨ Funcionalidades

### 📋 Registro de entrenamientos
- Inicia sesiones con nombre personalizado
- Timer en vivo desde que empiezas
- Añade ejercicios sobre la marcha
- Registra series, kg y repeticiones
- Marca cada serie como completada ✓
- Notas por entrenamiento
- Historial completo con volumen y duración

### 💪 Biblioteca de ejercicios
- 45+ ejercicios incluidos organizados por grupo muscular
- Filtros por músculo: Pecho, Espalda, Hombros, Bíceps, Tríceps, Piernas, Glúteos, Core y Cardio
- Buscador instantáneo
- Crea tus propios ejercicios personalizados
- Elimina los ejercicios que no uses

### 📋 Rutinas
- Crea plantillas de entrenamiento reutilizables
- Define ejercicios, series, reps y peso base
- Lanza una rutina directamente como entrenamiento con un clic
- Edita y reordena ejercicios

### 📈 Progreso
- Gráfica de volumen por sesión
- Frecuencia semanal de entrenamientos
- Curva de fuerza por ejercicio (peso máximo histórico)
- Estadísticas: total sesiones, volumen acumulado, racha de días

---

## 🚀 Cómo usarlo

### Opción 1 — Doble clic (más fácil)
Abre `index.html` directamente en el navegador. Los datos se guardan automáticamente en el navegador.

### Opción 2 — Servidor local (recomendado)
```powershell
# Clic derecho en serve.ps1 → Ejecutar con PowerShell
# O desde la terminal:
powershell -ExecutionPolicy Bypass -File serve.ps1
```
Luego abre [http://localhost:3000](http://localhost:3000)

> **Nota:** Con el servidor local los datos siempre están en la misma URL (`localhost:3000`), lo que evita pérdidas si mueves la carpeta.

---

## 🗂️ Estructura

```
Gymtrack/
├── index.html    # App completa (HTML + CSS + JS en un solo archivo)
├── serve.ps1     # Servidor local para Windows (PowerShell)
├── server.cs     # Código fuente del servidor
└── .gitignore
```

---

## 💾 Almacenamiento de datos

Todos los datos se guardan en el `localStorage` del navegador — no se envía nada a ningún servidor externo. Los datos persisten entre sesiones mientras uses el mismo navegador y la misma URL/ruta de archivo.

---

## 🛠️ Tecnologías

- HTML5 + CSS3 + JavaScript vanilla
- Canvas API para las gráficas (sin librerías externas)
- localStorage para persistencia de datos
- Sin frameworks, sin dependencias, sin build tools

---

## 📱 Compatibilidad

Funciona en cualquier navegador moderno: Chrome, Firefox, Edge, Safari.
Diseño responsive adaptado a móvil y escritorio.
