circuitikz
==========

This package provides a set of macros for naturally typesetting electrical and (somewhat less naturally, perhaps) electronical networks.

It was born mainly for writing my own exercise book and exams sheets for the Elettrotecnica courses at Politecnico di Milano, Italy. I wanted a tool that was easy to use, with a lean syntax, native to LaTeX, and supporting directly PDF output format.

So I based everything with the very impressive (if somewhat verbose at times) TikZ package.

--------------

## Requirements
* Tikz/PGF graphics library, version 3
* xstrings not older than 2009/03/13

## Installation
The stable version is available on ctan and is included within the major latex distributions(Texlive, Miktex). If you want to test the latest version, have a look at http://circuitikz.github.io/circuitikz/. There you can find the latest git-version as a single file, just copy it to your project or to your local tex tree. 

## Usage
### Stable version
Just place
```latex
  \usepackage[siunitx, RPvoltages]{circuitikz}
```
or other opions, for ConTeXt, 
```latex
  \usemodule[circuitikz]
```
in the preamble and compile away, both with PS and PDF target output.

### Development version

If you want to use the git version, just append a git to the package name:
```latex
  \usepackage[siunitx, RPvoltages]{circuitikzgit}
```
or, for ConTeXt,
```latex
  \usemodule[circuitikzgit]
```

### Older versions (v0.9.1 onwards)

If you want to use older versions of `circuitikz` in LaTeX, just append the version number to the package name, as in `circuitikz-$version`:
```latex
  \usepackage{circuitikz-0.8.3}
```
The available versions are  0.8.3, 0.7, 0.6 and 0.4.

In ConTeXt, only the 0.8.3 version is available for the time being; you can use it with 
```latex
  \usemodule[circuitikz-0.8.3]
```

Be aware that options can (and do) change between versions, so you have to check them manually.

## More Information
More Information can be found in the manual and (maybe) at the wiki of the project located at https://github.com/circuitikz/circuitikz/wiki.

## Contact the authors
* git: https://github.com/circuitikz/circuitikz
* Massimo Redaelli (m.redaelli@gmail.com)
* Stefan Lindner (stefan.lindner@fau.de)
* Stefan Erhardt (stefan.erhardt@fau.de)
* Romano Giannetti (romano.giannetti@gmail.com)

-------------
Copyright 2007-18 by Massimo Redaelli

This file may be distributed and/or modified

1. under the LaTeX Project Public License and/or
2. under the GNU Public License.
