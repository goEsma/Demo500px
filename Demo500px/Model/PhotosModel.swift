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
        var photos: [Photo]
        
        init(photos: [Photo]) {
            self.photos = photos
        }
        
        public init(from decoder: Decoder) throws {
            self.photos = try [Photo](from: decoder)
        }
    }
    
    struct ViewModel {
        let photos: [PhotoViewModel]?
        
        struct PhotoViewModel {
            var imagePath: String
        }
    }
}
