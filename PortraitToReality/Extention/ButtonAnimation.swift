//
//  ButtonAnimation.swift
//  WindowDoors
//
//  Created by Lorem on 8/15/19.
//  Copyright © 2019 Bontar Mykhailo. All rights reserved.
//
import UIKit

extension UIButton {
    func pulsatingButtonAnimation()/* -> UIButton */{
        
        let pulse1 = CASpringAnimation(keyPath: "transform.scale")
        pulse1.duration = 0.6
        pulse1.fromValue = 1.0
        pulse1.toValue = 1.12
        pulse1.autoreverses = true
        pulse1.repeatCount = .infinity
        pulse1.initialVelocity = 0.5
        pulse1.damping = 0.8
        
        let animationGroup = CAAnimationGroup()
        animationGroup.duration = 3
        animationGroup.repeatCount = .infinity
        animationGroup.animations = [pulse1]
        
        self.layer.add(animationGroup, forKey: "pulse")
    }
}
