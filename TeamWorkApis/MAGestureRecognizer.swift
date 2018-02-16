//
//  GestureExtension.swift
//  TeamWorkApis
//
//  Created by Mahmoud Hamad on 2/11/18.
//  Copyright © 2018 Mahmoud SMGL. All rights reserved.
//

import UIKit.UIGestureRecognizerSubclass

class UIShortTapGestureRecognizer: UITapGestureRecognizer {
    let tapMaxDelay: Double = 0.1
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesBegan(touches, with: event)
        
        UIShortTapGestureRecognizer.delay(delay: tapMaxDelay) {
            // Enough time has passed and the gesture was not recognized -> It has failed.
            if  self.state != UIGestureRecognizerState.ended {
                self.state = UIGestureRecognizerState.failed
            }
        }
    }
    
    class func delay(delay:Double, closure:@escaping ()->()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            closure()
        }
    }
}


