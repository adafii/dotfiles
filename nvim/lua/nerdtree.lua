vim.g.NERDTreeGitStatusUseNerdFonts = 1
vim.g.NERDTreeGitStatusConcealBrackets = 0 -- DO NOT enable this feature if you have also installed vim-devicons
vim.g.NERDTreeGitStatusShowIgnored = 1

vim.g.NERDTreeGitStatusIndicatorMapCustom = {
    Modified  = 'M',
    Staged    = 'A',
    Untracked = '?',
    Renamed   = 'R',
    Unmerged  = 'U',
    Deleted   = 'D',
    Dirty     = '!',
    Ignored   = 'I',
    Clean     = 'C',
    Unknown   = '~',
}
