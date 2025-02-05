//
//  UITextField+.swift
//  Superhero
//
//  Created by Francis Adelante on 2/5/25.
//

import UIKit

extension UITextField{
    func setRequired(shake: Bool = false){
        self.layer.borderColor = UIColor.shRed.cgColor
        self.setNeedsLayout()
        if shake {
            self.shake()
        }
    }
}
