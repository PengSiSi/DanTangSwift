//
//  GiftDetailViewController.swift
//  DanTangSwift
//
//  Created by 思 彭 on 16/10/6.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit

class GiftDetailViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "商品详情"
        setNavAndBottom()
    }
}

extension GiftDetailViewController {
    
    func setNavAndBottom() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "GiftShare_icon_18x22_"), style: .plain, target: self, action: #selector(shareClick))
    }
    
    func shareClick() {
       
        ShareActionSheetView.show()
    }
}
