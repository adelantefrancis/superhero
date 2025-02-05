//
//  UIView+.swift
//  Superhero
//
//  Created by Francis Adelante on 2/5/25.
//

import UIKit

extension UIView {
    func cornerRadius(value: CGFloat){
        self.layer.cornerRadius = value
    }
    func shake() {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.duration = 0.6
        animation.values = [-20.0, 20.0, -20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]
        layer.add(animation, forKey: "shake")
    }
    
    func setRequired(){
        shake()
        self.layer.borderColor = UIColor.shRed.cgColor
    }
    private static let lineDashPattern: [NSNumber] = [7, 7]
    private static let lineDashWidth: CGFloat = 1.0
    
    func makeDashedBorderLine(to: CGFloat) {
        let path = CGMutablePath()
        let shapeLayer = CAShapeLayer()
        shapeLayer.lineWidth = UIView.lineDashWidth
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.lineDashPattern = UIView.lineDashPattern
       
        path.addLines(between: [CGPoint(x: bounds.minX, y: bounds.height/2),
                                CGPoint(x: to, y: bounds.height/2)])
        shapeLayer.path = path
        layer.addSublayer(shapeLayer)
    }
}

