" Kanagawa Dragon colorscheme for Vim
" A warmer, moodier dark theme from the Kanagawa family
" Ported from https://github.com/rebelot/kanagawa.nvim

highlight clear
if exists("syntax_on")
    syntax reset
endif

let g:colors_name = "kanagawa-dragon"
set background=dark

" ============================================================================
" Dragon Palette
" ============================================================================

" Background colors (warm blacks/browns)
let s:dragonBlack0 = "#0d0c0c"  " Darkest - floats, statuslines
let s:dragonBlack1 = "#12120f"  " Very dark
let s:dragonBlack2 = "#1D1C19"  " Dark
let s:dragonBlack3 = "#181616"  " Default background
let s:dragonBlack4 = "#282727"  " Lighter (cursorline)
let s:dragonBlack5 = "#393836"  " Even lighter (colorcolumn)
let s:dragonBlack6 = "#625e5a"  " Line numbers, non-text

" Foreground colors
let s:dragonWhite  = "#c5c9c5"  " Default foreground
let s:oldWhite     = "#C8C093"  " Dark foreground (statuslines)
let s:dragonGray   = "#a6a69c"  " Bright black / muted text
let s:dragonGray2  = "#9e9b93"  " Alt gray
let s:dragonGray3  = "#7a8382"  " Special, darker gray
let s:dragonAsh    = "#737c73"  " Comments

" Selection and search
let s:waveBlue1    = "#223249"  " Visual selection, popup bg
let s:waveBlue2    = "#2D4F67"  " Search background, popup selection

" Diff colors (shared with wave)
let s:winterGreen  = "#2B3328"
let s:winterYellow = "#49443C"
let s:winterRed    = "#43242B"
let s:winterBlue   = "#252535"

" Git/VCS colors
let s:autumnGreen  = "#76946A"
let s:autumnRed    = "#C34043"
let s:autumnYellow = "#DCA561"

" Diagnostic colors
let s:samuraiRed   = "#E82424"  " Error
let s:roninYellow  = "#FF9E3B"  " Warning
let s:waveAqua1    = "#6A9589"  " Info
let s:dragonBlue   = "#658594"  " Hint

" Dragon syntax colors (more muted than wave)
let s:dragonViolet = "#8992a7"  " Statements, keywords
let s:dragonBlue2  = "#8ba4b0"  " Functions
let s:dragonTeal   = "#949fb5"  " Specials
let s:dragonAqua   = "#8ea4a2"  " Types
let s:dragonGreen  = "#87a987"  " Strings
let s:dragonGreen2 = "#8a9a7b"  " Alt green
let s:dragonYellow = "#c4b28a"  " Identifiers
let s:dragonOrange = "#b6927b"  " Constants
let s:dragonOrange2 = "#b98d7b" " Booleans, imports
let s:dragonPink   = "#a292a3"  " Numbers
let s:dragonRed    = "#c4746e"  " Builtin variables, standout

" Shared accent colors
let s:springBlue   = "#7FB4CA"
let s:springViolet1 = "#938AA9"
let s:springViolet2 = "#9CABCA"
let s:carpYellow   = "#E6C384"
let s:waveRed      = "#E46876"
let s:peachRed     = "#FF5D62"
let s:surimiOrange = "#FFA066"
let s:waveAqua2    = "#7AA89F"
let s:boatYellow2  = "#C0A36E"

" ============================================================================
" 256-color terminal palette mapping
" ============================================================================

let s:cterm = {}
let s:cterm['#0d0c0c'] = 232
let s:cterm['#12120f'] = 233
let s:cterm['#1D1C19'] = 234
let s:cterm['#181616'] = 233
let s:cterm['#282727'] = 235
let s:cterm['#393836'] = 237
let s:cterm['#625e5a'] = 240
let s:cterm['#c5c9c5'] = 251
let s:cterm['#C8C093'] = 144
let s:cterm['#a6a69c'] = 145
let s:cterm['#9e9b93'] = 144
let s:cterm['#7a8382'] = 102
let s:cterm['#737c73'] = 243
let s:cterm['#223249'] = 236
let s:cterm['#2D4F67'] = 238
let s:cterm['#2B3328'] = 236
let s:cterm['#49443C'] = 238
let s:cterm['#43242B'] = 52
let s:cterm['#252535'] = 235
let s:cterm['#76946A'] = 107
let s:cterm['#C34043'] = 167
let s:cterm['#DCA561'] = 179
let s:cterm['#E82424'] = 196
let s:cterm['#FF9E3B'] = 214
let s:cterm['#6A9589'] = 108
let s:cterm['#658594'] = 66
let s:cterm['#8992a7'] = 103
let s:cterm['#8ba4b0'] = 109
let s:cterm['#949fb5'] = 110
let s:cterm['#8ea4a2'] = 109
let s:cterm['#87a987'] = 108
let s:cterm['#8a9a7b'] = 108
let s:cterm['#c4b28a'] = 144
let s:cterm['#b6927b'] = 137
let s:cterm['#b98d7b'] = 137
let s:cterm['#a292a3'] = 139
let s:cterm['#c4746e'] = 167
let s:cterm['#7FB4CA'] = 110
let s:cterm['#938AA9'] = 139
let s:cterm['#9CABCA'] = 146
let s:cterm['#E6C384'] = 186
let s:cterm['#E46876'] = 204
let s:cterm['#FF5D62'] = 203
let s:cterm['#FFA066'] = 215
let s:cterm['#7AA89F'] = 108
let s:cterm['#C0A36E'] = 179

" ============================================================================
" Helper function
" ============================================================================

function! s:hi(group, fg, bg, attr)
    let l:cmd = 'highlight ' . a:group
    if a:fg != ''
        let l:cmd .= ' guifg=' . a:fg
        if has_key(s:cterm, a:fg)
            let l:cmd .= ' ctermfg=' . s:cterm[a:fg]
        endif
    endif
    if a:bg != ''
        let l:cmd .= ' guibg=' . a:bg
        if has_key(s:cterm, a:bg)
            let l:cmd .= ' ctermbg=' . s:cterm[a:bg]
        endif
    endif
    if a:attr != ''
        let l:cmd .= ' gui=' . a:attr . ' cterm=' . a:attr
    else
        let l:cmd .= ' gui=NONE cterm=NONE'
    endif
    execute l:cmd
endfunction

" ============================================================================
" Editor highlights
" ============================================================================

call s:hi('Normal',       s:dragonWhite, s:dragonBlack3, '')
call s:hi('NormalNC',     s:dragonWhite, s:dragonBlack3, '')
call s:hi('NormalFloat',  s:oldWhite,    s:dragonBlack0, '')
call s:hi('FloatBorder',  s:dragonBlack6, s:dragonBlack0, '')
call s:hi('FloatTitle',   s:dragonGray3, s:dragonBlack0, 'bold')

call s:hi('Cursor',       s:dragonBlack3, s:dragonWhite, '')
call s:hi('CursorLine',   '',            s:dragonBlack4, '')
call s:hi('CursorColumn', '',            s:dragonBlack4, '')
call s:hi('ColorColumn',  '',            s:dragonBlack5, '')
call s:hi('CursorLineNr', s:dragonYellow, s:dragonBlack4, 'bold')

call s:hi('LineNr',       s:dragonBlack6, '',            '')
call s:hi('SignColumn',   s:dragonBlack6, s:dragonBlack3, '')
call s:hi('FoldColumn',   s:dragonBlack6, s:dragonBlack3, '')
call s:hi('Folded',       s:dragonGray3,  s:dragonBlack5, '')

call s:hi('Visual',       '',            s:waveBlue1,   '')
call s:hi('VisualNOS',    '',            s:waveBlue1,   '')

call s:hi('Pmenu',        s:dragonWhite, s:waveBlue1,   '')
call s:hi('PmenuSel',     '',            s:waveBlue2,   '')
call s:hi('PmenuSbar',    '',            s:waveBlue1,   '')
call s:hi('PmenuThumb',   '',            s:waveBlue2,   '')

call s:hi('StatusLine',   s:oldWhite,    s:dragonBlack0, '')
call s:hi('StatusLineNC', s:dragonGray3, s:dragonBlack0, '')
call s:hi('TabLine',      s:oldWhite,    s:dragonBlack0, '')
call s:hi('TabLineFill',  '',            s:dragonBlack0, '')
call s:hi('TabLineSel',   s:dragonWhite, s:dragonBlack4, 'bold')

call s:hi('WinSeparator', s:dragonBlack5, s:dragonBlack3, '')
call s:hi('VertSplit',    s:dragonBlack5, s:dragonBlack3, '')

call s:hi('Search',       s:dragonWhite, s:waveBlue2,   '')
call s:hi('IncSearch',    s:dragonBlack3, s:roninYellow, '')
call s:hi('CurSearch',    s:dragonBlack3, s:roninYellow, '')
call s:hi('Substitute',   s:dragonBlack3, s:autumnRed,  '')

call s:hi('MatchParen',   s:waveRed,     s:waveBlue2,   'bold')

call s:hi('NonText',      s:dragonBlack6, '',           '')
call s:hi('Whitespace',   s:dragonBlack6, '',           '')
call s:hi('SpecialKey',   s:dragonBlack6, '',           '')
call s:hi('EndOfBuffer',  s:dragonBlack3, '',           '')

call s:hi('Directory',    s:dragonBlue2, '',            '')
call s:hi('Title',        s:dragonBlue2, '',            'bold')
call s:hi('ErrorMsg',     s:samuraiRed,  '',            '')
call s:hi('WarningMsg',   s:roninYellow, '',            '')
call s:hi('MoreMsg',      s:dragonTeal,  '',            '')
call s:hi('ModeMsg',      s:dragonWhite, '',            'bold')
call s:hi('Question',     s:dragonTeal,  '',            '')

call s:hi('WildMenu',     s:dragonWhite, s:waveBlue1,   '')
call s:hi('Conceal',      s:dragonGray3, '',            '')
call s:hi('QuickFixLine', '',            s:waveBlue1,   '')

" ============================================================================
" Diff highlights
" ============================================================================

call s:hi('DiffAdd',    '',           s:winterGreen,  '')
call s:hi('DiffChange', '',           s:winterBlue,   '')
call s:hi('DiffDelete', s:autumnRed,  s:winterRed,    '')
call s:hi('DiffText',   '',           s:winterYellow, '')

call s:hi('diffAdded',   s:autumnGreen, '', '')
call s:hi('diffRemoved', s:autumnRed,   '', '')
call s:hi('diffChanged', s:autumnYellow, '', '')
call s:hi('diffFile',    s:dragonOrange2, '', '')
call s:hi('diffNewFile', s:dragonOrange2, '', '')
call s:hi('diffLine',    s:springViolet1, '', '')

" ============================================================================
" Syntax highlights
" ============================================================================

call s:hi('Comment',    s:dragonAsh,   '',  '')

call s:hi('Constant',   s:dragonOrange2, '', '')
call s:hi('String',     s:dragonGreen, '', '')
call s:hi('Character',  s:dragonGreen, '', '')
call s:hi('Number',     s:dragonPink,  '', '')
call s:hi('Float',      s:dragonPink,  '', '')
call s:hi('Boolean',    s:dragonOrange2, '', '')

call s:hi('Identifier', s:dragonYellow, '', '')
call s:hi('Function',   s:dragonBlue2, '', '')

call s:hi('Statement',  s:dragonViolet, '', 'bold')
call s:hi('Conditional', s:dragonViolet, '', '')
call s:hi('Repeat',     s:dragonViolet, '', '')
call s:hi('Label',      s:dragonViolet, '', '')
call s:hi('Operator',   s:boatYellow2, '', '')
call s:hi('Keyword',    s:dragonViolet, '', '')
call s:hi('Exception',  s:peachRed,    '', '')

call s:hi('PreProc',    s:dragonRed,   '', '')
call s:hi('Include',    s:dragonOrange2, '', '')
call s:hi('Define',     s:dragonViolet, '', '')
call s:hi('Macro',      s:dragonRed,   '', '')
call s:hi('PreCondit',  s:dragonViolet, '', '')

call s:hi('Type',       s:dragonAqua,  '', '')
call s:hi('StorageClass', s:dragonViolet, '', '')
call s:hi('Structure',  s:dragonAqua,  '', '')
call s:hi('Typedef',    s:dragonAqua,  '', '')

call s:hi('Special',    s:dragonTeal,  '', '')
call s:hi('SpecialChar', s:dragonTeal, '', '')
call s:hi('Tag',        s:dragonTeal,  '', '')
call s:hi('Delimiter',  s:springViolet2, '', '')
call s:hi('SpecialComment', s:dragonGray3, '', '')
call s:hi('Debug',      s:samuraiRed,  '', '')

call s:hi('Underlined', s:dragonTeal,  '', 'underline')
call s:hi('Ignore',     s:dragonGray3, '', '')
call s:hi('Error',      s:samuraiRed,  '', '')
call s:hi('Todo',       s:dragonTeal,  s:dragonBlack0, 'bold')

" ============================================================================
" Diagnostic highlights
" ============================================================================

call s:hi('DiagnosticError',          s:samuraiRed,   '', '')
call s:hi('DiagnosticWarn',           s:roninYellow,  '', '')
call s:hi('DiagnosticInfo',           s:waveAqua1,    '', '')
call s:hi('DiagnosticHint',           s:dragonBlue,   '', '')
call s:hi('DiagnosticOk',             s:autumnGreen,  '', '')

call s:hi('DiagnosticUnderlineError', s:samuraiRed,   '', 'undercurl')
call s:hi('DiagnosticUnderlineWarn',  s:roninYellow,  '', 'undercurl')
call s:hi('DiagnosticUnderlineInfo',  s:waveAqua1,    '', 'undercurl')
call s:hi('DiagnosticUnderlineHint',  s:dragonBlue,   '', 'undercurl')
call s:hi('DiagnosticUnderlineOk',    s:autumnGreen,  '', 'undercurl')

" ============================================================================
" Spelling highlights
" ============================================================================

call s:hi('SpellBad',   s:samuraiRed,  '', 'undercurl')
call s:hi('SpellCap',   s:roninYellow, '', 'undercurl')
call s:hi('SpellLocal', s:roninYellow, '', 'undercurl')
call s:hi('SpellRare',  s:dragonTeal,  '', 'undercurl')

" ============================================================================
" Git/VCS highlights
" ============================================================================

call s:hi('gitcommitSelectedFile', s:autumnGreen,  '', '')
call s:hi('gitcommitDiscardedFile', s:autumnRed,   '', '')
call s:hi('gitcommitHeader',       s:springViolet1, '', '')
call s:hi('gitcommitBranch',       s:dragonViolet, '', '')
call s:hi('gitcommitSummary',      s:dragonWhite,  '', '')

call s:hi('GitGutterAdd',          s:autumnGreen,  '', '')
call s:hi('GitGutterChange',       s:autumnYellow, '', '')
call s:hi('GitGutterDelete',       s:autumnRed,    '', '')
call s:hi('GitGutterChangeDelete', s:autumnRed,    '', '')

call s:hi('SignifySignAdd',        s:autumnGreen,  '', '')
call s:hi('SignifySignChange',     s:autumnYellow, '', '')
call s:hi('SignifySignDelete',     s:autumnRed,    '', '')

" ============================================================================
" ALE highlights
" ============================================================================

call s:hi('ALEError',         s:samuraiRed,  '', 'undercurl')
call s:hi('ALEWarning',       s:roninYellow, '', 'undercurl')
call s:hi('ALEInfo',          s:waveAqua1,   '', 'undercurl')
call s:hi('ALEErrorSign',     s:samuraiRed,  '', '')
call s:hi('ALEWarningSign',   s:roninYellow, '', '')
call s:hi('ALEInfoSign',      s:waveAqua1,   '', '')

" ============================================================================
" NERDTree highlights
" ============================================================================

call s:hi('NERDTreeDir',       s:dragonBlue2, '', '')
call s:hi('NERDTreeDirSlash',  s:dragonBlue2, '', '')
call s:hi('NERDTreeOpenable',  s:dragonOrange, '', '')
call s:hi('NERDTreeClosable',  s:dragonOrange, '', '')
call s:hi('NERDTreeFile',      s:dragonWhite, '', '')
call s:hi('NERDTreeExecFile',  s:dragonGreen, '', '')
call s:hi('NERDTreeUp',        s:dragonGray3, '', '')
call s:hi('NERDTreeCWD',       s:dragonViolet, '', '')
call s:hi('NERDTreeHelp',      s:dragonGray3, '', '')

" ============================================================================
" Markdown highlights
" ============================================================================

call s:hi('markdownH1',           s:peachRed,     '', 'bold')
call s:hi('markdownH2',           s:dragonBlue2,  '', 'bold')
call s:hi('markdownH3',           s:dragonGreen,  '', 'bold')
call s:hi('markdownH4',           s:dragonAqua,   '', 'bold')
call s:hi('markdownH5',           s:dragonViolet, '', 'bold')
call s:hi('markdownH6',           s:dragonYellow, '', 'bold')
call s:hi('markdownHeadingDelimiter', s:dragonGray3, '', 'bold')
call s:hi('markdownCode',         s:dragonGreen,  '', '')
call s:hi('markdownCodeBlock',    s:dragonGreen,  '', '')
call s:hi('markdownCodeDelimiter', s:dragonGreen, '', '')
call s:hi('markdownBlockquote',   s:dragonGray3,  '', '')
call s:hi('markdownListMarker',   s:dragonViolet, '', '')
call s:hi('markdownOrderedListMarker', s:dragonViolet, '', '')
call s:hi('markdownRule',         s:dragonGray3,  '', '')
call s:hi('markdownLinkText',     s:dragonTeal,   '', 'underline')
call s:hi('markdownUrl',          s:dragonOrange2, '', '')
call s:hi('markdownBold',         s:dragonWhite,  '', 'bold')
call s:hi('markdownItalic',       s:dragonWhite,  '', 'italic')

" ============================================================================
" HTML highlights
" ============================================================================

call s:hi('htmlTag',            s:springViolet2, '', '')
call s:hi('htmlEndTag',         s:springViolet2, '', '')
call s:hi('htmlTagName',        s:dragonViolet,  '', '')
call s:hi('htmlArg',            s:dragonAqua,    '', '')
call s:hi('htmlSpecialChar',    s:dragonOrange2, '', '')
call s:hi('htmlLink',           s:dragonTeal,    '', 'underline')
call s:hi('htmlBold',           s:dragonWhite,   '', 'bold')
call s:hi('htmlItalic',         s:dragonWhite,   '', 'italic')
call s:hi('htmlH1',             s:dragonBlue2,   '', 'bold')
call s:hi('htmlH2',             s:dragonBlue2,   '', 'bold')
call s:hi('htmlH3',             s:dragonBlue2,   '', 'bold')
call s:hi('htmlH4',             s:dragonBlue2,   '', 'bold')
call s:hi('htmlH5',             s:dragonBlue2,   '', 'bold')
call s:hi('htmlH6',             s:dragonBlue2,   '', 'bold')

" ============================================================================
" CSS highlights
" ============================================================================

call s:hi('cssAttrComma',         s:springViolet2, '', '')
call s:hi('cssAttributeSelector', s:dragonGreen,   '', '')
call s:hi('cssBraces',            s:springViolet2, '', '')
call s:hi('cssClassName',         s:dragonOrange2, '', '')
call s:hi('cssClassNameDot',      s:dragonOrange2, '', '')
call s:hi('cssDefinition',        s:dragonAqua,    '', '')
call s:hi('cssFontAttr',          s:dragonOrange2, '', '')
call s:hi('cssFontDescriptor',    s:dragonViolet,  '', '')
call s:hi('cssFunctionName',      s:dragonTeal,    '', '')
call s:hi('cssIdentifier',        s:dragonTeal,    '', '')
call s:hi('cssImportant',         s:dragonViolet,  '', '')
call s:hi('cssInclude',           s:dragonWhite,   '', '')
call s:hi('cssIncludeKeyword',    s:dragonViolet,  '', '')
call s:hi('cssMediaType',         s:dragonOrange2, '', '')
call s:hi('cssProp',              s:dragonAqua,    '', '')
call s:hi('cssPseudoClassId',     s:dragonOrange2, '', '')
call s:hi('cssSelectorOp',        s:boatYellow2,   '', '')
call s:hi('cssSelectorOp2',       s:boatYellow2,   '', '')
call s:hi('cssTagName',           s:dragonRed,     '', '')
call s:hi('cssColor',             s:dragonPink,    '', '')
call s:hi('cssUnitDecorators',    s:dragonPink,    '', '')

" ============================================================================
" JavaScript highlights
" ============================================================================

call s:hi('javaScriptBraces',     s:springViolet2, '', '')
call s:hi('javaScriptFunction',   s:dragonViolet,  '', '')
call s:hi('javaScriptIdentifier', s:dragonViolet,  '', '')
call s:hi('javaScriptNull',       s:dragonOrange2, '', '')
call s:hi('javaScriptNumber',     s:dragonPink,    '', '')
call s:hi('javaScriptRequire',    s:dragonTeal,    '', '')
call s:hi('javaScriptReserved',   s:dragonViolet,  '', '')

call s:hi('jsArrowFunction',      s:dragonViolet,  '', '')
call s:hi('jsClassKeyword',       s:dragonViolet,  '', '')
call s:hi('jsClassMethodType',    s:dragonViolet,  '', '')
call s:hi('jsDocParam',           s:dragonAqua,    '', '')
call s:hi('jsDocTags',            s:dragonViolet,  '', '')
call s:hi('jsExport',             s:dragonViolet,  '', '')
call s:hi('jsExportDefault',      s:dragonViolet,  '', '')
call s:hi('jsExtendsKeyword',     s:dragonViolet,  '', '')
call s:hi('jsFrom',               s:dragonViolet,  '', '')
call s:hi('jsFuncArgs',           s:dragonYellow,  '', '')
call s:hi('jsFuncCall',           s:dragonBlue2,   '', '')
call s:hi('jsFunction',           s:dragonViolet,  '', '')
call s:hi('jsGenerator',          s:dragonYellow,  '', '')
call s:hi('jsGlobalObjects',      s:dragonAqua,    '', '')
call s:hi('jsImport',             s:dragonViolet,  '', '')
call s:hi('jsModuleAs',           s:dragonViolet,  '', '')
call s:hi('jsModuleWords',        s:dragonViolet,  '', '')
call s:hi('jsModules',            s:dragonViolet,  '', '')
call s:hi('jsNull',               s:dragonOrange2, '', '')
call s:hi('jsOperator',           s:boatYellow2,   '', '')
call s:hi('jsStorageClass',       s:dragonViolet,  '', '')
call s:hi('jsSuper',              s:dragonRed,     '', '')
call s:hi('jsTemplateBraces',     s:peachRed,      '', '')
call s:hi('jsTemplateVar',        s:dragonGreen,   '', '')
call s:hi('jsThis',               s:dragonRed,     '', '')
call s:hi('jsUndefined',          s:dragonOrange2, '', '')

" ============================================================================
" TypeScript highlights
" ============================================================================

call s:hi('typescriptBraces',            s:springViolet2, '', '')
call s:hi('typescriptEndColons',         s:springViolet2, '', '')
call s:hi('typescriptExport',            s:dragonViolet,  '', '')
call s:hi('typescriptImport',            s:dragonViolet,  '', '')
call s:hi('typescriptVariable',          s:dragonViolet,  '', '')
call s:hi('typescriptCastKeyword',       s:dragonViolet,  '', '')
call s:hi('typescriptOperator',          s:boatYellow2,   '', '')
call s:hi('typescriptPredefinedType',    s:dragonAqua,    '', '')
call s:hi('typescriptMember',            s:dragonYellow,  '', '')

" ============================================================================
" Python highlights
" ============================================================================

call s:hi('pythonBuiltin',        s:dragonRed,     '', '')
call s:hi('pythonBuiltinFunc',    s:dragonTeal,    '', '')
call s:hi('pythonBuiltinObj',     s:dragonRed,     '', '')
call s:hi('pythonBuiltinType',    s:dragonAqua,    '', '')
call s:hi('pythonClass',          s:dragonAqua,    '', '')
call s:hi('pythonClassVar',       s:dragonRed,     '', '')
call s:hi('pythonDecorator',      s:boatYellow2,   '', '')
call s:hi('pythonDottedName',     s:boatYellow2,   '', '')
call s:hi('pythonException',      s:peachRed,      '', '')
call s:hi('pythonExceptions',     s:peachRed,      '', '')
call s:hi('pythonFunction',       s:dragonBlue2,   '', '')
call s:hi('pythonImport',         s:dragonViolet,  '', '')
call s:hi('pythonInclude',        s:dragonViolet,  '', '')
call s:hi('pythonNone',           s:dragonOrange2, '', '')
call s:hi('pythonOperator',       s:boatYellow2,   '', '')
call s:hi('pythonRawString',      s:dragonGreen,   '', '')
call s:hi('pythonRun',            s:dragonGray3,   '', '')
call s:hi('pythonStatement',      s:dragonViolet,  '', '')
call s:hi('pythonString',         s:dragonGreen,   '', '')
call s:hi('pythonTripleQuotes',   s:dragonGreen,   '', '')

" ============================================================================
" Go highlights
" ============================================================================

call s:hi('goBuiltins',       s:dragonTeal,    '', '')
call s:hi('goConst',          s:dragonOrange2, '', '')
call s:hi('goDeclaration',    s:dragonViolet,  '', '')
call s:hi('goDeclType',       s:dragonAqua,    '', '')
call s:hi('goField',          s:dragonYellow,  '', '')
call s:hi('goFloat',          s:dragonPink,    '', '')
call s:hi('goFunction',       s:dragonBlue2,   '', '')
call s:hi('goFunctionCall',   s:dragonBlue2,   '', '')
call s:hi('goImport',         s:dragonViolet,  '', '')
call s:hi('goMethod',         s:dragonBlue2,   '', '')
call s:hi('goMethodCall',     s:dragonBlue2,   '', '')
call s:hi('goPackage',        s:dragonViolet,  '', '')
call s:hi('goReceiverType',   s:dragonAqua,    '', '')
call s:hi('goSignedInts',     s:dragonAqua,    '', '')
call s:hi('goStruct',         s:dragonAqua,    '', '')
call s:hi('goStructDef',      s:dragonAqua,    '', '')
call s:hi('goType',           s:dragonAqua,    '', '')
call s:hi('goTypeName',       s:dragonAqua,    '', '')
call s:hi('goUnsignedInts',   s:dragonAqua,    '', '')
call s:hi('goVar',            s:dragonViolet,  '', '')
call s:hi('goVarAssign',      s:dragonYellow,  '', '')
call s:hi('goVarDefs',        s:dragonYellow,  '', '')

" ============================================================================
" Rust highlights
" ============================================================================

call s:hi('rustAttribute',    s:boatYellow2,   '', '')
call s:hi('rustCommentLineDoc', s:dragonAsh,   '', '')
call s:hi('rustDerive',       s:boatYellow2,   '', '')
call s:hi('rustEnumVariant',  s:dragonOrange2, '', '')
call s:hi('rustEscape',       s:peachRed,      '', '')
call s:hi('rustFuncCall',     s:dragonBlue2,   '', '')
call s:hi('rustFuncName',     s:dragonBlue2,   '', '')
call s:hi('rustIdentifier',   s:dragonYellow,  '', '')
call s:hi('rustLifetime',     s:dragonViolet,  '', '')
call s:hi('rustMacro',        s:dragonTeal,    '', '')
call s:hi('rustModPath',      s:dragonYellow,  '', '')
call s:hi('rustModPathSep',   s:springViolet2, '', '')
call s:hi('rustOperator',     s:boatYellow2,   '', '')
call s:hi('rustQuestionMark', s:boatYellow2,   '', '')
call s:hi('rustSelf',         s:dragonRed,     '', '')
call s:hi('rustSigil',        s:boatYellow2,   '', '')
call s:hi('rustStorage',      s:dragonViolet,  '', '')
call s:hi('rustString',       s:dragonGreen,   '', '')
call s:hi('rustStructure',    s:dragonViolet,  '', '')
call s:hi('rustTrait',        s:dragonAqua,    '', '')
call s:hi('rustType',         s:dragonAqua,    '', '')

" ============================================================================
" Shell/Bash highlights
" ============================================================================

call s:hi('shCmdSubRegion',   s:springViolet2, '', '')
call s:hi('shDeref',          s:dragonYellow,  '', '')
call s:hi('shDerefSimple',    s:dragonYellow,  '', '')
call s:hi('shDerefVar',       s:dragonYellow,  '', '')
call s:hi('shFunction',       s:dragonBlue2,   '', '')
call s:hi('shFunctionKey',    s:dragonViolet,  '', '')
call s:hi('shLoop',           s:dragonViolet,  '', '')
call s:hi('shQuote',          s:dragonGreen,   '', '')
call s:hi('shSet',            s:dragonViolet,  '', '')
call s:hi('shSetList',        s:dragonYellow,  '', '')
call s:hi('shSnglCase',       s:dragonViolet,  '', '')
call s:hi('shStatement',      s:dragonViolet,  '', '')
call s:hi('shVariable',       s:dragonYellow,  '', '')

" ============================================================================
" Vim script highlights
" ============================================================================

call s:hi('vimAutoEvent',     s:dragonAqua,    '', '')
call s:hi('vimBracket',       s:springViolet2, '', '')
call s:hi('vimCommand',       s:dragonViolet,  '', '')
call s:hi('vimCommentTitle',  s:dragonAsh,     '', 'bold')
call s:hi('vimContinue',      s:springViolet2, '', '')
call s:hi('vimEnvvar',        s:dragonRed,     '', '')
call s:hi('vimFBVar',         s:dragonYellow,  '', '')
call s:hi('vimFuncName',      s:dragonBlue2,   '', '')
call s:hi('vimFuncSID',       s:dragonBlue2,   '', '')
call s:hi('vimFunction',      s:dragonBlue2,   '', '')
call s:hi('vimGroup',         s:dragonAqua,    '', '')
call s:hi('vimGroupName',     s:dragonAqua,    '', '')
call s:hi('vimHiAttrib',      s:dragonOrange2, '', '')
call s:hi('vimHiClear',       s:dragonViolet,  '', '')
call s:hi('vimHiGroup',       s:dragonAqua,    '', '')
call s:hi('vimHiKeyList',     s:dragonAqua,    '', '')
call s:hi('vimIsCommand',     s:dragonViolet,  '', '')
call s:hi('vimLet',           s:dragonViolet,  '', '')
call s:hi('vimMapMod',        s:dragonViolet,  '', '')
call s:hi('vimMapModKey',     s:dragonTeal,    '', '')
call s:hi('vimNotation',      s:dragonTeal,    '', '')
call s:hi('vimOperParen',     s:dragonYellow,  '', '')
call s:hi('vimOption',        s:dragonAqua,    '', '')
call s:hi('vimParenSep',      s:springViolet2, '', '')
call s:hi('vimSep',           s:springViolet2, '', '')
call s:hi('vimSetMod',        s:dragonGray3,   '', '')
call s:hi('vimSetSep',        s:springViolet2, '', '')
call s:hi('vimUserFunc',      s:dragonBlue2,   '', '')
call s:hi('vimVar',           s:dragonYellow,  '', '')

" ============================================================================
" JSON highlights
" ============================================================================

call s:hi('jsonKeyword',      s:dragonBlue2,   '', '')
call s:hi('jsonQuote',        s:springViolet2, '', '')
call s:hi('jsonString',       s:dragonGreen,   '', '')
call s:hi('jsonNumber',       s:dragonPink,    '', '')
call s:hi('jsonBoolean',      s:dragonOrange2, '', '')
call s:hi('jsonNull',         s:dragonOrange2, '', '')
call s:hi('jsonBraces',       s:springViolet2, '', '')

" ============================================================================
" YAML highlights
" ============================================================================

call s:hi('yamlAnchor',       s:dragonRed,     '', '')
call s:hi('yamlAlias',        s:dragonRed,     '', '')
call s:hi('yamlBlockMappingKey', s:dragonBlue2, '', '')
call s:hi('yamlFlowIndicator', s:springViolet2, '', '')
call s:hi('yamlFlowMappingKey', s:dragonBlue2, '', '')
call s:hi('yamlKeyValueDelimiter', s:springViolet2, '', '')
call s:hi('yamlNodeTag',      s:dragonViolet,  '', '')

" ============================================================================
" Ruby highlights
" ============================================================================

call s:hi('rubyAccess',              s:dragonViolet, '', '')
call s:hi('rubyBlockParameter',      s:dragonYellow, '', '')
call s:hi('rubyBlockParameterList',  s:dragonYellow, '', '')
call s:hi('rubyClass',               s:dragonViolet, '', '')
call s:hi('rubyConstant',            s:dragonAqua,   '', '')
call s:hi('rubyControl',             s:dragonViolet, '', '')
call s:hi('rubyDefine',              s:dragonViolet, '', '')
call s:hi('rubyEscape',              s:peachRed,     '', '')
call s:hi('rubyFunction',            s:dragonBlue2,  '', '')
call s:hi('rubyGlobalVariable',      s:dragonRed,    '', '')
call s:hi('rubyInclude',             s:dragonViolet, '', '')
call s:hi('rubyInterpolationDelimiter', s:peachRed,  '', '')
call s:hi('rubyMethodBlock',         s:dragonBlue2,  '', '')
call s:hi('rubyPseudoVariable',      s:dragonRed,    '', '')
call s:hi('rubyRegexp',              s:boatYellow2,  '', '')
call s:hi('rubyRegexpDelimiter',     s:boatYellow2,  '', '')
call s:hi('rubyStringDelimiter',     s:dragonGreen,  '', '')
call s:hi('rubySymbol',              s:dragonTeal,   '', '')

" ============================================================================
" Terminal colors
" ============================================================================

if has('nvim')
    let g:terminal_color_0  = s:dragonBlack0
    let g:terminal_color_1  = s:dragonRed
    let g:terminal_color_2  = s:dragonGreen2
    let g:terminal_color_3  = s:dragonYellow
    let g:terminal_color_4  = s:dragonBlue2
    let g:terminal_color_5  = s:dragonPink
    let g:terminal_color_6  = s:dragonAqua
    let g:terminal_color_7  = s:oldWhite
    let g:terminal_color_8  = s:dragonGray
    let g:terminal_color_9  = s:waveRed
    let g:terminal_color_10 = s:dragonGreen
    let g:terminal_color_11 = s:carpYellow
    let g:terminal_color_12 = s:springBlue
    let g:terminal_color_13 = s:springViolet1
    let g:terminal_color_14 = s:waveAqua2
    let g:terminal_color_15 = s:dragonWhite
else
    let g:terminal_ansi_colors = [
        \ s:dragonBlack0,
        \ s:dragonRed,
        \ s:dragonGreen2,
        \ s:dragonYellow,
        \ s:dragonBlue2,
        \ s:dragonPink,
        \ s:dragonAqua,
        \ s:oldWhite,
        \ s:dragonGray,
        \ s:waveRed,
        \ s:dragonGreen,
        \ s:carpYellow,
        \ s:springBlue,
        \ s:springViolet1,
        \ s:waveAqua2,
        \ s:dragonWhite
        \ ]
endif

" vim: set sw=4 ts=4 sts=4 et tw=80 ft=vim fdm=marker:
