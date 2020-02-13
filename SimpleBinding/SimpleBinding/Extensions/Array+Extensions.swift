//
//  Array+Extensions.swift
//  Pods-SimpleBinding_Example
//
//  Created by Carlos Mejía on 7/21/19.
//

import Foundation

extension Array {
    func safePosition(_ index: Int) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
