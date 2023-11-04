//
//  CartVC.swift
//  lesson-54-Nectar
//
//  Created by JAHONGIR on 20/10/23.
//

import UIKit
import CoreData

class CartVC: UIViewController {
    
    var modelCart: CardModel?

    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBOutlet weak var checkoutBtn: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupTableView()
    }
    
    func setupUI() {
        self.navigationItem.title = nil
        checkoutBtn.clipsToBounds = true
        checkoutBtn.layer.cornerRadius = 10

    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "CartTableCell", bundle: nil), forCellReuseIdentifier: "CartTableCell")
    }
    
    @IBAction func checkoutBtnPressed(_ sender: Any) {
    }
    

}

extension CartVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        modelCart?.accessibilityElementCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartTableCell", for: indexPath) as! CartTableCell
        cell.selectionStyle = .none
        cell.updateCell(model: modelCart!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
    
}
