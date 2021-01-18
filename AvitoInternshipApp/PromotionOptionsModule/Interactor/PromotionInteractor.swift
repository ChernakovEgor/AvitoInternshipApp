//
//  PromotionInteractor.swift
//  AvitoInternshipApp
//
//  Created by Egor Chernakov on 17.01.2021.
//

import Foundation
import UIKit

class PromotionInteractor {
    
    var presenter: PromotionPresenter?
    
    func fetchData() {
        if let path = Bundle.main.path(forResource: "result", ofType:".json") {
            do {
                let fileURL = URL(fileURLWithPath: path)
                let data = try Data(contentsOf: fileURL)
                let json = try JSONDecoder().decode(PromotionModel.PromotionData.self, from: data)
                let options = self.fetchImages(from: json)
                let promotionModel = PromotionModel(promotionOptions: options, data: json)
                self.presenter?.fetchSuccess(promotionData: promotionModel)
            } catch {
                print("Failed to fetch .json file: \(error)")
            }
        }
    }
    
    func fetchImages(from data: PromotionModel.PromotionData)-> [(UIImage, String, String, String?, String)] {
        var options: [(UIImage, String, String, String?, String)] = []
        for option in data.result.list {
            let semaphore = DispatchSemaphore(value: 0)
            let url = URL(string: option.icon.the52X52)!
            let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
                guard let data = data else { return }
                if let image = UIImage(data: data) {
                    options.append((image, option.id, option.title, option.listDescription, option.price))
                    semaphore.signal()
                    print(image)
                }
            }
            task.resume()
            semaphore.wait()
        }
        
        return options
    }
}
