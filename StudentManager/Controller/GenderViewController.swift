//
//  GenderViewController.swift
//  StudentManager
//
//  Created by Quốc Đạt on 15.08.17.
//  Copyright © 2017 QuocDat. All rights reserved.
//

import UIKit

class GenderViewController: UIViewController {
    
    static var identifier = "GenderViewController"
    static var instance : GenderViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: GenderViewController.identifier) as! GenderViewController
    }
        
    @IBOutlet weak var selectGenderPickerView: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        selectGenderPickerView.delegate = self
        selectGenderPickerView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension GenderViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return DataService.shared.genderList.count
    }
}
extension GenderViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(DataService.shared.genderList[row])"
    }
}
