# Migration de Telescope vers Snacks Picker

## Changements effectués

### 1. Configuration du Picker
- Nouveau fichier: `lua/configs/picker.lua`
  - Configuration complète de Snacks Picker
  - Intégration des couleurs NvChad (comme pour lazygit)
  - Keymaps pour toutes les fonctions principales

### 2. Highlights personnalisés (thème NvChad)
Les highlights suivants ont été créés pour matcher le thème NvChad:
- `SnacksPickerBorder` - Bordure active (bleu)
- `SnacksPickerNormalBorder` - Bordure normale (gris)
- `SnacksPickerTitle` - Titre (bleu gras)
- `SnacksPickerMatch` - Texte correspondant (bleu nord)
- `SnacksPickerCursor` - Curseur de sélection
- etc.

### 3. Plugins modifiés
- `lua/plugins/init.lua`:
  - Telescope désactivé (commenté)
  - telescope-ui-select désactivé (remplacé par picker.ui_select)
  - Snacks.nvim configuré avec le picker
  - haskell-tools: dépendance telescope retirée

### 4. Mappings mis à jour
- `lua/mappings.lua`:
  - `<leader>fh` utilise maintenant Snacks Picker au lieu de Telescope

- `lua/configs/snacks.lua`:
  - Keymaps du picker ajoutés

## Keymaps principaux

### Navigation des fichiers
- `<leader><space>` - Smart Find Files
- `<leader>ff` - Find Files
- `<leader>fa` - Find All Files (Hidden + Ignored)
- `<leader>fh` - Find Files (Hidden + Ignored) - alternative
- `<leader>fb` - Buffers
- `<leader>fo` - Recent Files
- `<leader>fz` - Live Grep
- `<leader>/` - Grep

### Git
- `<leader>gb` - Git Branches
- `<leader>gc` - Git Commits (log)
- `<leader>gs` - Git Status

### LSP
- `gr` - LSP References
- `gd` - LSP Definitions
- `<leader>ls` - LSP Document Symbols
- `<leader>ld` - LSP Diagnostics

### Sélecteur de thème (NvChad style)
- `<leader>th` - Theme Picker (Colorschemes)

### Recherche
- `<leader>sb` - Buffer Lines
- `<leader>sk` - Keymaps
- `<leader>sc` - Commands
- `<leader>sm` - Marks
- `<leader>sr` - Resume Last Picker
- `<leader>:` - Command History

### Autres
- `<leader>,` - Buffers
- `<leader>fw` - Grep Word (normal/visual)

## Navigation dans le Picker

### Mode Input
- `<C-j>/<C-k>` ou `<C-n>/<C-p>` - Naviguer dans la liste
- `<C-d>/<C-u>` - Scroll de la liste
- `<C-f>/<C-b>` - Scroll de la preview
- `<Tab>/<S-Tab>` - Sélectionner et naviguer
- `<C-a>` - Sélectionner tout
- `<C-q>` - Envoyer à quickfix list
- `<C-v>` - Ouvrir en split vertical
- `<C-s>` - Ouvrir en split horizontal
- `<C-t>` - Ouvrir dans un nouvel onglet
- `<a-h>` - Toggle fichiers cachés
- `<a-i>` - Toggle fichiers ignorés
- `<a-p>` - Toggle preview
- `<CR>` - Confirmer la sélection
- `<Esc>` - Annuler

### Mode List
- `j/k` - Naviguer
- `gg/G` - Aller au début/fin
- `<C-d>/<C-u>` - Scroll
- `<CR>` - Confirmer
- `<C-v>/<C-s>/<C-t>` - Ouvrir en split/tab
- `<Esc>` ou `q` - Annuler

## Avantages de Snacks Picker

1. **Performance** - Plus rapide que Telescope
2. **Intégration** - Meilleure intégration avec l'écosystème Snacks
3. **UI/UX** - Interface moderne et cohérente
4. **Personnalisation** - Configuration plus flexible
5. **Thème** - S'adapte automatiquement au thème NvChad

## Notes

- Le sélecteur de thème (`<leader>th`) fonctionne comme le picker de NvChad
- Les highlights sont synchronisés avec le thème actif via base46
- `vim.ui.select` est automatiquement remplacé par le picker de Snacks
- Compatible avec tous les plugins qui utilisent `vim.ui.select`
