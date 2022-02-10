" Normal colors
let s:black = [ '#f2777a', 0 ]
let s:red = [ '#ff0000', 1 ]
let s:green = [ '#f2777a', 2 ]
let s:yellow = [ '#f2777a', 3 ]
let s:blue = [ '#f2777a', 4 ]
let s:magenta = [ '#f2777a', 5 ]
let s:cyan = [ '#f2777a', 6 ]
let s:white = [ '#fff', 7 ]

" Bold / Brighter colors
let s:black2 = [ '#f2777a', 8 ]
let s:red2 = [ '#ff0000', 9 ]
let s:green2 = [ '#f2777a', 10 ]
let s:yellow2 = [ '#f2777a', 11  ]
let s:blue2 = [ '#f2777a', 12 ]
let s:magenta2 = [ '#f2777a', 13 ]
let s:cyan2 = [ '#f2777a', 14 ]
let s:white2 = [ '#fff', 15 ]

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left = [ [ s:white, s:black ], [ s:cyan, s:black ] ]
let s:p.normal.right = [ [ s:white, s:black ], [ s:cyan, s:black ] ]
let s:p.insert.left = [ [ s:red2, s:black ], [ s:red, s:black ] ]
let s:p.insert.right = [ [ s:red2, s:black ], [ s:red, s:black ] ]
let s:p.visual.left = [ [ s:white, s:black ], [ s:magenta, s:black ] ]
let s:p.visual.right = [ [ s:white, s:black ], [ s:magenta, s:black ] ]
let s:p.replace.left = [ [ s:white, s:black ], [ s:yellow, s:black ] ]
let s:p.replace.right = [ [ s:white, s:black ], [ s:yellow, s:black ] ]
let s:p.inactive.left = [ [ s:white, s:black ], [ s:black2, s:black ] ]
let s:p.inactive.right = [ [ s:white, s:black ], [ s:black2, s:black ] ]
let s:p.normal.middle = [ [ s:white, s:black ] ]
let s:p.normal.error = [ [ s:white, s:red ] ]
let s:p.normal.warning = [ [ s:white, s:yellow ] ]
let s:p.inactive.middle = [ [ s:white, s:black ] ]

let s:p.tabline.left = [ [ s:white, s:black ] ]
let s:p.tabline.tabsel = [ [ s:white, s:black ] ]
let s:p.tabline.middle = [ [ s:white, s:black ] ]
let s:p.tabline.right = [ [ s:white, s:black ] ]

let g:lightline#colorscheme#lena#palette = lightline#colorscheme#flatten(s:p)
