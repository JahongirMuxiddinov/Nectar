//
//  ExploreVC.swift
//  lesson-54-Nectar
//
//  Created by JAHONGIR on 20/10/23.
//

import UIKit
import Alamofire

class ExploreVC: UIViewController {
    
    
    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var modelCategory: [CategoryModel] = []
    var modelProduct: [ProductModel] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        searchBar.searchTextField.addGestureRecognizer(tap)
        setupUI()
        getCategory()
        setupCollectionView()
    }

    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
       let vc = SearchVC(nibName: "SearchVC", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }

    func setupUI() {
        self.navigationItem.title = nil
    }
    
    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "ExploreCollectionCell", bundle: nil), forCellWithReuseIdentifier: "ExploreCollectionCell")
    }
    
    func getCategory() {
        AF.request(URL(string: URLS.categories)!).responseDecodable(of: [CategoryModel].self) { response in
            switch response.result {
            case .success(let data):
                
                self.modelCategory = data
                print(self.modelCategory, "DATA")
                self.collectionView.reloadData()
                
            case .failure(let error):
                print(error, "ERROR")
            }
        }
    }

}

extension ExploreVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        modelCategory.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ExploreCollectionCell", for: indexPath) as! ExploreCollectionCell
        
        cell.updateCell(modelCategory[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let vc = CategoryProductsVC(nibName: "CategoryProductsVC", bundle: nil)
        vc.idCategory = modelCategory[indexPath.row].id ?? 0
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width * 0.4, height: 180)
    }
}
