//
//  LocationVC.swift
//  lesson-54-Nectar
//
//  Created by JAHONGIR on 28/07/23.
//

import UIKit
import CountryPickerView

class LocationVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet weak var submitBtn: UIButton!
    
    
    @IBOutlet weak var textField1: UITextField!
    
    @IBOutlet weak var textField: UITextField!
    let pickerView = UIPickerView()
    let toolbar = UIToolbar()
    let data = ["Option 1", "Option 2", "Option 3"]
    let data1 = ["sdfgsdcds", "Option 2", "Option 3"]
    
    
    var isSecond = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubmitBtn()
    
        textField.delegate = self
        textField1.delegate = self
        
        pickerView.delegate = self
        pickerView.dataSource = self
        textField.inputView = pickerView
        textField1.inputView = pickerView
        
        textField1.tag = 1
        
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .done, target: self, action: #selector(cancelButtonTapped))
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonTapped))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbar.setItems([spaceButton, doneButton, cancelButton], animated: false)
        toolbar.sizeToFit()
        
        textField.inputAccessoryView = toolbar
        textField1.inputAccessoryView = toolbar
        
    }
    
    func setupSubmitBtn() {
        submitBtn.clipsToBounds = true
        submitBtn.backgroundColor = (UIColor(hexString: "#53B175"))
        submitBtn.layer.cornerRadius = 19
    }
    
    
    
    @IBAction func submitBtnPressed(_ sender: Any) {
        let vc = LogingVC(nibName: "LogingVC", bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
}

extension LocationVC: UITextFieldDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1 // If you want multiple components in the UIPickerView, change this value.
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return isSecond ? data1.count : data.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return isSecond ? data1[row] : data[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if isSecond  {
            textField1.text = data1[row]
        }else {
            textField.text = data[row]
        }
        
        pickerView.reloadAllComponents()
    }
    @objc func doneButtonTapped() {
        pickerView.reloadAllComponents()
        textField.resignFirstResponder()
        textField1.resignFirstResponder()
    }
    
    @objc func cancelButtonTapped() {
        textField.resignFirstResponder()
        textField1.resignFirstResponder()
    }
    
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        isSecond = textField.tag == 1
        return true
    }
    
}
