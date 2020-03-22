//
//  PhotosModel.swift
//  Demo500px
//
//  Created by EsmaGO on 3/21/20.
//  Copyright © 2020 EsmaGO. All rights reserved.
//

import Foundation

struct PhotosModel {
    
    struct Request: DictionaryRepresentation {
        var dictionaryRepresentation: [String : Any] {
            return [:]
        }
    }
    
    struct Response: Decodable {
        enum RootCodingKeys: String, CodingKey {
            case photos
        }
        var photos: [Photo]
        
        init(photos: [Photo]) {
            self.photos = photos
        }
        
        public init(from decoder: Decoder) throws {
            let rootContainer = try decoder.container(keyedBy: RootCodingKeys.self)
            self.photos = try rootContainer.decode([Photo].self, forKey: .photos)
        }
    }
    
    struct ViewModel {
        let photos: [PhotoViewModel]?
        
        struct PhotoViewModel {
            var imagePath: String
        }
    }
}
