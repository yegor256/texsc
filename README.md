<img src="/logo.svg" width="64px"/>

[![EO principles respected here](https://www.elegantobjects.org/badge.svg)](https://www.elegantobjects.org)
[![Managed by Zerocracy](https://www.0crat.com/badge/C3RFVLU72.svg)](https://www.0crat.com/p/C3RFVLU72)
[![DevOps By Rultor.com](http://www.rultor.com/b/yegor256/texsc)](http://www.rultor.com/p/yegor256/texsc)
[![We recommend RubyMine](https://www.elegantobjects.org/rubymine.svg)](https://www.jetbrains.com/ruby/)

[![Build Status](https://travis-ci.org/yegor256/texsc.svg)](https://travis-ci.org/yegor256/texsc)
[![PDD status](http://www.0pdd.com/svg?name=yegor256/texsc)](http://www.0pdd.com/p?name=yegor256/texsc)
[![Gem Version](https://badge.fury.io/rb/texsc.svg)](http://badge.fury.io/rb/texsc)
[![Maintainability](https://api.codeclimate.com/v1/badges/7593273bfae71f87ea8c/maintainability)](https://codeclimate.com/github/yegor256/texsc/maintainability)

[![License](https://img.shields.io/badge/license-MIT-green.svg)](https://github.com/yegor256/takes/texsc/master/LICENSE.txt)
[![Test Coverage](https://img.shields.io/codecov/c/github/yegor256/texsc.svg)](https://codecov.io/github/yegor256/texsc?branch=master)
[![Hits-of-Code](https://hitsofcode.com/github/yegor256/texsc)](https://hitsofcode.com/view/github/yegor256/texsc)

This tool simplies the usage of [GNU aspell](http://aspell.net/)
(you must have it installed)
for spell-checking of LaTeX files.

First, you install it:

```bash
$ gem install texsc
```

Then, you just run it like this for your LaTeX files:

```bash
$ texsc article.tex
```

You may ignore certain tags or environments using `--ignore` option

```bash
$ texsc --ignore=citet,citep --ignore=newminted article.tex
```

You can specify the method of ignoring,
as [aspell suggests](http://aspell.net/man-html/The-Options.html#TeX_002fLaTeX-Filter)
(by default it's 'p'):

```bash
$ texsc --ignore=newminted:opp article.tex
```

You may also use your own additional dictionary, via `--pws` option.
The file must contain one word per line:
they will be ignored during spell checking. Don't forget that
the first line of the file
[must contain](http://aspell.net/man-html/Format-of-the-Personal-and-Replacement-Dictionaries.html)
this:

```
personal_ws-1.1 en 1 utf-8
```

## How to contribute

Read [these guidelines](https://www.yegor256.com/2014/04/15/github-guidelines.html).
Make sure your build is green before you contribute
your pull request. You will need to have [Ruby](https://www.ruby-lang.org/en/) 2.3+ and
[Bundler](https://bundler.io/) installed. Then:

```
$ bundle update
$ bundle exec rake
```

If it's clean and you don't see any error messages, submit your pull request.
