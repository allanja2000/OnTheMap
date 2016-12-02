//
//  ParseConstants.swift
//  OnTheMap
//
//  Created by ALLAN James on 12/2/16.
//  Copyright © 2016 allanjamescom.allanjames. All rights reserved.
//

import Foundation

extension ParseClient {
    
    struct BaseURL {
        static let APIKey : String = "QuWThTdiRmTux3YaDseUSEpUKo7aBYM737yKd4gY"
        static let APIID : String = "QrX47CA9cyuGewLdsL7o5Eb8iug6Em8ye0dnAbIr"
        static let API : String = "http://parse.udacity.com/parse/classes"
    }
    
    struct Methods {
        static let studentLocation = "/StudentLocation"
    }
    
    struct HeaderKeys {
        
        static let Accept = "Accept"
        static let ContentType = "Content-Type"
        static let ApplicationId = "X-Parse-Application-Id"
        static let RestAPIKey = "X-Parse-REST-API-Key"

    }
    
    struct  HeaderValues {
        static let JSON = "application/json"
    }
    
    struct JSONResponseKey {
        
    }
}