//
//  ShopTableCell.swift
//  lesson-54-Nectar
//
//  Created by JAHONGIR on 23/10/23.
//

import UIKit

class ShopTableCell: UITableViewCell {
    
    
    @IBOutlet weak var colletionView: UICollectionView!
    
    
    @IBOutlet weak var sectionTitleLbl: UILabel!
    
    @IBOutlet weak var containerView: UIView!
        
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        containerView.backgroundColor = .green
        setupCollectionView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    func setupCollectionView() {
        colletionView.delegate = self
        colletionView.dataSource = self
        
        colletionView.register(UINib(nibName: "ShopCollectionCell", bundle: nil), forCellWithReuseIdentifier: "ShopCollectionCell")
    }
    
    func updateCell(title: String, countRow: Int, img: [String], titleCell: String, description: String, price: String) {
        sectionTitleLbl.text = title

        colletionView.reloadData()
    }
}

extension ShopTableCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShopCollectionCell", for: indexPath) as! ShopCollectionCell
        
        collectionView.reloadData()
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width * 0.4, height: 180)
    }
}
