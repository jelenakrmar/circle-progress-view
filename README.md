# BOCircleProgressView

[![Version](https://img.shields.io/cocoapods/v/BOCircleProgressView.svg?style=flat)](https://cocoapods.org/pods/BOCircleProgressView)
[![License](https://img.shields.io/cocoapods/l/BOCircleProgressView.svg?style=flat)](https://cocoapods.org/pods/BOCircleProgressView)
[![Platform](https://img.shields.io/cocoapods/p/BOCircleProgressView.svg?style=flat)](https://cocoapods.org/pods/BOCircleProgressView)

## Installation

BOCircleProgressView is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```
pod 'BOCircleProgressView'
```

## Usage

Create a view in Storyboard and assign it `BOCircleProgressView` class, or initialize `BOCircleProgressView` view from code (with given frame).

To update percentage use `updateProgress(progress: CGFloat)` function, with parameter values between 0 and 1.

You can change:
- `barColor` (color of the background circle layer)
- `progressColor` (color of the progress layer) 
- `progressLabelColor` (color of the label displaying the percentage)
- `progressLabelFont` (font of the label displaying the percentage) 
- `invalidPercentageText` (text that appears if the percentage value is negative; defaults to N/A) 
- `width` (ring width)

## License

BOCircleProgressView is available under the MIT license. See the LICENSE file for more info.
