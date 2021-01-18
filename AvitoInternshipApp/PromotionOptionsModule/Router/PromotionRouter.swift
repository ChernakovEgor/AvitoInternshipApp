//
//  PromotionRouter.swift
//  AvitoInternshipApp
//
//  Created by Egor Chernakov on 17.01.2021.
//

import Foundation
import UIKit

class PromotionRouter {
    
    static func CreateModule() -> PromotionViewController {
        
        let view = mainstoryboard.instantiateViewController(withIdentifier: "PromotionVC") as! PromotionViewController
        let presenter = PromotionPresenter()
        let interactor = PromotionInteractor()
        let router = PromotionRouter()
        
        interactor.presenter = presenter
        presenter.interactor = interactor
        presenter.view = view
        presenter.router = router
        
        view.presenter = presenter
        
        return view
    }
    
    static var mainstoryboard: UIStoryboard{
            return UIStoryboard(name:"Main",bundle: Bundle.main)
        }
}
