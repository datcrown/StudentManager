//
//  city.swift
//  StudentManager
//
//  Created by Quốc Đạt on 12.08.17.
//  Copyright © 2017 QuocDat. All rights reserved.
//

import Foundation

struct City {
    var name = ""
    var code = 0
    
    init?(name: String, code: Int) {
        guard  code > 0  else {
            return nil
        }
        guard name != "" else {
            return nil
        }
        self.name = name
        self.code = code
    }
    init?(dict: Dictionary<AnyHashable, Any>) {
        
        guard let name = dict["Name"] else { return nil }
        
        guard let code = dict["CityCode"] else { return nil }
        self.init(name: name as! String, code: code as! Int)
    }
}
