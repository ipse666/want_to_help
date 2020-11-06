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
    @IBOutlet weak var descriptionConstraintHeight: NSLayoutConstraint!
    @IBOutlet weak var scrollConstraintHeight: NSLayoutConstraint!
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
        if let email = charityEventItem?.email, let emailUrl = URL(string: "mailto:\(email)") {
            UIApplication.shared.open(emailUrl)
        }
    }
    
    @IBAction func organizationSiteButtonPressed(_ sender: Any) {
        if let site = charityEventItem?.site, let siteUrl = URL(string: site) {
            UIApplication.shared.open(siteUrl)
        }
    }
}

// MARK:- <DescriptionEventViewInput>
extension DescriptionEventViewController: DescriptionEventViewInput {
    func setupInitialState(charityEventItem: CharityEventItem) {
        self.charityEventItem = charityEventItem
        headerLabel.text = charityEventItem.head
        dateLabel.text = output.dateString(startDate: charityEventItem.startDate, endDate: charityEventItem.endDate)
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
        let fixedWidth = descriptionTextView.frame.size.width
        let newSize = descriptionTextView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        scrollConstraintHeight.constant = CGFloat(Constants.ui.description.minimumScrollHeight) + newSize.height
        descriptionConstraintHeight.constant = newSize.height
        organizationSiteLabel.attributedText = NSMutableAttributedString(string: Constants.ui.description.organizationSite, attributes: linkTextAttributes)
    }
}
