//
//  CartTableCell.swift
//  lesson-54-Nectar
//
//  Created by JAHONGIR on 29/10/23.
//

import UIKit
import SDWebImage

class CartTableCell: UITableViewCell {
    
    
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var descLbl: UILabel!
    
    @IBOutlet weak var xBtn: UIButton!
    
    @IBOutlet weak var priceLbl: UILabel!
    
    @IBOutlet weak var pieceLbl: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    @IBAction func minusOneBtnPressed(_ sender: Any) {
    }
    
    
    @IBAction func plusOneBtnPressed(_ sender: Any) {
    }
    
    
    @IBAction func xBtnPressed(_ sender: Any) {
    }
    
    func updateCell(model: CardModel) {
        titleLbl.text = model.title
        descLbl.text = model.description
        imgView.sd_setImage(with: URL(string: model.imgUrl))
    }
    
}
