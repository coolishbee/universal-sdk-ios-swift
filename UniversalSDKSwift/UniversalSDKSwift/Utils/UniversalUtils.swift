//
//  UniversalUtils.swift
//  UniversalSDKSwift
//
//  Created by coolishbee on 2022/04/15.
//

import Foundation

enum Log {
    static func fatalError(
        _ message: @autoclosure () -> String,
        file: StaticString = #file,
        line: UInt = #line
    ) -> Never
    {
        Swift.fatalError("[UniversalSDK] \(message())", file: file, line: line)
    }
}

func guardSharedProperty<T>(_ input: T?) -> T {
    guard let shared = input else {
        Log.fatalError("Use \(T.self) before setup. " +
            "Please call `UniversalAPIClient.setup` before you do any other things in UniversalSDK.")
    }
    return shared
}
