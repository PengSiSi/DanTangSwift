//
//  AllThemeDetailCell.swift
//  
//
//  Created by 思 彭 on 16/10/4.
//
//

import UIKit

class AllThemeDetailCell: UITableViewCell {

    
    @IBAction func likeButtonClick(_ sender: AnyObject) {
        
    }
    
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bgImgView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        likeButton.layer.cornerRadius = 6
        likeButton.layer.masksToBounds = true
    }
}
