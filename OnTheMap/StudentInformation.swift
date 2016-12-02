//
//  StudentInformation.swift
//  OnTheMap
//
//  Created by ALLAN James on 12/2/16.
//  Copyright © 2016 allanjamescom.allanjames. All rights reserved.
//

import Foundation

struct StudentInformation {
   
    var objectId : String!
    var uniqueId : String!
    var firstName : String!
    var lastName : String!
    var mapString : String!
    var mediaUrl : String!
    var longitude : Double!
    var latitude : Double!
    
    var fullName : String {return "\(firstName!) \(lastName)"}
    
    //As per requirement init method should accept dictionary as argument
    init(parseResult : [String :AnyObject])
    {
        objectId = parseResult["objectId"] as? String
        uniqueId = parseResult["uniqueId"] as? String
        firstName = parseResult["firstName"] as? String
        lastName = parseResult["lastName"] as? String
        mapString = parseResult["mapString"] as? String
        mediaUrl = parseResult["mediaUrl"] as? String
        longitude = parseResult["longitude"] as? Double
        latitude = parseResult["latitude"] as? Double
    }
    
    static func studentHasNilValues(studentInfo: StudentInformation) -> Bool
    {
        var hasNil: Bool = false
        
        if studentInfo.objectId == nil ||
           studentInfo.firstName == nil ||
           studentInfo.lastName == nil ||
           studentInfo.latitude == nil ||
            studentInfo.longitude == nil
        {
            hasNil  = true
        }
        return hasNil
    }
    static func getLocationFromResults(results: [String: AnyObject])->[StudentInformation]
    {
        var returnLocations = [StudentInformation]()
        
        for  result in results
        {
            if !StudentInformation.studentHasNilValues(StudentInformation(parseResult: result))
            {
                returnLocations.append(StudentInformation(parseResult: result))
            }
            
        }
    
    }
}