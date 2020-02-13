//
//  UIElements+ObserverViewProtocol.swift
//  SimpleBinding
//
//  Created by Luis Carlos Mejia Garcia on 7/23/19.
//

import Foundation
import UIKit

extension UINavigationItem: ObserverViewProtocol {
    public func setValue<T>(_ value: T, to property: BindedProperty) {
        DispatchQueue.main.async { [weak self] in
            switch property {
            case .title:
                self?.title = value as? String
                
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
                self?.isHidden = (value as? Bool) ?? false
                
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
                
            default:
                print("\(property) not supported for UIActivityIndicatorView")
            }
        }
    }
}

extension UIButton: ObserverViewProtocol {
    public func setValue<T>(_ value: T, to property: BindedProperty) {
        guard let value = value as? String else {
            return
        }
        
        DispatchQueue.main.async { [weak self] in
            switch property {
            case .title:
                self?.setTitle(value, for: .normal)
                
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
                
            default:
                print("\(property) not supported for UIImageView")
            }
        }
    }
}

extension UITextField: ObserverViewProtocol {
    public func setValue<T>(_ value: T, to property: BindedProperty) {
        guard let value = value as? String else {
            return
        }
        
        DispatchQueue.main.async { [weak self] in
            switch property {
            case .text:
                self?.text = value
                
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
                
            default:
                print("\(property) not supported for UIRefreshControl")
            }
        }
    }
}
