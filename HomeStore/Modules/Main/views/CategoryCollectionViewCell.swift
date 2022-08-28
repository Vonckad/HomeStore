//
//  CategoryCollectionViewCell.swift
//  HomeStore
//
//  Created by Vlad Ralovich on 27.08.2022.
//

import Foundation
import UIKit

class CategoryCollectionViewCell: UICollectionViewCell{
    
    static let reuseIdentifier = "category-cell-reuse-identifier"
    let imageView = UIImageView()
    let backgroundImageView = UIView()
    let titleLabel = UILabel()
    let categoryLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func addData(title: String, description: String, image: UIImage) {
        titleLabel.text = title
        categoryLabel.text = description
        imageView.image = image
    }
    
}

extension CategoryCollectionViewCell {
    func configure() {
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.backgroundColor = UIColor(hexString: "#FF6E4E")
        backgroundImageView.layer.cornerRadius = 35.5
        backgroundImageView.tintColor = UIColor(hexString: "#B3B3C3")
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(backgroundImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(categoryLabel)
        
        backgroundImageView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false

        titleLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.numberOfLines = 0
        titleLabel.textColor = .black
        
        categoryLabel.font = UIFont.preferredFont(forTextStyle: .caption2)
        categoryLabel.adjustsFontForContentSizeCategory = true
        categoryLabel.textColor = .black
        
        let spacing = CGFloat(10)
        NSLayoutConstraint.activate([
            backgroundImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            backgroundImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            backgroundImageView.heightAnchor.constraint(equalToConstant: 71),
            backgroundImageView.widthAnchor.constraint(equalToConstant: 71),

            titleLabel.topAnchor.constraint(equalTo: backgroundImageView.bottomAnchor, constant: spacing),
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),

            categoryLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            categoryLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            categoryLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            categoryLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            imageView.topAnchor.constraint(equalTo: backgroundImageView.topAnchor, constant: 20),
            imageView.centerXAnchor.constraint(equalTo: backgroundImageView.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 30),
            imageView.widthAnchor.constraint(equalToConstant: 18)
        ])
    }
}
