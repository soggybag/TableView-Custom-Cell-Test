//
//  Cat.swift
//  TableView-Custom-Cell-Test
//
//  Created by mitchell hudson on 11/22/15.
//  Copyright © 2015 mitchell hudson. All rights reserved.
//

import UIKit

// A simple cat object to display in each cell. 

class Cat {
    var name: String
    var imageName: String
    var age: Int
    var liked: Bool = false
    
    // Cat(name: String, age: Int, imageName: String)
    init(name: String, age: Int, imageName: String) {
        self.name = name
        self.age = age
        self.imageName = imageName
    }
    
    init() {
        self.name = "Kitty"
        self.age = 1
        self.imageName = ""
    }
}
