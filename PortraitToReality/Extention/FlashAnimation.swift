//
//  FlashAnimation.swift
//  WindowDoors
//
//  Created by Lorem on 8/16/19.
//  Copyright © 2019 Bontar Mykhailo. All rights reserved.
//

import Foundation
import UIKit


//MARK: - Take Screenshot Animation
func flashAnimation(mainView: UIView, lightView: UIView ) {
    mainView.bringSubviewToFront(lightView)
    lightView.alpha = 0
    lightView.isHidden = false
    
    UIView.animate(withDuration: 0.1, delay: 0.0, options: [.curveEaseOut], animations: {() -> Void in
        lightView.alpha = 1.0
    }, completion: {(finished: Bool) -> Void in
        hideFlashView(view: lightView)
    })
}

func hideFlashView(view: UIView) {
    UIView.animate(withDuration: 0.1, delay: 0.0, animations: {() -> Void in
        view.alpha = 0.0
        view.isHidden = true
    })
}

