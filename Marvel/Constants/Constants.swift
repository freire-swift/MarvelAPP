//
//  Constants.swift
//  Marvel
//
//  Created by iOSLab on 20/07/24.
//

import Foundation

struct Constants {
    static let heroCellName = "heroCell"
    static let heroCellSize: CGFloat = 200
    static let detailVCName = "detailVC"
    static let storyboardName = "Main"
}

struct NetworkConstants {
    static let baseURL = "http://gateway.marvel.com"
    static let baseEndpoint = "/v1/public/"
    static let heroEndpoint = "characters"
}
