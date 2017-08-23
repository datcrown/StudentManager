//
//  Modal.swift
//  StudentManager
//
//  Created by Quốc Đạt on 12.08.17.
//  Copyright © 2017 QuocDat. All rights reserved.
//

import Foundation
import UIKit

class Student {
    var name: String
    var iD: String
    var telephone: String
    var photo: UIImage?
    var city: String
    var district: String
    var sex: String
    var age: String
    
    init(name: String, iD: String, telephone: String, photo: UIImage?, city: String, district: String, sex: String, age: String) {
        self.name = name
        self.iD = iD
        self.telephone = telephone
        self.age = age
        self.city = city
        self.district = district
        self.sex = sex
        self.photo = photo
        
    }
}
