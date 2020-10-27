//
//  RootTabBar.swift
//  WantToHelp
//
//  Created by Vladimir Vaskin on 24.10.2020.
//

import UIKit

enum TabbarButton: Int {
    case news
    case search
    case help
    case history
    case profile
}

protocol RootTabBarDelegate: NSObjectProtocol {
    func addClick()
}

class RootTabBar: UITabBar {
    
    weak var addDelegate: RootTabBarDelegate?
    
    private lazy var addButton:UIButton = {
        return UIButton()
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addButton.setBackgroundImage(UIImage.init(named: "helpTabbarSel"), for: .normal)
        addButton.addTarget(self, action: #selector(RootTabBar.addButtonClick), for: .touchUpInside)
        addButton.adjustsImageWhenHighlighted = false;
        self.addSubview(addButton)
        self.tintColor = UIColor(named: "leaf")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func addButtonClick(){
        if addDelegate != nil {
            addDelegate?.addClick()
        }
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        var index = 0
        for barButton in self.subviews {
            if barButton.isKind(of: NSClassFromString("UITabBarButton")!){
                if index == TabbarButton.help.rawValue {
                    addButton.frame.size = CGSize.init(width: (addButton.currentBackgroundImage?.size.width)!, height: (addButton.currentBackgroundImage?.size.height)!)
                    addButton.center = CGPoint.init(x: self.center.x, y: self.frame.size.height/2 - Constants.ui.tabbar.centralButtonOffset)
                }
                index += 1
            }
        }
        self.bringSubviewToFront(addButton)
    }
}

