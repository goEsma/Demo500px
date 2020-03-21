//
//  Endpoint.swift
//  Demo500px
//
//  Created by EsmaGO on 3/21/20.
//  Copyright © 2020 EsmaGO. All rights reserved.
//

import Alamofire

protocol Endpoint {
    var path: String { get }
    var method: HTTPMethod { get  }
    var parameters: [String : Any] { get  }
    var parameterEncoding: ParameterEncoding { get }
}
