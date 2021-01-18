//
//  PromotionCollectionViewCell.swift
//  AvitoInternshipApp
//
//  Created by Egor Chernakov on 18.01.2021.
//

import UIKit

class PromotionCollectionViewCell: UICollectionViewCell {
    
    static let reuseID = String(describing: PromotionCollectionViewCell.self)
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var checkMarkImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func update(_ cellData: (UIImage, String, String, String?, String)) {
        imageView.image = cellData.0
        titleLabel.text = cellData.2
        descriptionLabel.text = cellData.3
        priceLabel.text = cellData.4
        checkMarkImageView.image = UIImage(named: "checkmark.pdf")
    }

}
