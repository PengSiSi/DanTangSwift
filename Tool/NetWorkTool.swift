
//
//  NetWorkTool.swift
//  DanTangSwift
//
//  Created by 思 彭 on 16/10/4.
//  Copyright © 2016年 思 彭. All rights reserved.
//

import Foundation
import Alamofire
import SVProgressHUD
import SwiftyJSON
import ObjectMapper

class NetWorkTool: NSObject {
    
    // 单例
    static let shareNetWorkTool = NetWorkTool()
    
    // 获取首页顶部选择数据
    func loadHomeTopData(finished:@escaping (_ channels: [ChannelModel]) -> ()) {

        let url = "http://api.dantangapp.com/v2/channels/preset"
        let params = ["gender": 1,
                      "generation": 1]
        Alamofire.request(url, method: .get, parameters: params, encoding:
            URLEncoding.httpBody, headers: nil).responseJSON { (response) in
                print("response----\(response.result.value)")
                guard response.result.isSuccess else {
                    
                    SVProgressHUD.showError(withStatus: "加载失败")
                    return
                }
                if let value = response.result.value {
                    
                    let dic = JSON(value)
                    let code = dic["code"].intValue
//                    let message = dic["message"].stringValue
                    guard code == RETURN_OK else {
                        SVProgressHUD.showError(withStatus: "加载失败")
                        return
                    }
                    // 到这里数据加载成功
                    SVProgressHUD.dismiss()
                    // json转model
                    let data = dic["data"].dictionary
                    var channelsArray = [ChannelModel]()
                    if let channels: [[String: AnyObject]] = data?["candidates"]?.arrayObject as! [[String : AnyObject]]? {
                        for channel in channels {
                            let model = ChannelModel(dict: channel)
                            channelsArray.append(model)
                        }
                    }
                    finished(channelsArray)
                }
         }
    }
    
    // 获取首页数据
    func loadHomeInfo(id: Int, finished:@escaping (_ homeItems: [HomeListModel]) -> ()) {
        let url = BASE_URL + "v1/channels/\(id)/items"
        let params = ["gender": 1,
                      "generation": 1,
                      "limit": 20,
                      "offset": 0]
        Alamofire.request(url, method: .get, parameters: params, encoding: URLEncoding.httpBody).responseJSON { (response) in
            guard response.result.isSuccess else {
                SVProgressHUD.showError(withStatus: "加载失败")
                return
            }
            if let value = response.result.value {
                
                let dic = JSON(value)
                let code = dic["code"].intValue
                guard code == RETURN_OK else {
                    
                    SVProgressHUD.showInfo(withStatus: "加载失败")
                    return
                }
                // 一定有值
                let data = dic["data"].dictionary
                // 字典转模型
                if let items: [[String: AnyObject]] = data?["items"]?.arrayObject as! [[String : AnyObject]]? {
                var homeArray = [HomeListModel]()
                    for item in items {
                        
                        let model = HomeListModel(dict: item)
                        homeArray.append(model)
                    }
                    finished(homeArray)
                }
            }
        }
    }
    
    //  获取"单品"界面列表数据  闭包传递数据源  参数要加_
    func loadGiftListData(completion: @escaping (_ giftModels: [GiftModel]) -> ()) {
        let url = BASE_URL + "v2/items"
        let params = ["gender": 1,
                      "generation": 1,
                      "limit": 20,
                      "offset": 0]
        Alamofire.request("http://api.dantangapp.com/v2/items?gender=1&generation=1&limit=20&offset=0", parameters: nil, encoding: URLEncoding.httpBody).responseJSON { (response) in
            
            print("response----\(response.result.value)")
//            guard response.result.isSuccess else {
//                SVProgressHUD.showError(withStatus: "加载失败")
//            }
            // 解析数据
            if let value = response.result.value {
                
                let dic = JSON(value)
                let code = dic["code"].intValue
                guard code == RETURN_OK else {
                    SVProgressHUD.showInfo(withStatus: "加载失败")
                    return
                }
                SVProgressHUD.dismiss()
                let data = dic["data"].dictionary
                if let items: [[String: AnyObject]] = data?["items"]?.arrayObject as! [[String : AnyObject]]? {
                    var gifts = [GiftModel]()
                    for item  in items {
                        if let dataDic = item["data"] {
                            let gift = GiftModel.init(dict: dataDic as! [String: Any] as [String : AnyObject])
                            gifts.append(gift)
                        }
                    }
                    completion(gifts)
                }
            }
        }
    }
}
