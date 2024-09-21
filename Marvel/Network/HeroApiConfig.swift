//
//  HeroApiConfig.swift
//  Marvel
//
//  Created by iOSLab on 10/08/24.
//

import Foundation
import CryptoKit

enum ApiKeys: String {
    case privateKey
    case publicKey
    
    var value: String {
        switch self{
        case .privateKey:
            return TrueAPIkeys.APIprivate
        case .publicKey:
            return TrueAPIkeys.APIpublic
        }
    }
}

class HeroApiConfig {
    private let timestamp = String(Int(Date().timeIntervalSince1970 * 1000))
    
    private var md5: String {
        let keyString = timestamp + ApiKeys.privateKey.value + ApiKeys.publicKey.value
        let digest = Insecure.MD5.hash(data: Data(keyString.utf8))

            return digest.map {
                String(format: "%02hhx", $0)
            }.joined()
    }
    
    var url: URL? {
        let baseURL = NetworkConstants.baseURL + NetworkConstants.baseEndpoint + NetworkConstants.heroEndpoint
        
        let url = "\(baseURL)?ts=\(timestamp)&apikey=\(ApiKeys.publicKey.value)&hash=\(md5)"
        return URL(string: url)
    }
        
}
