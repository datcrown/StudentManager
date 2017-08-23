//
//  StudentDetailTableViewController.swift
//  StudentManager
//
//  Created by Quốc Đạt on 12.08.17.
//  Copyright © 2017 QuocDat. All rights reserved.
//

import UIKit
import os.log

class StudentDetailTableViewController: UITableViewController, UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var studentIDTextField: UITextField!
    @IBOutlet weak var telephoneTextField: UITextField!
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var districtLabel: UILabel!
    var student: Student?
    //Set up view if editing an existing Student.
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        if let student = student {
            navigationItem.title =  student.name
            nameTextField.text = student.name
            photoView.image = student.photo
            telephoneTextField.text = student.telephone
            studentIDTextField.text = student.iD
            ageLabel.text = student.age
            genderLabel.text = student.sex
            cityLabel.text = student.city
            districtLabel.text = student.district
        }
        nameTextField.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func selectImageFromLibrary(_ sender: UITapGestureRecognizer) {
        
        //Hide The Keyboard
        nameTextField.resignFirstResponder()
        
        
        creatAlert(title: "Choose Photo", message: "Where do you want to choose the Photo")
        
    }
    
    //Creat Alert to choose camera or library
    func creatAlert (title: String, message: String) {
        let alert =  UIAlertController ( title: title, message: message, preferredStyle: .alert)
        let takePhotoFromLibary = UIAlertAction(title:"Choose photo from library" , style: .default, handler: { (action) in
            // let users pick photo from library
            
            let imagePickerController = UIImagePickerController()
            
            imagePickerController.sourceType = .photoLibrary
            imagePickerController.allowsEditing = true
            imagePickerController.delegate = self
            self.present(imagePickerController, animated: true, completion: nil)
        })
        
        let takeNewPhoto = UIAlertAction(title: "Take a new photo", style: .default, handler: { (action) in
            let imagePickerController = UIImagePickerController()
            imagePickerController.sourceType = .camera
            imagePickerController.allowsEditing = true
            imagePickerController.delegate = self
            self.present(imagePickerController, animated: true, completion: nil)
        })
        alert.addAction(takePhotoFromLibary)
        alert.addAction(takeNewPhoto)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    // MARK: - UIImagePickerControllerDelegate
  
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let selectedImage = info[UIImagePickerControllerEditedImage] as?  UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        photoView.image = selectedImage
        
        //Dissmiss the picker
        dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue , sender: sender)
        guard let button = sender as? UIBarButtonItem,
            button === saveButton else {
                os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .default)
                return
        }
        
        let name = nameTextField.text ?? ""
        let photo = photoView.image
        let iD = studentIDTextField.text ?? ""
        let phone = telephoneTextField.text ?? ""
        let age = ageLabel.text ?? ""
        let gender = genderLabel.text ?? ""
        let city = cityLabel.text ?? ""
        let district = districtLabel.text ?? ""
        student = Student(name: name, iD: iD, telephone: phone, photo: photo, city: city, district: district, sex: gender, age: age)
        
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        navigationItem.title = nameTextField.text
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard
        navigationItem.title = nameTextField.text
        textField.resignFirstResponder()
        return true
    }
    
    // MARK: - Navigation
    @IBAction func Cancel(_ sender: UIBarButtonItem) {
        let isPresentingInAddStudentMode = presentingViewController is UINavigationController
        
        if isPresentingInAddStudentMode {
            dismiss(animated: true, completion: nil)
        }
        else if let owningNavigationController = navigationController{
            owningNavigationController.popViewController(animated: true)
        }
        else {
            fatalError("The MealViewController is not inside a navigation controller.")
        }
    }
    
  
}
