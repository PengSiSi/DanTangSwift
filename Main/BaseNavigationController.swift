//
//  BaseNavigationController.swift
//  DanTangSwift
//
//  Created by 思 彭 on 16/10/2.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {

    // 重写 push 方法，隐藏底部的 tabBar
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        //        self.navigationBar.isHidden = true
        // 不是栈底需要隐藏
        if childViewControllers.count > 1 {
            
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: true)
    }
}
