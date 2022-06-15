//
//  LoginResult.swift
//  UniversalSDKSwift
//
//  Created by gamepub on 2022/05/18.
//

import Foundation

public struct LoginResult: Encodable {
    let userID: String?
    let name: String?
    let email: String?
    let imageURL: URL?
    let idToken: String?
    let pushToken: String?
}
