//
//  PromotionInteractor.swift
//  AvitoInternshipApp
//
//  Created by Egor Chernakov on 17.01.2021.
//

import Foundation

class PromotionInteractor {
    
    var presenter: PromotionPresenter?
    
    func fetchData() {
        if let path = Bundle.main.path(forResource: "result", ofType:".json") {
            do {
                let fileURL = URL(fileURLWithPath: path)
                let data = try Data(contentsOf: fileURL)
                let json = try JSONDecoder().decode(PromotionModel.self, from: data)
                presenter?.fetchSuccess(promotionData: json)
            } catch {
                print("Failed to fetch .json file: \(error)")
            }
        }
    }
}
