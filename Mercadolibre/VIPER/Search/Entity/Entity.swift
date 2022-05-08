//
//  Entity.swift
//  Mercadolibre
//
//  Created by Asesoftware on 8/05/22.
//

import Foundation

struct DataItemsModel: Codable {
    
    var id:String
    var title:String
    var thumbnail:String
    var permalink:String
    
    enum CodingKeys: String, CodingKey {
        
        case id
        case title
        case thumbnail
        case permalink
        
    }
    
}

// MARK: - ApiResult
struct ApiResult {
    let results: Any?
    let country_default_time_zone: String
    let site_id: String

    init(json: [String:Any]){
        results = json["results"]
        country_default_time_zone = json["country_default_time_zone"] as? String ?? ""
        site_id = json["site_id"] as? String ?? ""
    }
    
}
