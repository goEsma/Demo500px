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
    var width: Int
    var height: Int
    var format: String
    var imagePath: [String]
    var location: String
    
    enum CodingKeys: String, CodingKey {
        case id, width, height, location
        case format = "image_format"
        case imagePath = "image_url"
    }
}
