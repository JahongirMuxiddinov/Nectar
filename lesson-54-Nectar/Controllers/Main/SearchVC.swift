//
//  SearchVC.swift
//  lesson-54-Nectar
//
//  Created by JAHONGIR on 26/10/23.
//

import UIKit
import Alamofire

class SearchVC: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var filterBtn: UIButton!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var modelProduct: [ProductModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        searchBar.becomeFirstResponder()
        searchBar.isFirstResponder
        initializeHideKeyboard()
        setupCollectionView()
        
    }
    
    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "ShopCollectionCell", bundle: nil), forCellWithReuseIdentifier: "ShopCollectionCell")
    }
    
    func setupSearchBar(text: String) {
        searchBar.delegate = self
        
        let param: Parameters = [
            "title" : text
        ]
        
        AF.request(URL(string: URLS.product + "/")!, parameters: param).responseDecodable(of: [ProductModel].self) { [self] response in
            switch response.result {
            case .success(let data):
                modelProduct = data
                collectionView.reloadData()
                
            case .failure(let error):
                print(error, "ERROR")
            }
        }
    }
    
    @IBAction func filterBtnPressed(_ sender: Any) {
    }
    
    
}

extension SearchVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        modelProduct.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShopCollectionCell", for: indexPath) as! ShopCollectionCell
        
        cell.updateCollectionCell(modelProduct[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 20, bottom: 5, right: 20)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width * 0.42, height: 180)
    }
}

extension SearchVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count >= 1 {
            setupSearchBar(text: searchText)
        }
        if searchText.count == 0 {
            modelProduct.removeAll()
            collectionView.reloadData()
        }
    }
}
extension SearchVC {
    func initializeHideKeyboard(){
       let tap: UITapGestureRecognizer = UITapGestureRecognizer(
           target: self,
           action: #selector(dismissMyKeyboard))
       
       collectionView.addGestureRecognizer(tap)
   }
   
   @objc func dismissMyKeyboard(){
       
       print("initializeHideKeyboard")
       view.endEditing(true)
   }
}
