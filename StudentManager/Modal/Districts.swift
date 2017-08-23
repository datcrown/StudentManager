//
//  Districts.swift
//  StudentManager
//
//  Created by Quốc Đạt on 12.08.17.
//  Copyright © 2017 QuocDat. All rights reserved.
//

import Foundation

struct Districts {
    var nameDistrict = ""
    var districtCode = 0
    var cityCode = 0
    
    init?(nameDistrict: String, districtCode: Int, cityCode:Int) {
        guard nameDistrict != "" else { return nil }
        guard districtCode > 0 else { return nil }
        guard cityCode > 0 else { return nil }
        
        self.nameDistrict = nameDistrict
        self.districtCode = districtCode
        self.cityCode = cityCode
    }
    init?(dict: Dictionary<AnyHashable, Any>) {
        guard let   nameDistrict = dict ["Name"] else { return nil }
        guard let  districtCode = dict ["DistrictCode"] as? Int else { return nil }
        guard let cityCode = dict ["CityCode"] as? Int else { return nil }
        self.init(nameDistrict: nameDistrict as! String, districtCode: districtCode, cityCode: cityCode)
    }
}
