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
    
    private let clientID = "526488632616-v5e8d51cccmonngl07o95c2cr843ri40.apps.googleusercontent.com"
    private lazy var configuration: GIDConfiguration = {
        return GIDConfiguration(clientID: clientID)
    }()
    
    public func setupSDK()
    {
        guard !setup else {
            print("Trying to set configuration multiple times is not permitted.")
            return
        }
        setup = true
        
        ApplicationDelegate.shared.initializeSDK()
        
        
    }
    
    public func login(type: LoginType,
                      viewController: UIViewController)
    {
        
        
        switch type {
        case .google:
            GIDSignIn.sharedInstance.signIn(with: configuration,
                                            presenting: viewController)
            {
                user, error in
                guard let user = user else {
                    print("Error! \(String(describing: error))")
                    return
                }
                print(user.userID ?? "nil")
            }
            break
        case .facebook:
            Settings.appID = "2925534737733374"
            Settings.displayName = "Dev"
            
            let loginManager = LoginManager()
            loginManager.logIn(permissions: ["email"],
                               from: viewController) { result, error in
                guard error == nil else {
                    print("Error! \(String(describing: error))")
                    return
                }
                guard result == nil, result?.isCancelled == false else {
                    print("isCancelled")
                    return
                }
                guard let accessToken = AccessToken.current else {
                    print("accessToken is null")
                    return
                }
                            
                print(accessToken.userID)
            }
            break
        case .apple:
            break
        }
        
        
    }
        
}

