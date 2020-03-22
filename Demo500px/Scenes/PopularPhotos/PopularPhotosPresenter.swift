//
//  PopularPhotosPresenter.swift
//  Demo500px
//
//  Created by EsmaGO on 3/22/20.
//  Copyright © 2020 EsmaGO. All rights reserved.
//

import Foundation

protocol PopularPhotosPresentationLogic {
    func present(photos: PhotosModel.Response)
}

final class PopularPhotosPresenter: PopularPhotosPresentationLogic {
    
    weak var viewController: PopularPhotosDisplayLogic?
    
    func present(photos: PhotosModel.Response) {
        viewController?.displayPhotos(photos.getViewModel().photos ?? [])
    }
}
