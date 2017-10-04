//
//  PostViewModel.swift
//  basic_iOS
//
//  Created by Ayrus Aszer on 10/5/17.
//  Copyright © 2017 Resza. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

struct PostViewModel{
    //GET POST
     func getPost (onSuccess : @escaping (_ data: [post]) -> Void, onFailure: @escaping (_ error: Error) -> Void) {
        
        let urlApi = APIManager.baseURL
        
        Alamofire.request(urlApi,method: .get, encoding: JSONEncoding.default).responseJSON { response in
            
            switch response.result {
                
            case .success:
                let json = response.result.value
                let jsonMap = Mapper<post>().mapArray(JSONArray : json as! [[String : Any]])
                onSuccess((jsonMap))
            case .failure(let error):
                onFailure(error)
            }
            
        }
    }
    //GET COMMENTS
    func getCommentsPost (idPOST: Int ,onSuccess : @escaping (_ data: [comments]) -> Void, onFailure: @escaping (_ error: Error) -> Void) {
        
        let urlApi = APIManager.baseURL + "/\(idPOST)/comments"
        
        Alamofire.request(urlApi,method: .get, encoding: JSONEncoding.default).responseJSON { response in
            
            switch response.result {
                
            case .success:
                let getJson = response.result.value
                let json = Mapper<comments>().mapArray(JSONArray : getJson as! [[String : Any]])
                onSuccess((json))
            case .failure(let error):
                onFailure(error)
            }
            
        }
    }
}
