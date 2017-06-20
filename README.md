# homebrew-tendermint
Homebrew Tap for Tendermint, Ethermint, Basecoin and all related projects.

## Installation

```
brew tap tendermint/tendermint
```

### Tendermint client
```
brew install tendermint
```

## Running

### Tendermint client
`tendermint`


## Development
Get the latest development version with the `--devel` flag.

### Go client
```
brew reinstall ethereum --devel
```

### Current branches

Tendermint:
* `--devel` is on master branch


## Upgrading

```
brew update && brew upgrade
```


##Patching

First `cd /Library/Caches/Homebrew/ethereum--git/` and make your changes. Then `git diff > shiny.patch`, copy/paste the content of your patch under `__END__` of `ethereum.rb` and replace the `def patches` block with:

```
def patches
  DATA
end
```

If you want to submit your change, save your patch in a gist, add your `option 'shiny-option', 'Shiny description'` and the URL to your gist in the patches block and submit a pull request. Make sure to send a pull request to Ethereum also!
