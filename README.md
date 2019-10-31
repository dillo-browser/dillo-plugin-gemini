# dillo-gemini

[Gemini][] protocol plugin for [Dillo][].

## Screenshot

![Dillo loading gemini://gemini.conman.org/](&Mi6TnZIOeSmIVeI0VbtY3tqvIEcoCrUas2EwwS09sl0=.sha256)

## Install

```sh
git clone ssb://%V0D7DtSnZyyAp1NbgOJF2ZAFMeUy9eXwyClCEKYUYAI=.sha256 dillo-gemini
cd dillo-gemini
mkdir -p ~/.dillo/dpi/gemini
ln -rs gemini.dpi ~/.dillo/dpi/gemini
test -f ~/.dillo/dpidrc || cp /etc/dillo/dpidrc ~/.dillo/dpidrc
echo 'proto.gemini=gemini/gemini.dpi' >> ~/.dillo/dpidrc
dpidc stop
```

## Sites to try

- <gemini://gemini.circumlunar.space/>
- <gemini://gemini.conman.org/>

[Gemini]: https://gopher.tildeverse.org/zaibatsu.circumlunar.space/1/~solderpunk/gemini
[Dillo]: https://dillo.org/

## License

FSFAP
