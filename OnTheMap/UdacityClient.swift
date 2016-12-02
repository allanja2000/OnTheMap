//
//  UdacityClient.swift
//  OnTheMap
//
//  Created by ALLAN James on 12/1/16.
//  Copyright © 2016 allanjamescom.allanjames. All rights reserved.
//

import Foundation

class UdacityClient {
    
    var usrObjectId : String!
    var usrFirstName : String = ""
    var usrLastName : String = ""

    var session = NSURLSession.sharedSession()
    
    static let singletonShared = UdacityClient()
    
    func setHeaders(request : NSMutableURLRequest) -> NSMutableURLRequest
    {
        request.addValue(HeaderValues.json, forHTTPHeaderField: HeaderKeys.Accept)
        request.addValue(HeaderValues.json, forHTTPHeaderField: HeaderKeys.ContentType)
        return request

    }
    
    func getMethodURL ( resourceName : String) -> NSURL
    {
        return NSURL(string : BaseURL.API + resourceName)!
    }
    
    func makeTaskCall(request: NSURLRequest, completionHandlerForTaskCall : ( result : AnyObject? , error : NSError?) -> Void ) {
        
        let session = NSURLSession.sharedSession()
        
        let task = session.dataTaskWithRequest(request)
        {
            (data, response, error ) in
             if ( error == nil)
             {
                let newData =  data?.subdataWithRange(NSMakeRange(5, (data?.length)! - 5)) //based on Udacity security standards
                Converter.parseJSONtoAnyObject(newData!, completionHandler : completionHandlerForTaskCall)
            }
            else
            {
                completionHandlerForTaskCall( result : nil, error: error!)
            }
        }
        task.resume()
    }
    
    func loginWithCredentials ( userName : String, password:  String, completionHandlerForLogin: (success : Bool, errorMessage:String)->Void) {
        
        var apiRequest = [String: AnyObject] ()
        apiRequest[JSONBodyKeys.udacity] = [JSONBodyKeys.username:userName, JSONBodyKeys.password:password]
        
        var request = NSMutableURLRequest(URL:getMethodURL(Methods.Session))
        request.HTTPMethod = "POST"
        request = setHeaders(request)
        
        request.HTTPBody = Converter.toNSData(apiRequest)
        
        makeTaskCall(request, completionHandlerForTaskCall: { (result, error) in
            
            if  error == nil
            {
              /*  if let account = result!.value
                {
                }
 */
            }
        })
    }
}