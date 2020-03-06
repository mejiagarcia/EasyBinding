//
//  Helpers.swift
//  EasyBinding
//
//  Created by Carlos Mejía on 5/03/20.
//  Copyright © 2020 Mejia Garcia. All rights reserved.
//

import UIKit

class Helpers {
    static func toggleViewVisibility(view: UIView?, state: Any?, animation: VisibilityAnimation? = nil) {
        guard let isHidden = state as? Bool else {
            return
        }
        
        guard let animation = animation else {
            view?.isHidden = isHidden
            
            return
        }
        
        switch animation {
        case .fade(let time):
            if isHidden {
                UIView.animate(withDuration: time, animations: {
                    view?.alpha = 0
                }, completion: { _ in
                    view?.isHidden = true
                })
            } else {
                view?.alpha = 0
                view?.isHidden = false
                
                UIView.animate(withDuration: time) {
                    view?.alpha = 1
                }
            }
        }
    }
}
