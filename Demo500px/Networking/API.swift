//
//  API.swift
//  Demo500px
//
//  Created by EsmaGO on 3/21/20.
//  Copyright © 2020 EsmaGO. All rights reserved.
//

import Foundation

protocol API500px {
    static var domain:String { get }
    func requestDecodable<T: Decodable>(endPoint: Endpoint, completion: @escaping (T?, Error?) -> Void)
}

class API: API500px {
    static let domain = "https://api.500px.com/v1/"
    static let shared = API()
    private init() { }
    
    func requestDecodable<T>(endPoint: Endpoint, completion: @escaping (T?, Error?) -> Void) where T : Decodable {
    }
}
