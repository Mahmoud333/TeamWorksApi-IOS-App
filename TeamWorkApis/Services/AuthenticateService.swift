//
//  AuthenticateService.swift
//  TeamWorkApis
//
//  Created by Mahmoud Hamad on 2/11/18.
//  Copyright © 2018 Mahmoud SMGL. All rights reserved.
//

import Alamofire

class AuthenticateService {
    
    static var instance = AuthenticateService()
    
    func AuthenticateAccount(user: String, password: String) {
        
        let url = "https://mahmoudsmglllllllll.teamwork.com/projects.json"
        
        Alamofire.request(url)
            .authenticate(user: user, password: password) //(user: TOKEN, password: "x")
        
    }
    
    
    
}
