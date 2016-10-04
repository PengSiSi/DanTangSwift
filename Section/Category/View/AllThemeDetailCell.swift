//
//  AllThemeDetailCell.swift
//  
//
//  Created by 思 彭 on 16/10/4.
//
//

import UIKit

protocol AllThemeDetailCellDelegate {
    
    func didLikeButtonClick()
    
}

class AllThemeDetailCell: UITableViewCell {

    
    // 喜欢按钮被点击
    @IBAction func likeButtonClick(_ sender: UIButton) {
        
        sender.isSelected = !sender.isSelected
        if delegate != nil {
            delegate?.didLikeButtonClick()
        }
    }
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bgImgView: UIImageView!
    
    var delegate: AllThemeDetailCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        likeButton.layer.cornerRadius = 6
        likeButton.layer.masksToBounds = true
    }
}
