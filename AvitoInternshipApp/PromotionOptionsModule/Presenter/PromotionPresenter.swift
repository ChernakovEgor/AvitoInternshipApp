//
//  PromotionPresenter.swift
//  AvitoInternshipApp
//
//  Created by Egor Chernakov on 17.01.2021.
//

import Foundation

class PromotionPresenter {
    
    var view: PromotionViewController? //PresenterToViewProtocol?
        
    var interactor: PromotionInteractor? //PromotionInteractor
        
    var router: PromotionRouter? //PresenterToRouterProtocol?
    
    func startFetching() {
        interactor?.fetchData()
    }
    
    func fetchSuccess(promotionData: PromotionModel) {
        view?.showPromotionOptions(promotion: promotionData)
    }
    
    
}
