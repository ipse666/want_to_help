//
//  HelpCategoriesPresenter.swift
//  WantToHelp
//
//  Created by v.vaskin on 24/10/2020.
//  Copyright © 2020 SimbirSoft. All rights reserved.
//

class HelpCategoriesPresenter {

    weak var view: HelpCategoriesViewInput!
    var interactor: HelpCategoriesInteractorInput!
    var router: HelpCategoriesRouterInput!
    var testModel: [HelpItem] = [HelpItem]()
}

// MARK:- <HelpCategoriesViewOutput>
extension HelpCategoriesPresenter: HelpCategoriesViewOutput {
    func viewIsReady() {
        view.setupInitialState(helpes: createTestModel())
    }

    func backPressed(animated: Bool) {
        router.close(animated: animated)
    }
    
    func createTestModel() -> [HelpItem] {
        testModel.removeAll()
        var item1 = HelpItem()
        item1.name = "Дети"
        item1.photoName = "HelpChildren"
        testModel.append(item1)
        var item2 = HelpItem()
        item2.name = "Взрослые"
        item2.photoName = "HelpAdults"
        testModel.append(item2)
        var item3 = HelpItem()
        item3.name = "Пожилые"
        item3.photoName = "HelpElderly"
        testModel.append(item3)
        var item4 = HelpItem()
        item4.name = "Животные"
        item4.photoName = "HelpAnimals"
        testModel.append(item4)
        var item5 = HelpItem()
        item5.name = "Мероприятия"
        item5.photoName = "HelpEvents"
        testModel.append(item5)
        return testModel
    }
}

// MARK:- <HelpCategoriesInteractorOutput>
extension HelpCategoriesPresenter: HelpCategoriesInteractorOutput {

}
