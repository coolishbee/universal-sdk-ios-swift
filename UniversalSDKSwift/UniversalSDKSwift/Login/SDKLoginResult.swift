//
//  SDKLoginResult.swift
//  UniversalSDKSwift
//
//  Created by gamepub on 2022/05/18.
//

@objcMembers
public class SDKLoginResult: NSObject {
    let _value: LoginResult
    init(_ value: LoginResult) { _value = value }
    
    public var userID: String? { return _value.userID }
    public var pushToken: String? { return _value.pushToken }
    
    public var json: String? { return toJSON(_value) }
}
