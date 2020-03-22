//
//  PopularPhotosInteractor.swift
//  Demo500px
//
//  Created by EsmaGO on 3/22/20.
//  Copyright © 2020 EsmaGO. All rights reserved.
//

import Foundation

protocol PopularPhotosBusinessLogic {
    func getPopularPhotos()
}

protocol PopularPhotosDataStore {
    /// To be sent to the next scene.
    var selectedPhoto: Photo? { get }
}

final class PopularPhotosInteractor: PopularPhotosBusinessLogic, PopularPhotosDataStore {
    var selectedPhoto: Photo?
    var presenter: PopularPhotosPresentationLogic?

    func getPopularPhotos() {
        DataServer().getPopularPhotos(request: PhotosModel.Request()) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let photosModel):
                self.presenter?.present(photos: photosModel)
            case .failure(let error):
                print(error)
            }
        }
    }
}
