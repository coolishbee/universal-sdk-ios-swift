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
                print(user.profile?.name ?? "nil")
                print(user.profile?.email ?? "nil")
                if ((user.profile?.hasImage) != nil) {
                    let pic = user.profile?.imageURL(withDimension: 100)
                    print(pic?.absoluteString ?? "nil")
                }
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

                guard let accessToken = AccessToken.current else {
                    print("accessToken is null")
                    return
                }
                            
                print(accessToken.userID)
                
                GraphRequest(graphPath: "me",
                             parameters: ["fields": "id, name, picture.type(normal), email"]).start(
                                completion: { (connection, result, error) -> Void in
                                    guard error == nil else {
                                        print("Error! \(String(describing: error))")
                                        return
                                    }
                                    
                                    let parsedData = result as! Dictionary<String, AnyObject>?
                                    if let email = parsedData?["email"] {
                                        print("Email: \(email as! String)")
                                    }
                                    
                                    if let dictData: [String: Any] = result as? [String: Any] {
                                        DispatchQueue.main.async {
                                            print("email")
                                            print("name")
                                            print(dictData["email"]!)
                                            print(dictData["name"]!)
                                            
                                            if let picData: [String: Any] = dictData["picture"] as? [String: Any] {
                                                if let data: [String: Any] = picData["data"] as? [String: Any] {
                                                    print(data["url"]!)
                                                }
                                            }
                                        }
                                    }
                                })
            }
            break
        case .apple:
            break
        }
        
        
    }
    
    public func initBilling()
    {
        IAPManager.shared.setup(pidList: ["inapp1200", "com.gamepub.sdk.inapp1200", "com.gamepub.sdk.inapp2500"])
    }
    
    public func purchaseLaunch() {
        IAPManager.shared.purchase(productId: "inapp1200")
    }
}

