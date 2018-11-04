# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).


<!-- ## [Unreleased] -->


## [0.2.0] - 2018-11-04

### Added
- `--[no-]image` argument (overrides the default behavior of detecting iTerm2).
- `--version` argument.

### Changed
- iTerm2 images now appear in tmux.

### Fixed
- Strip the final newline from stdin.


## [0.1.0] - 2018-11-03

### Added
- Initial release. Generate a QR code and print it in the terminal.
- Detect iTerm2 and display the QR code as an inline image.


[Unreleased]: https://github.com/ljcooke/putqr/compare/v0.2.0...HEAD
[0.2.0]: https://github.com/ljcooke/putqr/compare/v0.1.0...v0.2.0
[0.1.0]: https://github.com/ljcooke/putqr/compare/59b73e62192b...v0.1.0
