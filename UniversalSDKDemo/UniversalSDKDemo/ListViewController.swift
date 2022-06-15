//
//  ListViewController.swift
//  UniversalSDKDemo
//
//  Created by coolishbee on 2022/03/04.
//

import UIKit
import UniversalSDKSwift

class ListViewController: UITableViewController {

    let kCellIdentifier = "CellIdentifier"
    let demos = ["SetupSDK", "Google Login", "Facebook Login", "Apple Login", "InitBilling", "InAppPurchase"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Universal SDK Demo"
        
        self.tableView?.register(UITableViewCell.self, forCellReuseIdentifier: kCellIdentifier)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return demos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kCellIdentifier)! as UITableViewCell
        
        cell.textLabel?.text = demos[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            UniversalAPIClient.shared.setupSDK()
        } else if indexPath.row == 1 {
            UniversalAPIClient.shared.socialLogin(loginType: .google,
                                                  inViewController: self) { result, error in
                guard let result = result else {
                    print("Error! \(String(describing: error))")
                    return
                }
                let apiVC = APIScrollViewController()
                apiVC.label.text = result.json
                self.navigationController?.pushViewController(apiVC, animated: true)
            }
            
        } else if indexPath.row == 2 {

        } else if indexPath.row == 3 {
            print("Apple Login")
        } else if indexPath.row == 4 {
            print("Init Billing")
            UniversalAPIClient.shared.initBilling()
        } else if indexPath.row == 5 {
            print("InAppPurchase")
            UniversalAPIClient.shared.purchaseLaunch()
        }
    }


}

