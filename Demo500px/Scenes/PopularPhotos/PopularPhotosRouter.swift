//
//  PopularPhotosRouter.swift
//  Demo500px
//
//  Created by EsmaGO on 3/22/20.
//  Copyright © 2020 EsmaGO. All rights reserved.
//

import UIKit

protocol PopularPhotosRoutingLogic {
    func showPhotoDetail(_ photoDetail: PhotosModel.ViewModel.PhotoViewModel)
}

protocol PopularPhotosDataPassing {
    var dataStore: PopularPhotosDataStore? { get }
}

final class PopularPhotosRouter: PopularPhotosRoutingLogic, PopularPhotosDataPassing {
    var dataStore: PopularPhotosDataStore?
    weak var viewController: PopularPhotosCollectionViewController?
    
    func showPhotoDetail(_ photoDetail: PhotosModel.ViewModel.PhotoViewModel) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let photoDetailVC = storyboard.instantiateViewController(withIdentifier: "PhotoDetailViewController") as? PhotoDetailViewController else { return }
        photoDetailVC.viewModel = photoDetail
        photoDetailVC.modalPresentationStyle = .fullScreen
        viewController?.present(photoDetailVC, animated: true, completion: nil)
    }
}
