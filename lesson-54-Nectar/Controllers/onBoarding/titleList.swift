//
//  titleList.swift
//  lesson-54-Nectar
//
//  Created by JAHONGIR on 21/07/23.
//

import UIKit

class titleList: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = UIColor(hexString: "#53B175")
//        lbl.textColor = UIColor(hexString: "#53B175")
        
        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { _ in
            let vc = WelcomeVC(nibName: "WelcomeVC", bundle: nil)
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
        
       
    }
   
 
}
