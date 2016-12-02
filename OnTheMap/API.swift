//
//  API.swift
//  OnTheMap
//
//  Created by ALLAN James on 12/2/16.
//  Copyright © 2016 allanjamescom.allanjames. All rights reserved.
//

import Foundation

class API {
    
    private let session : NSURLSession
    
    static let sharedInstance = API()
    
    enum RestHTTPMethod:String {
        case GET
        case POST
        case DELETE
        case PUT
    }
    
    private init()
    {
        let configuration  = NSURLSessionConfiguration.defaultSessionConfiguration()
        self.session = NSURLSession (configuration: configuration)
    }
    
    func send(url:NSURL, restHttpMethod:RestHTTPMethod, HTTPHeaders:[String:String]!, requestBody:[String:AnyObject]? = nil, responseHandler: (NSData?, NSError?))-> Void
    {
        let sessionRequest =  NSMutableURLRequest(URL: url)
        sessionRequest.HTTPMethod = restHttpMethod.rawValue
        
        if let HTTPHeaders = HTTPHeaders
        {
            for ( headerKey, headerValue ) in HTTPHeaders
            {
                sessionRequest.addValue(headerValue, forHTTPHeaderField: headerKey)
            }
        }
        
        //Ref: StackOverflow: Convert Dictionary to JSON in SWIFT.
        
        if ( requestBody != nil )
        {
            do {
                
                let jsonData = try NSJSONSerialization.dataWithJSONObject(requestBody!, options: NSJSONWritingOptions.PrettyPrinted)
                
                sessionRequest.HTTPBody = jsonData
                
            }
            catch let error as NSError
            {
                print ( error )
            }
        }
        
        let task =  session.dataTaskWithURL(sessionRequest)
        {
            (data, response ,error ) in
            if let error = error
            {
                print(error)
                responseHandler(nil, error )
                return
            }
            responseHandler(data, nil)
        }
        task.resume()
    }
}