//
//  DataService.swift
//  StudentManager
//
//  Created by Quốc Đạt on 12.08.17.
//  Copyright © 2017 QuocDat. All rights reserved.
//

import Foundation
import UIKit

class DataService {
 
    static let shared: DataService = DataService()
    
    //MARK: - Student
    private var _students: [Student]?
    var students : [Student] {
        get {
            if _students == nil {
                loadSampleStudents()
            }
            return _students ?? []
        }
        set {
            _students = newValue
        }
    }
    weak var studentsTBV: StudentTableViewController?
    
    private func loadSampleStudents() {
        if _students == nil {
            _students = []
        }
        let photo1 = UIImage(named: "student1")
        let student1 = Student(name: "Tran Quoc Dat", iD: "BigZero", telephone: "0961021643", photo: photo1, city: "Ha Noi", district: "Cau Giay", sex: "Male", age: "18")
        _students?.append(student1)
    }
    
    //MARK: - City
    private var _cities: [City]!
    
    var cities: [City] {
        set {
            _cities = newValue
        }
        get {
            if _cities == nil {
                updateCities()
            }
            return _cities
        }
    }
    func updateCities() {
        _cities = []
        let PlistFile = "Cities.plist"
        guard let root = PlistServices().getDictionaryFrom(plist: PlistFile) else { return }
        guard let cityDict = root["Cities"] as? [Dictionary<AnyHashable, Any>] else { return  }
        for dict in cityDict {
            if let city = City(dict:dict) {
                _cities.append(city)
            }
        }
        
    }
    
    //MARK: - District
    private var _districts:[Districts]!
    var districts: [Districts] {
        set {
            _districts = newValue
        }
        get {
            if _districts == nil {
            }
            updateDistricts()
            return _districts
        }
    }
    
    var selectedCity: City? {
        didSet {
            if selectedCity != nil {
                districtsAtSelectedCity = districts.filter {
                    $0.cityCode == selectedCity!.code
                }
                
            } else {
                districtsAtSelectedCity = nil
            }
        }
    }
    
    var selectedDistrict: Districts?
    var districtsAtSelectedCity: [Districts]?
    
    func updateDistricts() {
        _districts = []
        let PlistFile = "Districts.plist"
        guard let root = PlistServices().getDictionaryFrom(plist: PlistFile) else { return }
        guard let districtDict = root["Districts"] as? [Dictionary<AnyHashable, Any>] else { return }
        
        for dict in districtDict {
            if let district = Districts(dict: dict) {
                _districts?.append(district)
            }
        }
        print(_districts)
    }
    
    //MARK: - Gender
    let genderList = [ "Male","Female","Genderqueer"]
    
    //MARK: - Age
    let ageList: [Int] = Array(18...100)
}
