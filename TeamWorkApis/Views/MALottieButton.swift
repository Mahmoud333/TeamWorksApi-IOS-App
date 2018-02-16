//
//  MALottieButton.swift
//  TeamWorkApis
//
//  Created by Mahmoud Hamad on 2/12/18.
//  Copyright © 2018 Mahmoud SMGL. All rights reserved.
//

import UIKit
import Lottie

@IBDesignable
class MALottieButton: MAButton {
    
    //So u can initialize it from Code
    public private(set) var lottieView: LOTAnimationView?
    
    @IBInspectable var animationSpeed: CGFloat = 1.0
    @IBInspectable var lottineBGColor: UIColor = UIColor.white
    
    
    @IBInspectable public var animationName: String? {
        didSet {
            if animationName != nil {
                makeItWithAnimation(name: animationName!)
            }
        }
    }
    
    func makeItWithAnimation(name: String) {
        
        lottieView = LOTAnimationView(name: animationName!)
        //lottieView = LOTAnimationView(name: "menu_hamburger", bundle: Bundle(for: type(of: self)))
        
        //Important things
        lottieView?.translatesAutoresizingMaskIntoConstraints = false
        lottieView?.isUserInteractionEnabled = true
        
        //Customize It
        lottieView?.animationSpeed = animationSpeed
        lottieView?.backgroundColor = lottineBGColor
        
        //Add it
        self.addSubview(lottieView!)
        
        //Its Constraints
        lottieView?.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        lottieView?.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        lottieView?.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        lottieView?.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    

    override func draw(_ rect: CGRect) {  }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        //act as if the button was the one pressed, in reality its lottieView
        sendActions(for: .touchUpInside)

        
        print(lottieView?.animationProgress)
        //-0.1 from 0.5
        //-0.15 from 1.0
        if lottieView!.animationProgress < CGFloat(0.4) { //.animationProgress == 0

            lottieView?.play(toProgress: 0.4, withCompletion: { [weak self] (finished) in })
        } else {
            lottieView?.play(toProgress: 0.85, withCompletion: { [weak self] (finished) in
                self?.lottieView?.animationProgress = 0.1
            })
        }
    }
    
    //So if we opend menu by tap, swipe gesture
    func animateTapped() {
        if lottieView!.animationProgress < CGFloat(0.4) { //.animationProgress == 0
            
            lottieView?.play(toProgress: 0.4, withCompletion: { [weak self] (finished) in })
        } else {
            lottieView?.play(toProgress: 0.85, withCompletion: { [weak self] (finished) in
                self?.lottieView?.animationProgress = 0.1
            })
        }
    }

}
