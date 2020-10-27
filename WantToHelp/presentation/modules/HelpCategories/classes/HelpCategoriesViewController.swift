//
//  HelpCategoriesViewController.swift
//  WantToHelp
//
//  Created by v.vaskin on 24/10/2020.
//  Copyright © 2020 SimbirSoft. All rights reserved.
//

import UIKit

class HelpCategoriesViewController: UIViewController {

    // MARK: IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    var output: HelpCategoriesViewOutput!
    private var helpes = [HelpItem]()

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        HelpCategoriesBuilder().configure(viewController: self)
        output.viewIsReady()
    }

    // MARK: IBActions
    @IBAction func backButtonPressed(_ sender: Any) {
        output.backPressed(animated: true)
    }
}

extension HelpCategoriesViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return self.helpes.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "helpCategoryCell", for: indexPath) as! HelpCategoryCell
        let helpItem: HelpItem = self.helpes[indexPath.item]
        cell.titleLabel.text = helpItem.name
        cell.imageView.image = UIImage(named: helpItem.photoName)
        return cell
    }
}

extension HelpCategoriesViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }
}

// MARK:- <HelpCategoriesViewInput>
extension HelpCategoriesViewController: HelpCategoriesViewInput {
    func setupInitialState(helpes: [HelpItem]) {
        title = Constants.ui.pageTitles.help
        self.helpes = helpes
        self.collectionView.reloadData()
    }
}
