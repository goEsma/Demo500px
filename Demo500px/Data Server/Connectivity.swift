//
//  Connectivity.swift
//  Demo500px
//
//  Created by EsmaGO on 3/21/20.
//  Copyright © 2020 EsmaGO. All rights reserved.
//

import Alamofire

protocol NetworkConnectable {
    static var isConnectedToInternet: Bool { get }
}

/// Checks internet connection using Alamofire's NetworkReachabilityManager.
/// - Helps isolating `Alamofire`'s  `NetworkReachabilityManager` from users of this class.
/// - So that, if Alamofire is removed, users of this class won't be affected.
class Connectivity: NetworkConnectable {
    static var isConnectedToInternet:Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}

