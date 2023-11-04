//
//  ShopCollectionCell.swift
//  lesson-54-Nectar
//
//  Created by JAHONGIR on 23/10/23.
//

import UIKit
import SDWebImage

class ShopCollectionCell: UICollectionViewCell {
    
    
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var descriptionLbl: UILabel!
    
    @IBOutlet weak var priceLbl: UILabel!
    
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupBoder()
    }

    func setupBoder() {
        containerView.clipsToBounds = true
        containerView.backgroundColor = .clear
        containerView.layer.borderColor = UIColor.black.cgColor
        containerView.layer.borderWidth = 1
        containerView.layer.cornerRadius = 10
        imgView.layer.cornerRadius = 10
    }
    
    func updateCollectionCell(_ model: ProductModel) {

        var images = model.images![0]
        nameLbl.text = model.title
        descriptionLbl.text = model.description
        priceLbl.text =  "$" + "\(String(describing: model.price))"
        imgView.sd_setImage(with: URL(string: images))
        
    }
}
