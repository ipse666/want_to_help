//
//  LaunchLoadingViewController.swift
//  WantToHelp
//
//  Created by v.vaskin on 24/10/2020.
//  Copyright © 2020 SimbirSoft. All rights reserved.
//

import UIKit

class LaunchLoadingViewController: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet weak var preloader: UIActivityIndicatorView!

    var output: LaunchLoadingViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        LaunchLoadingBuilder().configure(viewController: self)
        output.viewIsReady()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        preloader.startAnimating()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        preloader.stopAnimating()
    }
}

// MARK:- <LaunchLoadingViewInput>
extension LaunchLoadingViewController: LaunchLoadingViewInput {
    func setupInitialState() {
    }
}
