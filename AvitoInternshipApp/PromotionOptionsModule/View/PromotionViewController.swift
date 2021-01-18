//
//  PromotionViewController.swift
//  AvitoInternshipApp
//
//  Created by Egor Chernakov on 17.01.2021.
//

import UIKit

class PromotionViewController: UIViewController, UICollectionViewDelegate {
    
    @IBOutlet weak var PromotionCollectionView: UICollectionView!
    @IBOutlet weak var crossImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var selectButton: UIButton!
    @IBAction func onButtonPress(_ sender: Any) {
        let alert = UIAlertController(title: "Alert!", message: "Выбрана услуга \(promotionData!.promotionOptions[selectedIndex.row].title)", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: promotionData?.data.result.selectedActionTitle, style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: promotionData?.data.result.actionTitle, style: .default, handler: nil))

        self.present(alert, animated: true)
    }
    
    var selectedIndex: IndexPath = IndexPath(row: 0, section: 0)
    var presenter: PromotionPresenter?
    var promotionData: PromotionModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        crossImageView.image = UIImage(named: "CloseIconTemplate.pdf")
        selectButton.layer.cornerRadius = 5
        selectButton.backgroundColor = .systemBlue
        presenter?.startFetching()
        prepareCollectionView()
        // Do any additional setup after loading the view.
    }
}

extension PromotionViewController {
    func showPromotionOptions(promotion: PromotionModel) {
        promotionData = promotion
        titleLabel.text = promotionData?.data.result.title
    }
}

//MARK: UICollectionViewDataSource & UICollectionViewDelegate
extension PromotionViewController: UICollectionViewDataSource {
    
    func prepareCollectionView() {
        PromotionCollectionView.delegate = self
        PromotionCollectionView.dataSource = self
        let config = UICollectionLayoutListConfiguration(appearance: .sidebarPlain)
        PromotionCollectionView.tintColor = .clear
        PromotionCollectionView.backgroundColor = .clear
        PromotionCollectionView.collectionViewLayout = UICollectionViewCompositionalLayout.list(using: config)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (promotionData?.promotionOptions.count)!
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PromotionCell", for: indexPath) as? PromotionCollectionViewCell else {
                    fatalError("Wrong cell")
                }
        cell.update((promotionData?.promotionOptions[indexPath.row])!)
        cell.backgroundColor = UIColor(white: 0.96, alpha: 1)
        if selectedIndex.row == indexPath.row {
            cell.checkMarkImageView.alpha = 1.0
        } else {
            cell.checkMarkImageView.alpha = 0.0
        }
        cell.layer.cornerRadius = 10
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndex = indexPath
        collectionView.reloadData()
    }
}
