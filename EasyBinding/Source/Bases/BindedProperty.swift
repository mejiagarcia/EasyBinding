//
//  BindedProperty.swift
//  SimpleBinding
//
//  Created by Carlos Mejía on 13/02/20.
//  Copyright © 2020 Mejia Garcia. All rights reserved.
//

import Foundation

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
