//
//  Service.swift
//  basic_iOS
//
//  Created by Ayrus Aszer on 10/4/17.
//  Copyright © 2017 Resza. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

struct Service {
    static func getPost (onSuccess : @escaping (_ data: [post]) -> Void, onFailure: @escaping (_ error: Error) -> Void) {
        
        let urlApi = "http://jsonplaceholder.typicode.com/posts"
        
        Alamofire.request(urlApi,method: .get, encoding: JSONEncoding.default).responseJSON { response in
            
            switch response.result {
                
            case .success:
                let resp = response.result.value
                let mapping = Mapper<post>().mapArray(JSONArray : resp as! [[String : Any]])
                onSuccess((mapping))
            case .failure(let error):
                onFailure(error)
            }
            
        }
    }
}
