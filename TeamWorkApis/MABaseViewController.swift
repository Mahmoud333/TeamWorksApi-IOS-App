//
//  MABaseViewController.swift
//  TeamWorkApis
//
//  Created by Mahmoud Hamad on 2/12/18.
//  Copyright © 2018 Mahmoud SMGL. All rights reserved.
//

import UIKit

class MABaseViewController: UIViewController {
    
    @IBOutlet weak var menuLtiBtn: MALottieButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setSWReveal()
    }
    
    func setSWReveal() {
        
        //Set SWReveal
        menuLtiBtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
    }
    
    
    
    func presentSentFrontViewController(_ DVC: UIViewController) {
        if self.revealViewController().frontViewPosition == FrontViewPosition.left {
            print("FrontViewPosition == FrontViewPosition.left")
            
            self.revealViewController().setFront(DVC, animated: true)
        } else {
            print("else")
            self.revealViewController().revealToggle(animated: true)
            self.revealViewController().setFront(DVC, animated: true)
        }
        
    }
}

