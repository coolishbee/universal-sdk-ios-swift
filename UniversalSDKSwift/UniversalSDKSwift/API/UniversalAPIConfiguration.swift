//
//  UniversalAPIConfiguration.swift
//  UniversalSDKSwift
//
//  Created by coolishbee on 2022/04/15.
//

import Foundation

struct UniversalAPIConfiguration {
    static var _shared: UniversalAPIConfiguration?
    static var shared: UniversalAPIConfiguration {
        return guardSharedProperty(_shared)
    }
    
    //google login
    //facebook login
    //apple login
    //inapp list & iap
    //push
    
}
