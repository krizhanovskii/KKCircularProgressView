# KKCircularProgressView

[![Version](https://img.shields.io/cocoapods/v/KKCircularProgressView.svg?style=flat)](http://cocoapods.org/pods/KKCircularProgressView)
[![License](https://img.shields.io/cocoapods/l/KKCircularProgressView.svg?style=flat)](http://cocoapods.org/pods/KKCircularProgressView)
[![Platform](https://img.shields.io/cocoapods/p/KKCircularProgressView.svg?style=flat)](http://cocoapods.org/pods/KKCircularProgressView)

## Description
KKCircularProgressView in upgraded version of [KDCircularProgress](https://github.com/kaandedeoglu/KDCircularProgress) with UILabel that show current progress.

![Example](http://g.recordit.co/TBo1hLtV4y.gif )


## Usage
Create circle view like UIView and add to tour view:
```
let circleView = KKCircularProgressView(frame:someFrame)
self.view.addSubview(circleView)
```

List of properties:
```
public var startPercent: Int
public var labelColor: UIColor
public var trackThinkest: CGFloat
public var trackColor: UIColor
public var progressThickness: CGFloat
public var progressColors: [UIColor]
public var clockwise: Bool
public var roundedCorners: Bool
public var gradientRotateSpeed: CGFloat
public var glowAmount: CGFloat
public var glowMode: KDCircularProgress.KDCircularProgressGlowMode
public var progressInsideFillColor: UIColor
```

for starting animate use:
```
circleView.startAnimatingWithDuration(5, toPercent: 75)
```
Also u can animate from `value1` to `value2`. For this use:
```
circleView.startAnimatingWithDuration(2, fromPercent: 0, toPercent: 100)
```
Its work for reverse animating. Like :
```
circleView.startAnimatingWithDuration(2, fromPercent: 100, toPercent: 0)
```



## Requirements
* ios: 8.3. 
* xcode: 6


## Installation

KKCircularProgressView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "KKCircularProgressView"
```




## License
KKCircularProgressView is available under the MIT license. 



Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
