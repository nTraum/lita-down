# lita-down
[![Build Status](https://travis-ci.org/nTraum/lita-down.svg?branch=master)](https://travis-ci.org/nTraum/lita-down)
[![Coverage Status](https://coveralls.io/repos/nTraum/lita-down/badge.svg?branch=master&service=github)](https://coveralls.io/github/nTraum/lita-down?branch=master)

Lita plugin that reports if a website is down or not, similar to [isup.me](isup.me).

## Installation
Add lita-down to your Lita instance's Gemfile:

```ruby
gem "lita-down"
```

## Usage
Simply ask if a host is down:

```
> Is github.com down?
Lita: It's just you. github.com is up.
```

```
> Is roflrofllmaowutomg.com down?
Lita: It's not just you! roflrofllmaowutomg.com looks down from here.
```
