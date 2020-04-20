# EasyBinding

[![CI Status](https://img.shields.io/travis/mejiagarcia/EasyBinding.svg?style=flat)](https://travis-ci.org/mejiagarcia/EasyBinding)
[![Version](https://img.shields.io/cocoapods/v/EasyBinding.svg?style=flat)](https://cocoapods.org/pods/EasyBinding)
[![License](https://img.shields.io/cocoapods/l/EasyBinding.svg?style=flat)](https://cocoapods.org/pods/EasyBinding)
[![Platform](https://img.shields.io/cocoapods/p/EasyBinding.svg?style=flat)](https://cocoapods.org/pods/EasyBinding)

Simplest way to bind your ViewModels to your views :), for real, really simple.

- [Example](#example)
- [Installation](#installation)
- [Usage](#usage)
- [Add supported views](#add-supported-views)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

EasyBinding is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'EasyBinding'
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
public enum VisibilityAnimation {
    case fade(time: TimeInterval)
}

public enum BindedProperty {
    case visibility
    case visibilityAnimated(animation: VisibilityAnimation?)
    case text
    case state
    case title
    case image
    case value
    case progress
    case dataSource
}
```

`listen` is method to listen the value changes of your Var.
```swift
func listen(triggerInitialValue: Bool = false, valueDidChange: @escaping (T) -> Void)
```

Usage

```swift
myVar.listen { newValue in
    print("The new value is: \(newValue)")
}
```

This method will trigger the call only if your variable change, if you want to catch the initial value, you can pass the parameter `triggerInitialValue` (default false) to `true`.

```swift
myVar.listen(triggerInitialValue: true) { newValue in
    print("The new value is: \(newValue)")
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

EasyBinding is available under the MIT license. See the LICENSE file for more info.
