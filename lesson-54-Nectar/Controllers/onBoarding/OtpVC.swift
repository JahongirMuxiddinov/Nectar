//
//  OtpVC.swift
//  lesson-54-Nectar
//
//  Created by JAHONGIR on 28/07/23.
//

import UIKit
import OTPFieldView
//import OTPFieldView

class OtpVC: UIViewController {
    
    
    
    @IBOutlet weak var otpFieldView: OTPFieldView!
    
    
    @IBOutlet weak var nextBtn: UIButton!
    
    @IBOutlet weak var backBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextBtn.clipsToBounds = true
        nextBtn.layer.cornerRadius = nextBtn.frame.height/2
        setupOTPFieldView()
        nextBtn.isEnabled = false
        nextBtn.backgroundColor = .systemGray3
        
    }
    
    func setupOTPFieldView() {
        self.otpFieldView.fieldsCount = 4
        self.otpFieldView.fieldBorderWidth = 2
        self.otpFieldView.defaultBorderColor = UIColor.black
        self.otpFieldView.filledBorderColor = UIColor.green
        self.otpFieldView.cursorColor = UIColor.red
        self.otpFieldView.displayType = .underlinedBottom
        self.otpFieldView.fieldSize = 40
        self.otpFieldView.separatorSpace = 8
        self.otpFieldView.shouldAllowIntermediateEditing = false
        self.otpFieldView.initializeUI()
        //        otpFieldView.becomeFirstResponder()
        otpFieldView.resignFirstResponder()
        otpFieldView.delegate = self
        
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func nextBtnPressed(_ sender: Any) {
        let vc = LocationVC(nibName: "LocationVC", bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
        
    }
    
    
    
}

extension OtpVC: OTPFieldViewDelegate {
    func shouldBecomeFirstResponderForOTP(otpTextFieldIndex index: Int) -> Bool {
        return true
    }
    
    func enteredOTP(otp: String) {
        print(otp)
            
    }
    
    func hasEnteredAllOTP(hasEnteredAll: Bool) -> Bool {
        if hasEnteredAll == true {
            nextBtn.isEnabled = true
            nextBtn.backgroundColor = .systemGreen
        }
        else {
            nextBtn.isEnabled = false
            nextBtn.backgroundColor = .systemGray3
        }
        
        return true
    }
    
    
    
}
