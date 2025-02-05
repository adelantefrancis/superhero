//
//  Constant.swift
//  Superhero
//
//  Created by Francis Adelante on 2/5/25.
//

import UIKit

struct Design {
    let regularFontSize:CGFloat = 15.0
    let formFontSize:CGFloat = 12.0
    
    struct SPFonts {
        let arial = "ArialMT"
        let arialItalic = "Arial-ItalicMT"
        let arialBold = "Arial-BoldMT"
    }
    
}

enum UserDefaultsKey: String{
    case heroInSession = "heroInSession"
}
