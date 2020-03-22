//
//  Photo.swift
//  Demo500px
//
//  Created by EsmaGO on 3/21/20.
//  Copyright © 2020 EsmaGO. All rights reserved.
//

import Foundation

struct Photo: Decodable {
    var id: Int
    var name: String
    var width: Int
    var height: Int
    var format: String
    var imagePath: [String]
    var location: String?
    var user: User
    
    private enum CodingKeys: String, CodingKey {
        case id, name, width, height, location, user
        case format = "image_format"
        case imagePath = "image_url"
    }
}
