//
//  PromotionsModel.swift
//  AvitoInternshipApp
//
//  Created by Egor Chernakov on 17.01.2021.
//

import Foundation
import UIKit

struct PromotionModel {
    
    let promotionOptions: [(image: UIImage, id: String, title: String, description: String?, price: String)]
    let data: PromotionData
    
    struct PromotionData: Codable {
        let status: String
        let result: Result
    }

    struct Result: Codable {
        let title, actionTitle, selectedActionTitle: String
        let list: [List]
    }

    struct List: Codable {
        let id, title: String
        let listDescription: String?
        let icon: Icon
        let price: String
        let isSelected: Bool

        enum CodingKeys: String, CodingKey {
            case id, title
            case listDescription = "description"
            case icon, price, isSelected
        }
    }

    struct Icon: Codable {
        let the52X52: String

        enum CodingKeys: String, CodingKey {
            case the52X52 = "52x52"
        }
    }

    struct PromotionImages {
        let images: [(image: UIImage, id: String)]
    }
    
    
}
