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
        testModel.append(HelpItem(name: "Дети",photoName: "HelpChildren"))
        testModel.append(HelpItem(name: "Взрослые",photoName: "HelpAdults"))
        testModel.append(HelpItem(name: "Пожилые",photoName: "HelpElderly"))
        testModel.append(HelpItem(name: "Животные",photoName: "HelpAnimals"))
        testModel.append(HelpItem(name: "Мероприятия",photoName: "HelpEvents"))
        return testModel
    }
}

// MARK:- <HelpCategoriesInteractorOutput>
extension HelpCategoriesPresenter: HelpCategoriesInteractorOutput {

}
