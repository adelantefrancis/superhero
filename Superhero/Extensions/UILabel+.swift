//
//  UILabel+.swift
//  Superhero
//
//  Created by Francis Adelante on 2/5/25.
//

import UIKit

extension UILabel {
    
    func pageHeader(textColor: UIColor = .shCharcoal){
        self.textColor = textColor
        self.font = UIFont(name: Design.SPFonts().arialBold, size: 20)!
    }
    func pageSubHeader(name:String = Design.SPFonts().arial, textColor: UIColor = .shCharcoal){
        self.textColor = textColor
        self.font = UIFont(name: name, size: 18)!
    }
    
    func errorLabel(textColor: UIColor = .shRed){
        self.textColor = textColor
        self.font = UIFont(name: Design.SPFonts().arial, size: 14)!
    }
    
    func normalLabel(textColor: UIColor = .shCharcoal, retain: Bool = false){
        if !retain {
            self.textColor = textColor
        }
        self.font = UIFont(name: Design.SPFonts().arial, size: 14)!
    }
    
    func normalLabelItalic(textColor: UIColor = .shCharcoal, retain: Bool = false){
        if !retain {
            self.textColor = textColor
        }
        self.font = UIFont(name: Design.SPFonts().arialItalic, size: 14)!
    }
    
    func formLabel(textColor: UIColor = .shCharcoal){
        self.textColor = textColor
        self.font = UIFont(name: Design.SPFonts().arialBold, size: 14)!
    }
    
    func modified(textColor: UIColor = .shCharcoal, fontSize: CGFloat, bold: Bool = true) {
        self.textColor = textColor
        var font = Design.SPFonts().arial
        
        if bold {
            font = Design.SPFonts().arialBold
        }
        
        self.font = UIFont(name: font, size: fontSize)!
    }
    
    func modifiedItalic(textColor: UIColor = .shCharcoal, fontSize: CGFloat) {
        self.textColor = textColor
        let font = Design.SPFonts().arialItalic
        
        self.font = UIFont(name: font, size: fontSize)!
    }
    
}
