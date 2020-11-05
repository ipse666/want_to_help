//
//  CharityEventsViewController.swift
//  WantToHelp
//
//  Created by v.vaskin on 02/11/2020.
//  Copyright © 2020 SimbirSoft. All rights reserved.
//

import UIKit

enum SegmentButton {
    case current
    case completed
}

class CharityEventsViewController: UIViewController {

    // MARK: IBOutlets
    /*
     UISegmentedControl сильно поменялся по сравнению с тем
     что находится в макете, поэтому для точного соответствия
     дизайну (pixel-perfect) делается кастомная иммитация
     этого компонента
    */
    @IBOutlet weak var currentButton: UIButton!
    @IBOutlet weak var completedButton: UIButton!
    @IBOutlet weak var segmentConteinerView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var output: CharityEventsViewOutput!
    private var charityItems = [CharityEventItem]()

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    // MARK: IBActions
    @IBAction func backButtonPressed(_ sender: Any) {
        output.backPressed(animated: true)
    }
    
    @IBAction func currentButtonPressed(_ sender: Any) {
        activeButton(segmentButton: .current)
    }
    
    @IBAction func completedButtonPressed(_ sender: Any) {
        activeButton(segmentButton: .completed)
    }
}

extension CharityEventsViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.charityItems.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "charityEventCell", for: indexPath) as! CharityEventCell
        let item: CharityEventItem = self.charityItems[indexPath.item]
        cell.photoView.image = UIImage(named: item.photoNames.first ?? "CharityDefaultPhoto", in: Bundle.main, compatibleWith: nil)
        cell.headLabel.text = item.head
        cell.descriptionLabel.text = item.description
        if item.date > 0 {
            let date = Date(timeIntervalSince1970: TimeInterval(item.date))
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "ru_RU")
            dateFormatter.dateFormat = "LLLL d, yyyy"
            cell.dateLabel.text = dateFormatter.string(from: date).capitalized
        }
        if item.deadline > 0 {
            let deadlineDate = Date(timeIntervalSince1970: TimeInterval(item.deadline))
            let currentDate = Date()
            let currentTimestamp = currentDate.timeIntervalSince1970
            let remainDays = item.deadline > UInt(currentTimestamp) ? (item.deadline - UInt(currentTimestamp))/86400 : 0
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "d.MM"
            var labelValue = String(format: Constants.ui.charity.remains, remainDays)
            labelValue.append(String(format: " (%@ - %@)", dateFormatter.string(from: currentDate), dateFormatter.string(from: deadlineDate)))
            cell.dateLabel.text = labelValue
        }
        return cell
    }
}

extension CharityEventsViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        output.openDescription(charity: charityItems[indexPath.row])
    }
}

// MARK:- <CharityEventsViewInput>
extension CharityEventsViewController: CharityEventsViewInput {
    func setupInitialState() {
        self.currentButton.setTitle(Constants.ui.charity.current, for: UIControl.State.normal)
        self.completedButton.setTitle(Constants.ui.charity.completed, for: UIControl.State.normal)
        segmentConteinerView.layer.borderColor = UIColor(named: "leaf")?.cgColor
        activeButton(segmentButton: .current)
    }
    
    func updateСharity(charity: [CharityEventItem]) {
        DispatchQueue.main.async {
            self.charityItems = charity
            self.collectionView.reloadData()
        }
    }
    
    func activeButton(segmentButton: SegmentButton) {
        switch segmentButton {
        case .current:
            self.currentButton.backgroundColor = UIColor(named: "leaf")
            self.currentButton.tintColor = UIColor.white
            self.completedButton.backgroundColor = UIColor.white
            self.completedButton.tintColor = UIColor(named: "leaf")
        case .completed:
            self.completedButton.backgroundColor = UIColor(named: "leaf")
            self.completedButton.tintColor = UIColor.white
            self.currentButton.backgroundColor = UIColor.white
            self.currentButton.tintColor = UIColor(named: "leaf")
        }
    }
}
