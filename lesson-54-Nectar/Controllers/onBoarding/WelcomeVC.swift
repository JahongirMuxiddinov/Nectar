//
//  WelcomeVC.swift
//  lesson-54-Nectar
//
//  Created by JAHONGIR on 21/07/23.
//

import UIKit

class WelcomeVC: UIViewController {
    
    
    @IBOutlet weak var startBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       setupButton()
    }


    func setupButton() {
        startBtn.clipsToBounds = true
        startBtn.layer.cornerRadius = 19
        startBtn.backgroundColor = UIColor(hexString: "#53B175")
    }
    
    
    @IBAction func StartBtnPressed(_ sender: Any) {
        
        let vc = AddAccountVC(nibName: "AddAccountVC", bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
}
