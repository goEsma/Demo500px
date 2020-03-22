//
//  User.swift
//  Demo500px
//
//  Created by EsmaGO on 3/22/20.
//  Copyright © 2020 EsmaGO. All rights reserved.
//

import Foundation

struct User: Decodable {
    var fullName: String
    var imagePath: String
    
    enum CodingKeys: String, CodingKey {
        case fullName = "fullname"
        case imagePath = "userpic_url"
    }
}
