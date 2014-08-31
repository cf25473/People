//
//  person.swift
//  Person
//
//  Created by Christie Ferderer on 8/13/14.
//  Copyright (c) 2014 Christie Ferderer. All rights reserved.
//

import Foundation
import UIKit

class Person: NSObject, NSCoding{
    
    var firstName : String
    var lastName : String
    var image : UIImage?
    var gitHubName : String?


    init (firstName : String, lastName : String){
        
        self.firstName = firstName
        self.lastName = lastName
        super.init()
    }
    func fullName() -> String{
        return self.firstName + " " + self.lastName
  }
    func encodeWithCoder(aCoder: NSCoder){
        aCoder.encodeObject(self.firstName, forKey: "firstName")
        aCoder.encodeObject(self.lastName, forKey: "lastName")
        //aCoder.encodeObject(image, forKey: "image")
        
    }

    required init(coder aDecoder: NSCoder!){
        
        firstName = aDecoder.decodeObjectForKey("firstName") as String
        lastName = aDecoder.decodeObjectForKey("lastName") as String
        //image = aDecoder.decodeObjectForKey("image") as UIImage?
        super.init()
    }
    
}