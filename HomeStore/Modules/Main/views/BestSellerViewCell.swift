//
//  HotSalesViewCell.swift
//  HomeStore
//
//  Created by Vlad Ralovich on 27.08.2022.
//

import Foundation

import UIKit

class BestSellerViewCell: UICollectionViewCell{
    
    static let reuseIdentifier = "best-cell-reuse-identifier"
     let imageView = UIImageView()
    private let priceLabel = UILabel()
    private let oldPriceLabel = UILabel()
    private let titleLabel = UILabel()
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func addData(title: String, price: String, oldPrice: String) {//, image: UIImage) {
        imageView.backgroundColor = .red
        titleLabel.text = title
        priceLabel.text = price
        oldPriceLabel.text = oldPrice
        backgroundColor = .white
    }
}

extension BestSellerViewCell {
    func configure() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        oldPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(imageView)
        contentView.addSubview(priceLabel)
        contentView.addSubview(oldPriceLabel)
        contentView.addSubview(titleLabel)

        priceLabel.font = .systemFont(ofSize: 16, weight: .bold)
        priceLabel.textColor = UIColor(hexString: "#010035")
        
        oldPriceLabel.font = .systemFont(ofSize: 10)
        oldPriceLabel.textColor = UIColor(hexString: "#CCCCCC")
        
        titleLabel.font = .systemFont(ofSize: 10)
        titleLabel.textColor = UIColor(hexString: "#010035")
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//            imageView.heightAnchor.constraint(equalToConstant: 168),

            priceLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 2),
            priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 21),
    
            oldPriceLabel.lastBaselineAnchor.constraint(equalTo: priceLabel.lastBaselineAnchor),
            oldPriceLabel.leadingAnchor.constraint(equalTo: priceLabel.trailingAnchor, constant: 7),
    
            titleLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: priceLabel.leadingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
        ])
    }
}
