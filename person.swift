//
//  person.swift
//  Person
//
//  Created by Christie Ferderer on 8/13/14.
//  Copyright (c) 2014 Christie Ferderer. All rights reserved.
//

import Foundation
import UIKit

class Person: NSObject {
    
    var firstName : String
    var lastName : String
    var image : UIImage?

    init (firstName : String, lastName : String){
        self.firstName = firstName
        self.lastName = lastName
    }
    func fullName() -> String{
        return self.firstName + " " + self.lastName
  }
}