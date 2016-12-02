//
//  UdacityConstant.swift
//  OnTheMap
//
//  Created by ALLAN James on 12/2/16.
//  Copyright © 2016 allanjamescom.allanjames. All rights reserved.
//

import Foundation

extension UdacityClient
{
    struct BaseURL {
        static var HOST = "https://www.udacity.com"
        static let API = HOST + "/api"
    }
    
    struct Methods {
        
        static let Session = "/session"
        static let Users =  "/users"
    }
    
    struct HeaderKeys {
        
        static let Accept = "Accept"
        static let ContentType = "Content-Type"
    }
    
    struct HeaderValues {
        
        static let json = "application/json"
    }
    
    struct JSONBodyKeys {
        
        static let udacity = "udacity"
        static let username = "username"
        static let password = "password"
    }
    
    struct  JSONResponseKeys {
    
        static let account = "account"
        static let registered = "registered"

        static let key = "key"

        static let session = "session"

        static let id = "id"

        static let expiration = "expiration"

        static let user = "user"

        static let firstName = "first_name"

        static let lastName = "last_name"

        static let status = "status"
        static let error = "error"

    }
    
    struct  errors {
        static let loginErr = "Your Udacity Login Failed "
        static let connectionErr = "Connection Error !!!"
    }
}