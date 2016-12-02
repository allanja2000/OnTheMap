//
//  Converter.swift
//  OnTheMap
//
//  Created by ALLAN James on 12/2/16.
//  Copyright © 2016 allanjamescom.allanjames. All rights reserved.
//

import Foundation

class Converter {
    
    static func toNSData( requestBody : [String : AnyObject]?  = nil ) -> NSData
    {
        var jsonData : NSData! = nil
    
        do
        {
            jsonData = try NSJSONSerialization.dataWithJSONObject(requestBody!, options: NSJSONWritingOptions.PrettyPrinted)
        }
        catch let error as NSError
        {
            print(error)
        }
    
        return jsonData
    }
    
    static func parseJSONtoAnyObject( response : NSData ,completionHandler :(result:AnyObject!, error:NSError?)->Void )
    {
        var parsedResponse :AnyObject! = nil
        do
        {
            parsedResponse = try NSJSONSerialization.JSONObjectWithData(response, options: NSJSONReadingOptions.AllowFragments)
            completionHandler(result:parsedResponse, error:nil)
        }
        
        catch let error as NSError
        {
            completionHandler(result: nil, error: error)
        }
    }
}
