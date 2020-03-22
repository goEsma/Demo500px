//
//  API.swift
//  Demo500px
//
//  Created by EsmaGO on 3/21/20.
//  Copyright © 2020 EsmaGO. All rights reserved.
//

import Alamofire

protocol API500px {
    static var domain:String { get }
    func request<T: Decodable>(endPoint: Endpoint, completion: @escaping (Result<T, Error>) -> Void)
}

class BaseAPI: API500px {
    static let domain = "https://api.500px.com/v1/"
    static let shared = BaseAPI()
    private init() { }
    
    func request<T>(endPoint: Endpoint, completion: @escaping (Result<T, Error>) -> Void) where T : Decodable {
        
        let urlString = BaseAPI.domain + endPoint.path
        AF.request(urlString, method: endPoint.method, parameters: endPoint.parameters, encoding: endPoint.parameterEncoding).validate(statusCode: 200..<299).responseDecodable { (response: DataResponse<T, AFError>) in
        
            switch response.result {
            case .success(let decodable):
                completion(.success(decodable))
            case .failure(let error):
                completion(.failure(error))
            }

        }
    }
}
