# Xvert

[![Gem](https://img.shields.io/gem/v/xvert?logo=ruby&logoColor=%23CC342D)](https://rubygems.org/gems/xvert)
[![Code Climate maintainability](https://img.shields.io/codeclimate/maintainability/koki-develop/xvert?logo=codeclimate)](https://codeclimate.com/github/koki-develop/xvert)
[![Codecov](https://img.shields.io/codecov/c/github/koki-develop/xvert?logo=codecov)](https://app.codecov.io/gh/koki-develop/xvert)
[![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/koki-develop/xvert/main.yml?logo=github)](https://github.com/koki-develop/xvert/actions/workflows/main.yml)
[![GitHub](https://img.shields.io/github/license/koki-develop/xvert)](./LICENSE.txt)

Convert between JSON, YAML, TOML, and various other formats.

## Installation

```console
$ gem install xvert
```

## Usage

```console
$ xvert help
Commands:
  xvert --version, -v   # Print Xvert version
  xvert help [COMMAND]  # Describe available commands or one specific command
  xvert jt              # Convert JSON to TOML
  xvert jy              # Convert JSON to YAML
  xvert tj              # Convert TOML to JSON
  xvert ty              # Convert TOML to YAML
  xvert yj              # Convert YAML to JSON
  xvert yt              # Convert YAML to TOML
```

- [JSON to TOML](#json-to-toml)
- [JSON to YAML](#json-to-yaml)
- [TOML to JSON](#toml-to-json)
- [TOML to YAML](#toml-to-yaml)
- [YAML to JSON](#yaml-to-json)
- [YAML to TOML](#yaml-to-toml)

### JSON to TOML

```console
$ xvert jt < foo.json
```

![](./assets/jt.gif)

### JSON to YAML

```console
$ xvert jy < foo.json
```

![](./assets/jy.gif)

### TOML to JSON

```console
$ xvert tj < foo.toml
```

![](./assets/tj.gif)

### TOML to YAML

```console
$ xvert ty < foo.toml
```

![](./assets/ty.gif)

### YAML to JSON

```console
$ xvert yj < foo.yaml
```

![](./assets/yj.gif)

### YAML to TOML

```console
$ xvert yt < foo.yaml
```

![](./assets/yt.gif)

## License

[MIT License](./LICENSE.txt)

## Code of Conduct

[CODE_OF_CONDUCT.md](./CODE_OF_CONDUCT.md)
