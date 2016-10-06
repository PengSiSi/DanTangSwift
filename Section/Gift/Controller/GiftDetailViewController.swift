//
//  GiftDetailViewController.swift
//  DanTangSwift
//
//  Created by 思 彭 on 16/10/6.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit

class GiftDetailViewController: BaseViewController, GiftDetailToolbarViewDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.lightGray
        title = "商品详情"
        setNavAndBottom()
        createBottomView()
    }
    
    // 懒加载创建底部视图
    lazy var bottomView: GiftDetailToolbarView = {
        
        let giftDetailBottomView: GiftDetailToolbarView = Bundle.main.loadNibNamed("GiftDetailToolbarView", owner: nil, options: nil)?.last as! GiftDetailToolbarView
        giftDetailBottomView.delegate = self
        return giftDetailBottomView
    }()
}

extension GiftDetailViewController {
    
    func setNavAndBottom() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "GiftShare_icon_18x22_"), style: .plain, target: self, action: #selector(shareClick))
    }
    
    func shareClick() {
       
        ShareActionSheetView.show()
    }
    
    func createBottomView() {
        
       view.addSubview(bottomView)
        bottomView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(self.view)
            make.top.equalTo(self.view.snp.bottom).offset(-44)
            make.height.equalTo(44)
            make.width.equalTo(SCREENW)
        }
    }
}

extension GiftDetailViewController {
    
    func didClickLikeButton() {
        
    }
    
    func didClickGoTianMaoBuy() {
        
    }
}
