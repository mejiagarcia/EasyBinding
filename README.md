# SimpleBinding

[![CI Status](https://img.shields.io/travis/mejiagarcia/SimpleBinding.svg?style=flat)](https://travis-ci.org/mejiagarcia/SimpleBinding)
[![Version](https://img.shields.io/cocoapods/v/SimpleBinding.svg?style=flat)](https://cocoapods.org/pods/SimpleBinding)
[![License](https://img.shields.io/cocoapods/l/SimpleBinding.svg?style=flat)](https://cocoapods.org/pods/SimpleBinding)
[![Platform](https://img.shields.io/cocoapods/p/SimpleBinding.svg?style=flat)](https://cocoapods.org/pods/SimpleBinding)

Simplest way to bind your ViewModels to your views :), for real, really simple.

- [Example](#example)
- [Installation](#installation)
- [Usage](#usage)
- [Add supported views](#add-supported-views)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

SimpleBinding is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SimpleBinding'
```

## Usage

`Var` is the heart of the observable classes, you can use `Var` to listen the your variable changes, for example:


```swift
let isLoading: Var<Bool>
let title: Var<String>
```

`Var` receive a generic type to create the variable you need, you can find your variable in the `value` property.

```swift
let isLoading = Var<Bool>(false)
// Check your bool
if isLoading.value {
    ...
}
```

`bindTo()` is a method to bind your views to the variable changes.
```swift
// Example UI reference
@IBOutlet weak var activityIndicator: UIActivityIndicatorView!

// Example observable variable.
let isLoading = Var<Bool>(false)

// Example of binding.
isLoading.bindTo(activityIndicator, to: .state)
```

`.state` is a state designed to specify which attribute of the UI element should be changed.
```swift
public enum BindedProperty {
    case visibility
    case text
    case state
    case title
    case image
    case value
    case progress
    case dataSource
}
```


## Add supported views
If you want to support new UIViews or even your custom classes, you only have to conform the `ObserverViewProtocol`, this protocol contains a simple method named` setValue` that triggers when any observable variable binded changes, you can customize your behavior when this event happends.


```swift
public protocol ObserverViewProtocol {
    func setValue<T>(_ value: T, to property: BindedProperty)
}
```

## Author
Carlos Mejía,
carlosmejia083@gmail.com

https://twitter.com/carlosmejia083

## License

SimpleBinding is available under the MIT license. See the LICENSE file for more info.
