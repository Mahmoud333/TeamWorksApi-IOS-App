//
//  ViewController.swift
//  TeamWorkApis
//
//  Created by Mahmoud Hamad on 2/7/18.
//  Copyright © 2018 Mahmoud SMGL. All rights reserved.
//

import UIKit
import Alamofire

class LoginVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AuthenticateService.instance.AuthenticateAccount()

    }

    
    @IBAction func LoginTapped(_ sender: Any) {
        
        //Go To Projects VC
        //self.performSegue(withIdentifier: "GoToProjects", sender: nil)

        //Go To ActivityVC
        //let dvc = storyboard?.instantiateViewController(withIdentifier: "ActivityVC") as! ActivityVC
        //present(dvc, animated: true, completion: nil)
        
        //Go To RevealVC
        let dvc = storyboard?.instantiateViewController(withIdentifier: "RevealVC") as! SWRevealViewController
        present(dvc, animated: true, completion: nil)
        
        
        
        
    }
    
}







