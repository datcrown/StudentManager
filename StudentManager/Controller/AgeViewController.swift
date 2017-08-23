//
//  AgeViewController.swift
//  StudentManager
//
//  Created by Quốc Đạt on 15.08.17.
//  Copyright © 2017 QuocDat. All rights reserved.
//

import UIKit

class AgeViewController: UIViewController {
    
    static var identifier = "AgeViewController"
    static var instance : AgeViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: AgeViewController.identifier) as! AgeViewController
    }
    
    @IBOutlet weak var selectAgePickerView: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        selectAgePickerView.delegate = self
        selectAgePickerView.dataSource = self
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
extension AgeViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return DataService.shared.ageList.count
    }
    
    
}

extension AgeViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(DataService.shared.ageList[row]) tuổi"
    }
}

