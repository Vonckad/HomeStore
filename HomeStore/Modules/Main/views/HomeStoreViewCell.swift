//
//  HomeStoreViewCell.swift
//  HomeStore
//
//  Created by Vlad Ralovich on 28.08.2022.
//

import Foundation

import UIKit

class HomeStoreViewCell: UICollectionViewCell{
    
    static let reuseIdentifier = "home-cell-reuse-identifier"
     let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let newLabel = UILabel()
    private let buyButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func addData(title: String, description: String) {//, image: UIImage) {
        titleLabel.text = title
        descriptionLabel.text = description
    }
    
    func showNewLabel(_ flag: Bool) {
        newLabel.isHidden = !flag
    }
}

extension HomeStoreViewCell {
    func configure() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        newLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        buyButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(imageView)
        contentView.addSubview(newLabel)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(buyButton)

        imageView.contentMode = .scaleAspectFill
        
        newLabel.text = "New"
        newLabel.textColor = .white
        newLabel.backgroundColor = UIColor(hexString: "#FF6E4E")
        newLabel.layer.cornerRadius = 13.5
        newLabel.clipsToBounds = true
        newLabel.font = .systemFont(ofSize: 10, weight: .bold)
        newLabel.textAlignment = .center
        newLabel.isHidden = true
        
        titleLabel.font = .systemFont(ofSize: 25, weight: .bold)
        titleLabel.textColor = .white
        
        descriptionLabel.font = .systemFont(ofSize: 11)
        descriptionLabel.textColor = .white
        
        buyButton.setTitle("Buy now!", for: .normal)
        buyButton.backgroundColor = .white
        buyButton.setTitleColor(.black, for: .normal)
        buyButton.layer.cornerRadius = 5
        buyButton.titleLabel?.font = .systemFont(ofSize: 11, weight: .bold)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            newLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 23),
            newLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            newLabel.heightAnchor.constraint(equalToConstant: 27),
            newLabel.widthAnchor.constraint(equalToConstant: 27),
            
            titleLabel.topAnchor.constraint(equalTo: newLabel.bottomAnchor, constant: 18),
            titleLabel.leadingAnchor.constraint(equalTo: newLabel.leadingAnchor),

            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            descriptionLabel.leadingAnchor.constraint(equalTo: newLabel.leadingAnchor),
            
            buyButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 26),
            buyButton.leadingAnchor.constraint(equalTo: newLabel.leadingAnchor),
            buyButton.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -23),
            buyButton.widthAnchor.constraint(equalToConstant: 98),

        ])
    }
}
