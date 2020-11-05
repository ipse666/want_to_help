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

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.helpes.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "helpCategoryCell", for: indexPath) as! HelpCategoryCell
        let helpItem: HelpItem = self.helpes[indexPath.item]
        if let image = UIImage(named: helpItem.photoName, in: Bundle.main, compatibleWith: nil) {
            cell.imageView.image = image
        } else {
            cell.imageView.image = UIImage(named: "NotImage")
        }
        cell.titleLabel.text = helpItem.title
        return cell
    }
}

extension HelpCategoriesViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item: HelpItem = helpes[indexPath.row]
        output.openCharity(helpItem: item)
    }
}

// MARK:- <HelpCategoriesViewInput>
extension HelpCategoriesViewController: HelpCategoriesViewInput {
    func setupInitialState() {
        title = Constants.ui.pageTitles.help
    }
    
    func updateCategories(categories: [HelpItem]) {
        DispatchQueue.main.async {
            self.helpes = categories
            self.collectionView.reloadData()
        }
    }
}
