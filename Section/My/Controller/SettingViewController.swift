//
//  SettingViewController.swift
//  DanTangSwift
//
//  Created by 思 彭 on 16/10/2.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import UIKit
import ObjectMapper

class SettingViewController: BaseViewController ,UITableViewDelegate,UITableViewDataSource{

    var tableView: UITableView?
    // 数据原数组
    var dataArray = [AnyObject]()
    let cellId = "SettingCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "更多"
        createTableView()
        loadData()
    }
    
    // 组数
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return dataArray.count 
    }
    
    // 行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let array = dataArray[section]
        return (array as AnyObject).count
    }
    
    // cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! SettingCell
        let setting = dataArray[indexPath.section] as! [SettingModel]
        cell.settingModel = setting[indexPath.row]
        return cell
    }
    // 头视图的高度
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 10.0
    }
    
    // 取消选中
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension SettingViewController {
    
    // 加载数据
    func loadData() {
      let path = Bundle.main.path(forResource: "SettingCell", ofType: "plist")
      let settingsPlist = NSArray.init(contentsOfFile: path!)
      print(settingsPlist!)
      for arrayDict in settingsPlist! {
        let array = arrayDict as! NSArray
        var sections = [AnyObject]()
        for dict in array {
            let settingModel = SettingModel(dict: dict as! [String: AnyObject])
            // model存到数组
            sections.append(settingModel)
        }
        // 数组存到数据源数组
        dataArray.append(sections as AnyObject)
        }
        tableView?.reloadData()
    }
}

// MARK: - 设置界面
extension SettingViewController {
    
    func createTableView() {
        
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.tableFooterView = UIView()
        view.addSubview(tableView!)
        // 注册cell
        tableView?.register(UINib.init(nibName: "SettingCell", bundle: nil), forCellReuseIdentifier: cellId)
    }
}

