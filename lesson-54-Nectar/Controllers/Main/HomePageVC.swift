//
//  HomePageVC.swift
//  lesson-54-Nectar
//
//  Created by JAHONGIR on 20/10/23.
//

import UIKit
import Alamofire

class HomePageVC: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var homeLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var modelCategory: [CategoryModel] = []
    var modelProduct: [ProductModel] = []
    
    var Id: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = nil
        homeLabel.textColor = UIColor(hexString: "#4C4F4D")
        setupTableView()
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        searchBar.addGestureRecognizer(tap)
        
//        getCategory()
//        getProductForCategory()
        
    }
    
    func getCategory() {

        AF.request(URL(string: URLS.categories)!).responseDecodable(of: [CategoryModel].self) { response in
            switch response.result {
            case .success(let data):
                
                self.modelCategory.append(contentsOf: data)
//                print(self.modelCategory, "DATA")
                
            case .failure(let error):
                print(error, "ERROR")
            }
        }
    }
        func getProductForCategory() {
            let param: Parameters = [
                "categoryId" : Id
            ]
            AF.request(URL(string: URLS.product + "/")!, parameters: param).responseDecodable(of: [ProductModel].self) { response in
                switch response.result {
                case .success(let data):
                    self.modelProduct.append(contentsOf: data)
                    print(self.modelProduct)
                    self.tableView.reloadData()
                case .failure(let error):
                    print(error, "ERROR")
                }
            }
        }
        
    
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "ShopTableCell", bundle: nil), forCellReuseIdentifier: "ShopTableCell")
        tableView.register(UINib(nibName: "HomeAdvertiseTableCell", bundle: nil), forCellReuseIdentifier: "HomeAdvertiseTableCell")
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        let explore = ExploreVC(nibName: "ExploreVC", bundle: nil)
        self.navigationController?.pushViewController(explore, animated: true)
    }
    
}

extension HomePageVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
           return 1
        } else {
            return 1
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        6
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeAdvertiseTableCell", for: indexPath) as! HomeAdvertiseTableCell
            cell.selectionStyle = .none
            
//            self.tableView.reloadData()
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ShopTableCell", for: indexPath) as! ShopTableCell
            cell.selectionStyle = .none
            
//            cell.updateCell(productModel[indexPath.section])
            
            
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            150
        } else {
         300
        }
    }
    
    
}
