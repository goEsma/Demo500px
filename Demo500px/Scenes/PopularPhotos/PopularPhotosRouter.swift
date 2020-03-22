//
//  PopularPhotosRouter.swift
//  Demo500px
//
//  Created by EsmaGO on 3/22/20.
//  Copyright © 2020 EsmaGO. All rights reserved.
//

import Foundation

protocol PopularPhotosRoutingLogic {
    func showPhotoDetail()
}

protocol PopularPhotosDataPassing {
    var dataStore: PopularPhotosDataStore? { get }
}

final class PopularPhotosRouter: PopularPhotosRoutingLogic, PopularPhotosDataPassing {
    var dataStore: PopularPhotosDataStore?
    weak var viewController: PopularPhotosCollectionViewController?
    
    func showPhotoDetail() {
        
    }
}
