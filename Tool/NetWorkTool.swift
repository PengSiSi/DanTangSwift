
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
    
    // 获取"单品"界面列表数据  闭包传递数据源  参数要加_
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
                if let items = data?["items"]?.arrayObject {
                    var gifts = [GiftModel]()
                    for item in items {
                        let gift = GiftModel.init(dict: item as! [String : AnyObject])

                        gifts.append(gift)
                    }
                    completion(gifts)
                }
            }
        }
    }
}
