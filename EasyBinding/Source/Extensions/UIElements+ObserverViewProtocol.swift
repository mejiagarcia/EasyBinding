//
//  UIElements+ObserverViewProtocol.swift
//  SimpleBinding
//
//  Created by Luis Carlos Mejia Garcia on 7/23/19.
//

import Foundation
import UIKit

extension UIViewEB: ObserverViewProtocol {
    public func setValue<T>(_ value: T, to property: BindedProperty) {
        DispatchQueue.main.async { [weak self] in
            switch property {
            case .visibility:
                Helpers.toggleViewVisibility(view: self, state: value)
                
            case .visibilityAnimated(let animation):
                Helpers.toggleViewVisibility(view: self, state: value, animation: animation)
                
            default:
                print("\(property) not supported for UIViewEB")
            }
        }
    }
}

extension UINavigationItem: ObserverViewProtocol {
    public func setValue<T>(_ value: T, to property: BindedProperty) {
        DispatchQueue.main.async { [weak self] in
            switch property {
            case .title:
                self?.title = value as? String
                
            case .visibility:
                Helpers.toggleViewVisibility(view: self?.titleView, state: value)
                
            case .visibilityAnimated(let animation):
                Helpers.toggleViewVisibility(view: self?.titleView, state: value, animation: animation)
                
            default:
                print("\(property) not supported for UINavigationItem")
            }
        }
    }
}

extension UILabel: ObserverViewProtocol {
    public func setValue<T>(_ value: T, to property: BindedProperty) {
        DispatchQueue.main.async { [weak self] in
            switch property {
            case .text:
                self?.text = value as? String
                
            case .visibility:
                Helpers.toggleViewVisibility(view: self, state: value)
                
            case .visibilityAnimated(let animation):
                Helpers.toggleViewVisibility(view: self, state: value, animation: animation)
                
            default:
                print("\(property) not supported for UILabel")
            }
        }
    }
}

extension UIActivityIndicatorView: ObserverViewProtocol {
    public func setValue<T>(_ value: T, to property: BindedProperty) {
        guard let isAnimating = value as? Bool else {
            return
        }
        
        DispatchQueue.main.async { [weak self] in
            switch property {
            case .state:
                isAnimating ? self?.startAnimating() : self?.stopAnimating()
                
            case .visibility:
                Helpers.toggleViewVisibility(view: self, state: value)
                
            case .visibilityAnimated(let animation):
                Helpers.toggleViewVisibility(view: self, state: value, animation: animation)
                
            default:
                print("\(property) not supported for UIActivityIndicatorView")
            }
        }
    }
}

extension UIButton: ObserverViewProtocol {
    public func setValue<T>(_ value: T, to property: BindedProperty) {
        DispatchQueue.main.async { [weak self] in
            switch property {
            case .title:
                self?.setTitle(value as? String, for: .normal)
                
            case .state:
                self?.isEnabled = (value as? Bool) ?? self?.isEnabled ?? false
                
            case .visibility:
                Helpers.toggleViewVisibility(view: self, state: value)
                
            case .visibilityAnimated(let animation):
                Helpers.toggleViewVisibility(view: self, state: value, animation: animation)
                
            default:
                print("\(property) not supported for UIButton")
            }
        }
    }
}

extension UIImageView: ObserverViewProtocol {
    public func setValue<T>(_ value: T, to property: BindedProperty) {
        guard let value = value as? UIImage else {
            return
        }
        
        DispatchQueue.main.async { [weak self] in
            switch property {
            case .image:
                self?.image = value
                
            case .visibility:
                Helpers.toggleViewVisibility(view: self, state: value)
                
            case .visibilityAnimated(let animation):
                Helpers.toggleViewVisibility(view: self, state: value, animation: animation)
                
            default:
                print("\(property) not supported for UIImageView")
            }
        }
    }
}

extension UITextField: ObserverViewProtocol {
    public func setValue<T>(_ value: T, to property: BindedProperty) {
        DispatchQueue.main.async { [weak self] in
            switch property {
            case .text:
                self?.text = value as? String
                
            case .state:
                self?.isEnabled = (value as? Bool) ?? false
                
            case .visibility:
                Helpers.toggleViewVisibility(view: self, state: value)
                
            case .visibilityAnimated(let animation):
                Helpers.toggleViewVisibility(view: self, state: value, animation: animation)
                
            default:
                print("\(property) not supported for UITextField")
            }
        }
    }
}

extension UISlider: ObserverViewProtocol {
    public func setValue<T>(_ value: T, to property: BindedProperty) {
        guard let value = value as? Float else {
            return
        }
        
        DispatchQueue.main.async { [weak self] in
            switch property {
            case .value:
                self?.value = value
                
            case .visibility:
                Helpers.toggleViewVisibility(view: self, state: value)
                
            case .visibilityAnimated(let animation):
                Helpers.toggleViewVisibility(view: self, state: value, animation: animation)
                
            default:
                print("\(property) not supported for UISlider")
            }
        }
    }
}

extension UISwitch: ObserverViewProtocol {
    public func setValue<T>(_ value: T, to property: BindedProperty) {
        guard let value = value as? Bool else {
            return
        }
        
        DispatchQueue.main.async { [weak self] in
            switch property {
            case .state:
                self?.isOn = value
                
            case .visibility:
                Helpers.toggleViewVisibility(view: self, state: value)
                
            case .visibilityAnimated(let animation):
                Helpers.toggleViewVisibility(view: self, state: value, animation: animation)
                
            default:
                print("\(property) not supported for UISwitch")
            }
        }
    }
}

extension UIProgressView: ObserverViewProtocol {
    public func setValue<T>(_ value: T, to property: BindedProperty) {
        guard let value = value as? Float else {
            return
        }
        
        DispatchQueue.main.async { [weak self] in
            switch property {
            case .progress:
                self?.setProgress(value, animated: true)
                
            case .visibility:
                Helpers.toggleViewVisibility(view: self, state: value)
                
            case .visibilityAnimated(let animation):
                Helpers.toggleViewVisibility(view: self, state: value, animation: animation)
                
            default:
                print("\(property) not supported for UIProgressView")
            }
        }
    }
}

extension UITableView: ObserverViewProtocol {
    public func setValue<T>(_ value: T, to property: BindedProperty) {
        DispatchQueue.main.async { [weak self] in
            switch property {
            case .dataSource:
                self?.reloadData()
                
            case .visibility:
                Helpers.toggleViewVisibility(view: self, state: value)
                
            case .visibilityAnimated(let animation):
                Helpers.toggleViewVisibility(view: self, state: value, animation: animation)
                
            default:
                print("\(property) not supported for UITableView")
                
            }
        }
    }
}

extension UICollectionView: ObserverViewProtocol {
    public func setValue<T>(_ value: T, to property: BindedProperty) {
        DispatchQueue.main.async { [weak self] in
            switch property {
            case .dataSource:
                self?.reloadData()
                
            case .visibility:
                Helpers.toggleViewVisibility(view: self, state: value)
                
            case .visibilityAnimated(let animation):
                Helpers.toggleViewVisibility(view: self, state: value, animation: animation)
                
            default:
                print("\(property) not supported for UICollectionView")
            } 
        }
    }
}

extension UIRefreshControl: ObserverViewProtocol {
    public func setValue<T>(_ value: T, to property: BindedProperty) {
        guard let isLoading = value as? Bool else {
            return
        }
        
        DispatchQueue.main.async { [weak self] in
            switch property {
            case .state:
                isLoading ? self?.beginRefreshing() : self?.endRefreshing()
                
            case .visibility:
                Helpers.toggleViewVisibility(view: self, state: value)
                
            case .visibilityAnimated(let animation):
                Helpers.toggleViewVisibility(view: self, state: value, animation: animation)
                
            default:
                print("\(property) not supported for UIRefreshControl")
            }
        }
    }
}
