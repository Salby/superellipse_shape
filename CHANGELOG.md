# Changelog

## 0.1.6 - 2021-02-01

### Added
- Added a new "golden" test.

### Changed
- Changed some documentation.

## 0.1.5 - 2019-01-08

### Fixed
- Fixed case where if you had a radius that was bigger than the shortest side of the rectangle, you would get a strange tie-fighter shape. This was solved by clamping all radii that were larger than the shortest side of the rectangle to the length of that side.

## 0.1.4 - 2019-01-08

### Added
- Added details to example and readme code examples.
- Added small example to `superellipse_shape.dart` class documentation.

### Changed
- Changed the way the border-radius of the shape is controlled. The class now uses `BorderRadiusGeometry` which also allows for control over individual corners.
- Changed all examples and tests to be up-to-date with the new usage with `borderRadius`.

### Fixed
- Fixed testing on old `n` property.

## 0.1.3 - 2019-01-07

### Changed
- Changed the way the superellipse is calculated in in order to look more even on shapes that aren't completely square.
- Edited the examples to reflect changes in how the shape is calculated.
- Changed the name of the property `n` to the more meaningful `superRadius`.

## 0.1.0 - 2019-01-03

### Added
- Proper example of how this package can be used.

### Changed
- Package description.
