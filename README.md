# Homebrew Tendermint

A centralized repository for Tendermint-related brews.

## Requirements

* [Homebrew](https://github.com/Homebrew/brew)
* El Capitan, Sierra and High Sierra. Untested everywhere else.

## Installation

Run the following in your command-line:

```sh
$ brew tap tendermint/homebrew-tendermint
```

## Usage

Once the tap is installed, you can install `tendermint`, `ethermint`, or any formulae you might need via:

```sh
$ brew install tendermint
```

```sh
$ brew install ethermint
```

**Note:** For a list of available configuration options run:

```sh
$ brew options <formulae>
```

For example, you can get the development build by providing `--devel` flag:

```sh
$ brew install tendermint --devel
```

That's it!

Please also follow the instructions from `brew info` at the end of the install to ensure you properly installed your formulae version.

## Running

Please see the documentation for the respective clients for more information on running them.

* [Tendermint](https://github.com/tendermint/tendermint)
* [Ethermint](https://github.com/tendermint/ethermint)

## License

See [LICENSE](LICENSE).
