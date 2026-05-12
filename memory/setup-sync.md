---
name: setup-sync
description: Configuracion de sincronizacion de Claude Code entre sobremesa y laptop via Google Drive + GitHub
metadata: 
  node_type: memory
  type: project
  originSessionId: 3e14cadc-5c68-4e93-a025-fb4355b6d558
---

Google Drive montado en G:\Mi unidad\ en ambos PCs.
Repo GitHub: https://github.com/adrianlopezq/Claude

Estructura en Drive:
- G:\Mi unidad\Claude\        — carpeta de trabajo general (symlink en Desktop)
- G:\Mi unidad\RITUAL\        — gestion Ritual Burger (symlink en Desktop)
- G:\Mi unidad\claude-config\ — memoria, settings, commands, keybindings de Claude

Symlinks configurados en sobremesa:
- Desktop\Claude -> G:\Mi unidad\Claude
- Desktop\RITUAL -> G:\Mi unidad\RITUAL
- ~/.claude/projects/c--Users-adria--claude/memory -> G:\Mi unidad\claude-config\memory

Pendiente: actualizar project hash a c--Users-adria-Desktop-Claude y ejecutar setup.ps1 en laptop.
Ver G:\Mi unidad\claude-config\PENDIENTES.txt para detalle completo.

**Why:** Adrian trabaja en dos PCs y quiere continuidad total entre sesiones.
**How to apply:** Al empezar sesion, revisar PENDIENTES.txt si hay tareas abiertas.
