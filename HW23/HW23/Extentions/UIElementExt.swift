//
//  UiViewExt.swift
//  HW23
//
//  Created by Roman Litvinovich on 07/10/2023.
//

import UIKit

extension UIView {
    
    func roundElement () {
        layer.cornerRadius = 30
        layer.masksToBounds = true
    }
    
    func roundElementIntHeight() {
        layer.cornerRadius = frame.height / 2
        layer.masksToBounds = true
    }
    
    func setShadow() {
            let shadowContainerView = UIView(frame: frame)
            shadowContainerView.backgroundColor = UIColor.clear
            shadowContainerView.layer.cornerRadius = layer.cornerRadius
            shadowContainerView.layer.shadowColor = UIColor.black.cgColor
            shadowContainerView.layer.shadowOpacity = 0.5
        shadowContainerView.layer.shadowOffset = CGSize(width: -10, height: 10)
            shadowContainerView.layer.shadowRadius = 5
            
            superview?.insertSubview(shadowContainerView, belowSubview: self)
            shadowContainerView.addSubview(self)
        }

    func pulsate() {
        let pulsate = CASpringAnimation(keyPath: "transform.scale")
        pulsate.duration = 0.6
        pulsate.fromValue = 0.9
        pulsate.toValue = 1.1
        pulsate.autoreverses = true
        pulsate.initialVelocity = 0.3
        pulsate.damping = 1
        
        layer.add(pulsate, forKey: nil)
        
    }
}
