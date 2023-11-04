//
//  HomeAdvertiseTableCell.swift
//  lesson-54-Nectar
//
//  Created by JAHONGIR on 27/10/23.
//

import UIKit

class HomeAdvertiseTableCell: UITableViewCell {
    
    @IBOutlet weak var imgView: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
     animation()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    func animation() {
        let images = [UIImage(named: "advert1"), UIImage(named: "advert2"), UIImage(named: "advert3")].compactMap{$0} // ignore nil image
                imgView.animationImages = images
                imgView.animationDuration = 5
                imgView.startAnimating()
    }
    
}
