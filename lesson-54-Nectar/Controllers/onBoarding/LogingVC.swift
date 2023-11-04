//
//  LogingVC.swift
//  lesson-54-Nectar
//
//  Created by JAHONGIR on 28/07/23.
//

import UIKit

class LogingVC: UIViewController {
    
    
    @IBOutlet weak var eyeBtn: UIButton!
    var koz = true
    
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var loginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupLoginBtn()
        
    }
    
    func setupLoginBtn() {
        loginBtn.clipsToBounds = true
        loginBtn.layer.cornerRadius = 19
//        loginBtn.backgroundColor = UIColor(hexString: "#FFF9FF")
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
    
    
    @IBAction func signupBtnPressed(_ sender: Any) {
        
        let vc = SignUpVC(nibName: "SignUpVC", bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
}
