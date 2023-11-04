//
//  SignUpVC.swift
//  lesson-54-Nectar
//
//  Created by JAHONGIR on 02/08/23.
//

import UIKit

class SignUpVC: UIViewController {
    
    @IBOutlet weak var usernameTF: UITextField!
    
    @IBOutlet weak var emailTF: UITextField!
    
    @IBOutlet weak var paswordTF: UITextField!
    
    @IBOutlet weak var signupBtn: UIButton!
    
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var eyeBtn: UIButton!
    
    var koz = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    func setupSignUpBtn() {
        signupBtn.clipsToBounds = true
        signupBtn.layer.cornerRadius = 19
        signupBtn.backgroundColor = UIColor(hexString: "#FFF9FF")
    }

    
    @IBAction func eyeBtnPressed(_ sender: Any) {
        
        if koz == true {
            passwordTF.isSecureTextEntry = true
            eyeBtn.setImage(UIImage(systemName: "eye.slash"), for: .normal)
            eyeBtn.tintColor = .black
            koz = false
        }
        else {
            passwordTF.isSecureTextEntry = false
            eyeBtn.setImage(UIImage(systemName: "eye"), for: .normal)
            eyeBtn.tintColor = .brown
            koz = true
        }
    }
    
    
    @IBAction func loginBtnPressed(_ sender: Any) {
        
        dismiss(animated: true)
    }
    
}
