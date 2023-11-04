//
//  CategoryProductsVC.swift
//  lesson-54-Nectar
//
//  Created by JAHONGIR on 27/10/23.
//

import UIKit
import Alamofire
import CoreData

class CategoryProductsVC: UIViewController {
    
    @IBOutlet weak var dismissBtn: UIButton!
    
    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var filterBtn: UIButton!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var modelProduct: [ProductModel] = []
        
    var idCategory: Int = 0

    let managedContext = appDelegate.persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupCollectionView()
        getProducts()
    }

    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "ShopCollectionCell", bundle: nil), forCellWithReuseIdentifier: "ShopCollectionCell")
    }
    
    func getProducts() {
        
        let vc = ExploreVC(nibName: "ExploreVC", bundle: nil)
            let param: Parameters = [
                "categoryId": idCategory
            ]
            
            AF.request(URL(string: URLS.product + "/")!).responseDecodable(of: [ProductModel].self) { [self] response in
                switch response.result {
                case .success(let data):
                    modelProduct = data
                    print(modelProduct, "DATA")
                    collectionView.reloadData()
                    
                case .failure(let error):
                    print(error, "ERROR")
                }
            }
        
    }
    
    func saveData() {
        let userEntity = NSEntityDescription.entity(forEntityName: "CardModel", in: managedContext)!
        
        let user = NSManagedObject(entity: userEntity, insertInto: managedContext)
        
        user.setValue(modelProduct.first?.title, forKey: "title")
        user.setValue(modelProduct.first?.price, forKey: "finalPrice")
        user.setValue(modelProduct.first?.description, forKey: "desc")
        user.setValue(modelProduct.first?.images![0], forKey: "imgUrl")
        
        do {
            try managedContext.save()
        }catch let error as NSError {
            printContent("Could not save, \(error.userInfo)")
        }
        getData()
    }
    
    func getData() {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CardModel")
        
        do {
            let saveInfo = try managedContext.fetch(fetchRequest) as! CardModel
            print(saveInfo.desc)
            print(saveInfo.imgUrl)
            print(saveInfo.title)
            let vc = CartVC(nibName: "CartVC", bundle: nil)
            vc.modelCart = saveInfo
        } catch let error as NSError {
            print("could not fetch. \(error)")
        }

    }
    
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true)
    }
    
}

extension CategoryProductsVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        saveData()
    }
}
