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
            navigationController.popViewController(animated: animated)
        } else if presentingViewController != nil {
            dismiss(animated: animated, completion: nil)
        }
    }
}
