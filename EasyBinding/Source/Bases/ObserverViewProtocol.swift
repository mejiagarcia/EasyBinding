//
//  ObserverViewProtocol.swift
//  Pods-SimpleBinding_Example
//
//  Created by Carlos Mejía on 7/21/19.
//

import Foundation

public protocol ObserverViewProtocol {
    func setValue<T>(_ value: T, to property: BindedProperty)
}
