" extend syntax to include additional keywords.
syntax match qfLineNr '[^|]*' contained contains=qfError,qfWarning,qfNote,qfInfo
syntax match qfError 'error' contained
syntax match qfWarning 'warning' contained
syntax match qfNote 'note' contained
syntax match qfInfo 'info' contained
" link new syntax to DiagnosticSign highlight groups.
highlight! default link qfError DiagnosticSignError
highlight! default link qfWarning DiagnosticSignWarn
highlight! default link qfNote DiagnosticSignHint
highlight! default link qfInfo DiagnosticSignInfo
