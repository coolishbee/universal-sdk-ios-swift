//
//  APIScrollViewController.swift
//  UniversalSDKDemo
//
//  Created by coolishbee on 2022/03/18.
//

import UIKit
import SnapKit

class APIScrollViewController: UIViewController {
    
    var didSetupConstraints = false
    
    let scrollView  = UIScrollView()
    let contentView = UIView()
    
    let label: UILabel = {
        let label = UILabel()
        label.backgroundColor = .lightGray
        label.numberOfLines = 0
        label.lineBreakMode = .byClipping
        label.textColor = .black
        label.text = NSLocalizedString("Lorem ipsum dolor sit amet, Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", comment: "")
        return label
    }()
    
    let textView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .cyan
        textView.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
        textView.textColor = .black
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        view.addSubview(scrollView)
        
        //contentView.backgroundColor = UIColor.lightGray
        scrollView.addSubview(contentView)
        contentView.addSubview(label)
        
        view.setNeedsUpdateConstraints()
    }
    
    override func updateViewConstraints() {
        
        if (!didSetupConstraints) {
            
            scrollView.snp.makeConstraints { make in
                make.edges.equalTo(view).inset(UIEdgeInsets.zero)
            }
            
            contentView.snp.makeConstraints { make in
                make.edges.equalTo(scrollView).inset(UIEdgeInsets.zero)
                make.width.equalTo(scrollView)
            }
            
            label.snp.makeConstraints { make in
                make.top.equalTo(contentView).inset(5)
                make.leading.equalTo(contentView).inset(5)
                make.trailing.equalTo(contentView).inset(5)
                make.bottom.equalTo(contentView).inset(5)
            }
            
            didSetupConstraints = true
        }
        
        super.updateViewConstraints()
    }
}
