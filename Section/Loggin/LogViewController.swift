//
//  LogViewController.swift
//  DanTangSwift
//
//  Created by 思 彭 on 16/10/2.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit

class LogViewController: BaseViewController {

    let passwordTF = UITextField()
    let logButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "登录"
        setNav()
        setTextField()
        createLogButton()
        otherLogin()
    }
}

extension LogViewController {
    
    func setNav() {
        let leftItem = UIBarButtonItem.init(title: "取消", target: self, action: #selector(cancleClick))
        let rightItem = UIBarButtonItem.init(title: "注册", target: self, action: #selector(registerClick))
        self.navigationItem.leftBarButtonItem = leftItem
        self.navigationItem.rightBarButtonItem = rightItem
    }
    
    func setTextField() {
        
        // 手机号
        let phoneTF = UITextField()
        view.addSubview(phoneTF)
        phoneTF.backgroundColor = UIColor.white
        phoneTF.frame = CGRect(x: 0, y: 84, width: SCREENW, height: 44)
        phoneTF.placeholder = "   手机号"
        
        // 中间线
        let lineView = UIView()
        view.addSubview(lineView)
        lineView.backgroundColor = UIColor.lightGray
        lineView.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.top.equalTo(phoneTF.snp.bottom)
            make.height.equalTo(0.5)
            make.right.equalTo(self.view).offset(-10)
        }
        
        // 密码
        
        view.addSubview(passwordTF)
        passwordTF.backgroundColor = UIColor.white
        passwordTF.placeholder = "   密码"
        passwordTF.snp.makeConstraints { (make) in
            make.top.equalTo(lineView.snp.bottom)
            make.left.right.equalTo(phoneTF)
            make.height.equalTo(phoneTF)
        }
    }
}

extension LogViewController {
    
    func createLogButton() {
        
        
        logButton.setTitle("登录", for: .normal)
        logButton.setTitleColor(UIColor.white, for: .normal)
        logButton.backgroundColor = GlobalRedColor()
        logButton.addTarget(self, action: #selector(logButtonClick), for: .touchUpInside)
        view.addSubview(logButton)
        logButton.layer.cornerRadius = 5
        logButton.layer.masksToBounds = true
        logButton.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.top.equalTo(passwordTF.snp.bottom).offset(30)
            make.height.equalTo(40)
        }
    }
}

extension LogViewController {
    
    func otherLogin() {
        
        let leftView = UIView()
        leftView.backgroundColor = UIColor.lightGray
        view.addSubview(leftView)
        let rightView = UIView()
        rightView.backgroundColor = UIColor.lightGray
        view.addSubview(rightView)
        let label = UILabel()
        label.text = "使用社交账号登录"
        label.textColor = UIColor.lightGray
        label.font = UIFont.systemFont(ofSize: 13)
        label.textAlignment = .center
        view.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.height.equalTo(50)
            make.top.equalTo(logButton.snp.bottom).offset(28)
            make.left.equalTo(leftView.snp.right).offset(10)
            //            make.width.equalTo(180)
        }
        leftView.snp.makeConstraints { (make) in
            make.height.equalTo(0.5)
            make.top.equalTo(logButton.snp.bottom).offset(50)
//            make.centerY.equalTo(label)
            make.left.equalTo(logButton)
            make.width.equalTo(80)
        }
        rightView.snp.makeConstraints { (make) in
            make.height.width.equalTo(leftView)
            make.top.equalTo(logButton.snp.bottom).offset(50)
            make.left.equalTo(label.snp.right).offset(10)
            make.top.equalTo(logButton.snp.bottom).offset(50)
//            make.centerY.equalTo(label)
        }
    }
    
    // 三个图标
//    func thirdLog() {
//        
//        let width = SCREENW / 3.0
//        let height = 60
//        for i in 0..< 3 {
//            let button = UIButton()
//        }
//    }
}

extension LogViewController {
    
    func cancleClick() {
        
    }
    
    func registerClick() {
        
    }
    
    func logButtonClick() {
        
    }
}
