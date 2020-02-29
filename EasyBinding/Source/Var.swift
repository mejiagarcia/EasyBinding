//
//  Var.swift
//  Pods-SimpleBinding_Example
//
//  Created by Carlos Mejía on 7/21/19.
//

import Foundation
import UIKit

public typealias ObservableBlock<T> = (T) -> Void

public class Var<T>: NSObject {
    // MARK: - Private Properties
    
    /**
     Array of binden elements, each element can be nil and should implement the `ObserverViewProtocol` protocol.
     */
    private var currentBindedElements = [BindedElement?]()
    
    private let notificationCenter = NotificationCenter.default
    
    private var valueDidChangeNotification: NSNotification.Name {
        return NSNotification.Name(String(describing: self))
    }
    
    /**
     The stored generic value (your variable).
     */
    private var storedValue: T
    
    // MARK: - Public Properties
    
    @available(*, unavailable, renamed: "observe")
    public var valueDidChange: ((T) -> Void)?
    
    @available(*, unavailable, renamed: "listen")
    public var observe: ObservableBlock<T>?
    
    /**
     The stored value getter and setter, when this value is setted, the method `elementDidChange` is called.
     */
    public var value: T {
        get {
            return storedValue
        }
        set(newValue) {
            self.storedValue = newValue
            elementDidChange()
        }
    }
    
    // MARK: - NSObject Life Cycle
    
    public init(_ value: T) {
        self.storedValue = value
    }
    
    deinit {
        destroy()
    }
    
    // MARK: - Public Methods
    
    /**
    Method to listen for element changes.
    - Parameter valueDidChange: Block with the changed variable.
    */
    public func listen(valueDidChange: @escaping (T) -> Void) {
        notificationCenter.addObserver(forName: valueDidChangeNotification, object: nil, queue: nil) { [weak self] _ in
            guard let self = self else { return }
            valueDidChange(self.storedValue)
        }
    }
    
    /**
     Method to bind an element in this variable.
     - Parameter element: Any elelement (usually UIView) that conforms the ObserverViewProtocol.
     */
    public func bindTo(_ element: ObserverViewProtocol?, to property: BindedProperty) {
        currentBindedElements.append(BindedElement(element: element, property: property))
        elementDidChange()
    }
    
    /**
     Method to destroy the listener method and remove all the binded elements.
     */
    public func destroy() {
        notificationCenter.removeObserver(self, name: valueDidChangeNotification, object: nil)
        currentBindedElements.removeAll()
    }
    
    // MARK: - Private Methods
    
    /**
     Method to trigger the `valueDidChange` method and notify the binded elements for a change in the current value.
     */
    private func elementDidChange() {
        NotificationCenter.default.post(name: valueDidChangeNotification, object: nil)
        notifyBindedElements(value: value)
    }
    
    /**
     Recursive method to nofity the current binded elements array.
     - Parameter index: Index to start the recursivity, by default is 0.
     - Parameter value: New value (value that just changed) to send to the binded elements.
     */
    private func notifyBindedElements(at index: Int = 0, value: T) {
        guard
            let bindedElement = currentBindedElements.safePosition(index) as? BindedElement,
            let element = bindedElement.element else {
                
                return
        }
        
        element.setValue(value, to: bindedElement.property)
        
        notifyBindedElements(at: index + 1, value: value)
    }
}
