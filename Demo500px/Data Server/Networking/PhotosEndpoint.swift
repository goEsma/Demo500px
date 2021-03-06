//
//  500pxAPI.swift
//  Demo500px
//
//  Created by EsmaGO on 3/18/20.
//  Copyright © 2020 EsmaGO. All rights reserved.
//

import Alamofire

/// List of photos endpoints that this app uses.
enum PhotosEndpoint {
    case getPopularPhotos(request: PhotosModel.Request)
}

extension PhotosEndpoint: Endpoint {
    var path: String {
        return "photos"
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    /// returns request parameters of the selected api.
    var parameters: [String : Any] {
        switch self {
        case .getPopularPhotos:
            return ["feature":"popular"]
        }
    }
    
    /// returns the parameters encoding type of the selected api.
    var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    
}
