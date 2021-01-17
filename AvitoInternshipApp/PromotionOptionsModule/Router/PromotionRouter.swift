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
        
        //let view = mainstoryboard.instantiateViewController(withIdentifier: "MyViewController") as! NoticeViewController
        let view = PromotionViewController()
        let presenter = PromotionPresenter()
        let interactor = PromotionInteractor()
        let router = PromotionRouter()
        
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.interactor = interactor
        presenter.view = view
        presenter.router = router
        
        return view
    }
    
//    static var mainstoryboard: UIStoryboard{
//            return UIStoryboard(name:"Main",bundle: Bundle.main)
//        }
}
