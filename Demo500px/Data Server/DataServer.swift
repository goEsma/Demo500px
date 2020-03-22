//
//  DataServer.swift
//  Demo500px
//
//  Created by EsmaGO on 3/21/20.
//  Copyright © 2020 EsmaGO. All rights reserved.
//

import Foundation

/// A protocol that lists 500px services.
protocol DataServable {
    func getPopularPhotos(request: PhotosModel.Request, completion: @escaping (Swift.Result<PhotosModel.Response, Error>) -> Void)
}

/// An abstraction layer  that hides data providing logic.
/// - This class gets data from either local data source or remote data source.
class DataServer: DataServable {
    func getPopularPhotos(request: PhotosModel.Request, completion: @escaping (Result<PhotosModel.Response, Error>) -> Void) {
        BaseAPI.shared.request(endPoint: PhotosEndpoint.getPopularPhotos(request: request), completion: completion)
    }
}
