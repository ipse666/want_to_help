//
//  LaunchLoadingViewController.swift
//  WantToHelp
//
//  Created by v.vaskin on 24/10/2020.
//  Copyright © 2020 SimbirSoft. All rights reserved.
//

import UIKit

protocol ClosableRouter {
    var transitionHandler: UIViewController! { get set }
    func close(animated: Bool)
}

extension ClosableRouter {
    func close(animated: Bool) {
        transitionHandler.closeCurrentModule(animated: animated)
    }
}

extension UIViewController {
    func closeCurrentModule(animated: Bool) {
        if let navigationController = parent as? UINavigationController, navigationController.children.count > 1 {
            print("Close navigation controller")
            navigationController.popViewController(animated: animated)
        } else if presentingViewController != nil {
            print("Close modal view controller")
            dismiss(animated: animated, completion: nil)
        } else if view.superview != nil {
            print("Remove view from superview")
            view.removeFromSuperview()
        }
    }
}
