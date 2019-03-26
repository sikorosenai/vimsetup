REM Haskell:
REM https://blog.jez.io/haskell-development-with-neovim/

setx __COMPAT_LAYER=
stack install hindent
stack install stylish-haskell
stack install hlint
stack build ghc-mod
