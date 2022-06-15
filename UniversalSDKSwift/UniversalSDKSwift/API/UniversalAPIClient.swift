//
//  UniversalAPIClient.swift
//  UniversalSDKSwift
//
//  Created by coolishbee on 2022/04/15.
//

import Foundation
import GoogleSignIn
import FBSDKLoginKit
import FBSDKCoreKit

@objcMembers
public class UniversalAPIClient: NSObject {
        
    public static let shared = UniversalAPIClient()
    
    var setup = false
    
    public func setupSDK()
    {
        guard !setup else {
            print("Trying to set configuration multiple times is not permitted.")
            return
        }
        setup = true
        
        ApplicationDelegate.shared.initializeSDK()
        
        
    }
    
    public func socialLogin(loginType: LoginType,
                            inViewController vc: UIViewController,
                            completionHandler completion: @escaping (SDKLoginResult?, Error?) -> Void)
    {
        UniversalLogin.shared.login(loginType: loginType,
                                    inViewController: vc,
                                    completionHandler: completion)
    }
    
    public func initBilling()
    {
        IAPManager.shared.setup(pidList: ["inapp1200", "com.gamepub.sdk.inapp1200", "com.gamepub.sdk.inapp2500"])
    }
    
    public func purchaseLaunch() {
        IAPManager.shared.purchase(productId: "inapp1200")
    }
}

