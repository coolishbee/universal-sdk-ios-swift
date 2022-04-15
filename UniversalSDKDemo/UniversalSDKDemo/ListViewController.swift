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
    let demos = ["SetupSDK", "Google Login", "Facebook Login"]

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
            //API.getTestFunc()
            UniversalAPIClient.shared.setupSDK()
        } else if indexPath.row == 1 {
            UniversalAPIClient.shared.login(type: LoginType.google,
                                            viewController: self)
            //let viewController = APIScrollViewController()
            //navigationController?.pushViewController(viewController, animated: true)
        } else if indexPath.row == 2 {
            UniversalAPIClient.shared.login(type: LoginType.facebook,
                                            viewController: self)
            
            //let viewController = APIScrollViewController()
            //navigationController?.pushViewController(viewController, animated: true)
        }
    }


}

