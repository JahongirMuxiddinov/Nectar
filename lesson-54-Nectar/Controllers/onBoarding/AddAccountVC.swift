//
//  AddAccountVC.swift
//  lesson-54-Nectar
//
//  Created by JAHONGIR on 23/07/23.
//

import UIKit
import PhoneNumberKit

class AddAccountVC: UIViewController {
    
    @IBOutlet weak var googleBtn: UIButton!
    
    @IBOutlet weak var facebookBtn: UIButton!
    
    @IBOutlet weak var connectlbl: UILabel!
    
    @IBOutlet weak var nectarLbl: UILabel!
    
    @IBOutlet weak var phoneNumberField: PhoneNumberTextField!
    
    @IBOutlet weak var nextBtn: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextBtn.clipsToBounds = true
        nextBtn.layer.cornerRadius = nextBtn.frame.height/2
        setupButton()
        phoneNumberField.delegate = self
        setupPhoneNumberKit()
        
    }


    func setupButton() {
        googleBtn.clipsToBounds = true
        googleBtn.backgroundColor = UIColor(hexString: "#5383EC")
        googleBtn.layer.cornerRadius = 19
        facebookBtn.backgroundColor = UIColor(hexString: "#4A66AC")
        facebookBtn.layer.cornerRadius = 19
        connectlbl.textColor = UIColor(hexString: "#828282")
        nectarLbl.textColor = UIColor(hexString: "#030303")
        
        
            nextBtn.backgroundColor = .systemGreen
            nextBtn.isEnabled = true
            
        
    }
    
    func setupPhoneNumberKit() {
        
        phoneNumberField.withFlag = true
        phoneNumberField.withPrefix = true
        phoneNumberField.withExamplePlaceholder = true
        phoneNumberField.withDefaultPickerUI = true
        phoneNumberField.defaultRegion = "UZB"
    }
    
    @IBAction func nextBtnPressed(_ sender: Any) {
       
      
            let vc = OtpVC(nibName: "OtpVC", bundle: nil)
            navigationController?.pushViewController(vc, animated: true)
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
        
        
    }
    

}

extension AddAccountVC: UITextFieldDelegate {
    override func accessibilityElementCount() -> Int {
        17
    }
}
