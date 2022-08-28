//
//  HotSalesViewCell.swift
//  HomeStore
//
//  Created by Vlad Ralovich on 27.08.2022.
//

import Foundation

import UIKit

class HotSalesViewCell: UICollectionViewCell{
    
    static let reuseIdentifier = "hot-cell-reuse-identifier"
    let imageView = UIImageView()
    let titleLabel = UILabel()
    let categoryLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func addData(title: String, description: String) {//, image: UIImage) {
        titleLabel.text = title
        categoryLabel.text = description
//        imageView.image = image
    }
    
}

extension HotSalesViewCell {
    func configure() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(categoryLabel)

        titleLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.numberOfLines = 0
        titleLabel.textColor = .black
        
        categoryLabel.font = UIFont.preferredFont(forTextStyle: .caption2)
        categoryLabel.adjustsFontForContentSizeCategory = true
        categoryLabel.textColor = .black
        
        let spacing = CGFloat(10)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 182),

            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: spacing),
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),

            categoryLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            categoryLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            categoryLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            categoryLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}
