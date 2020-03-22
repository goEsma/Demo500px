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
            var width: Int
            var height: Int
            var location: String
            var imageName: String
            var userFullName: String
            var userImagePath: String
        }
    }
}


extension PhotosModel.Response {
    func getViewModel() -> PhotosModel.ViewModel {
        var viewModels: [PhotosModel.ViewModel.PhotoViewModel] = []
        photos.forEach { photo in
            let photoVM = PhotosModel.ViewModel.PhotoViewModel(imagePath: photo.imagePath[0], width: photo.width, height: photo.height, location: photo.location ?? "Unknown location", imageName: photo.name, userFullName: photo.user.fullName, userImagePath: photo.user.imagePath)
            viewModels.append(photoVM)
        }
        return PhotosModel.ViewModel(photos: viewModels)
    }
}
