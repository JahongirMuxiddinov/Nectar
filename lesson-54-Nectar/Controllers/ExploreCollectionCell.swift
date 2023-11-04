//
//  ExploreCollectionCell.swift
//  lesson-54-Nectar
//
//  Created by JAHONGIR on 25/10/23.
//

import UIKit
import SDWebImage

class ExploreCollectionCell: UICollectionViewCell {
    
    
    @IBOutlet weak var imgView: UIImageView!
    
    
    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    func updateCell(_ model: CategoryModel) {
        titleLbl.text = model.name
        imgView.sd_setImage(with: URL(string: model.image!))
    }
    
    func setupUI() {
        containerView.clipsToBounds = true
        containerView.layer.borderColor = UIColor.black.cgColor
        containerView.layer.borderWidth = 1
        containerView.layer.cornerRadius = 10
        imgView.layer.cornerRadius = 10
    }

}
