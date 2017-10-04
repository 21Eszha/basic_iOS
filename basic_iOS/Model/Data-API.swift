//
//  Data-API.swift
//  basic_iOS
//
//  Created by Ayrus Aszer on 10/4/17.
//  Copyright © 2017 Resza. All rights reserved.
//

import Foundation
import ObjectMapper

struct postResponse: Mappable {
    var data: [post]?
    var comments: [post]?
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
    }
    
}

struct post: Mappable {
    var userId : Int?
    var id : Int?
    var title : String?
    var body : String?
    
    init?(map : Map){
        
    }
    
    mutating func mapping(map: Map){
        userId  <- map["userId"]
        id      <- map["id"]
        title   <- map["title"]
        body    <- map["body"]
    }
}
struct comments: Mappable {
    var postId : Int?
    var id : Int?
    var name : String?
    var email : String?
    var body : String?
    
    init?(map : Map){
        
    }
    
    mutating func mapping(map: Map){
        postId  <- map["postId"]
        id      <- map["id"]
        name   <- map["name"]
        email   <- map["email"]
        body    <- map["body"]
    }
}
