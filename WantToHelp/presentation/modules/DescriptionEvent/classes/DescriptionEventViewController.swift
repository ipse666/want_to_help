//
//  DescriptionEventViewController.swift
//  WantToHelp
//
//  Created by v.vaskin on 04/11/2020.
//  Copyright © 2020 SimbirSoft. All rights reserved.
//

import UIKit

class DescriptionEventViewController: UIViewController {

    // MARK: IBOutlets
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var organizationLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phone1Label: UILabel!
    @IBOutlet weak var phone2Label: UILabel!
    @IBOutlet weak var haveQuestionsLabel: UILabel!
    @IBOutlet weak var writeUs: UILabel!
    @IBOutlet weak var photo1View: UIImageView!
    @IBOutlet weak var photo2View: UIImageView!
    @IBOutlet weak var photo3View: UIImageView!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var organizationSiteLabel: UILabel!
    
    var output: DescriptionEventViewOutput!
    private var charityEventItem: CharityEventItem?

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    // MARK: IBActions
    @IBAction func backButtonPressed(_ sender: Any) {
        output.backPressed(animated: true)
    }
    
    @IBAction func writeUsButtonPressed(_ sender: Any) {
        UIApplication.shared.open(URL(string: "mailto:email@mail.com")!)
    }
    
    @IBAction func organizationSiteButtonPressed(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://google.com")!)
    }
    
    private func dateString(date: UInt, deadline: UInt) -> String {
        if date > 0 {
            let date = Date(timeIntervalSince1970: TimeInterval(date))
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "ru_RU")
            dateFormatter.dateFormat = "LLLL d, yyyy"
            return dateFormatter.string(from: date).capitalized
        }
        if deadline > 0 {
            let deadlineDate = Date(timeIntervalSince1970: TimeInterval(deadline))
            let currentDate = Date()
            let currentTimestamp = currentDate.timeIntervalSince1970
            let remainDays = deadline > UInt(currentTimestamp) ? (deadline - UInt(currentTimestamp))/86400 : 0
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "d.MM"
            var labelValue = String(format: Constants.ui.description.remains, remainDays)
            labelValue.append(String(format: " (%@ - %@)", dateFormatter.string(from: currentDate), dateFormatter.string(from: deadlineDate)))
            return labelValue
        }
        return ""
    }
}

// MARK:- <DescriptionEventViewInput>
extension DescriptionEventViewController: DescriptionEventViewInput {
    func setupInitialState(charityEventItem: CharityEventItem) {
        headerLabel.text = charityEventItem.head
        dateLabel.text = dateString(date: charityEventItem.date, deadline: charityEventItem.deadline)
        organizationLabel.text = charityEventItem.organization
        addressLabel.text = charityEventItem.address
        phone1Label.text = charityEventItem.phones.first
        phone2Label.text = charityEventItem.phones.count > 1 ? charityEventItem.phones.last : ""
        haveQuestionsLabel.text = Constants.ui.description.haveQuestions
        let linkTextAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor(named: "leaf") as Any,
                                                                 .font : UIFont(name: "SFUIText-Regular", size: 15) as Any,
                                                                 .underlineStyle: NSUnderlineStyle.single.rawValue]
        writeUs.attributedText = NSMutableAttributedString(string: Constants.ui.description.writeUs, attributes: linkTextAttributes)
        if charityEventItem.photoNames.count > 2 {
            photo1View.image = UIImage(named: charityEventItem.photoNames[0], in: Bundle.main, compatibleWith: nil)
            photo2View.image = UIImage(named: charityEventItem.photoNames[1], in: Bundle.main, compatibleWith: nil)
            photo3View.image = UIImage(named: charityEventItem.photoNames[2], in: Bundle.main, compatibleWith: nil)
        }
        descriptionTextView.text = charityEventItem.description
        organizationSiteLabel.attributedText = NSMutableAttributedString(string: Constants.ui.description.organizationSite, attributes: linkTextAttributes)
    }
}
