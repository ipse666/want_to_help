//
//  HelpCategoriesInteractor.swift
//  WantToHelp
//
//  Created by v.vaskin on 24/10/2020.
//  Copyright © 2020 SimbirSoft. All rights reserved.
//

import Foundation

class HelpCategoriesInteractor: HelpCategoriesInteractorInput {
    weak var output: HelpCategoriesInteractorOutput!

    // MARK: <HelpCategoriesInteractorInput>
    func categories() {
        DataService.getCategories { (catehoriesResult) in
            DispatchQueue.global(qos: .default).async {[weak self] in
                if let `self` = self, let output = self.output {
                    output.categories(categories: catehoriesResult)
                }
            }
        }
    }

}
