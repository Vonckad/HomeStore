//
//  FooterView.swift
//  HomeStore
//
//  Created by Vlad Ralovich on 29.08.2022.
//

import Foundation

import UIKit

class FooterView: UICollectionReusableView {
    let searchTextField = UISearchTextField()
    let seeMoreButton = UIButton()
    static let reuseIdentifier = "footer-supplementary-reuse-identifier"

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
}

extension FooterView {
    func configure() {
        addSubview(searchTextField)
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        searchTextField.placeholder = "Search"
        searchTextField.borderStyle = .roundedRect
        searchTextField.backgroundColor = .white
//        searchTextField.font = .systemFont(ofSize: 25, weight: .bold)
        addSubview(seeMoreButton)
        seeMoreButton.translatesAutoresizingMaskIntoConstraints = false
        seeMoreButton.backgroundColor = UIColor(hexString: "#FF6E4E")
        seeMoreButton.layer.cornerRadius = 17
//        seeMoreButton.setTitleColor(UIColor(hexString: "#FF6E4E"), for: .normal)
//        seeMoreButton.titleLabel?.font = .systemFont(ofSize: 15)
        
        
        let inset = CGFloat(10)
        NSLayoutConstraint.activate([
            searchTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: inset),
            searchTextField.topAnchor.constraint(equalTo: topAnchor, constant: inset),
            searchTextField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -inset),
            
            seeMoreButton.leadingAnchor.constraint(equalTo: searchTextField.trailingAnchor, constant: inset),
            seeMoreButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -inset),
            seeMoreButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            seeMoreButton.widthAnchor.constraint(equalToConstant: 34),
            seeMoreButton.heightAnchor.constraint(equalToConstant: 34),
//            seeMoreButton.topAnchor.constraint(equalTo: topAnchor, constant: inset),
//            seeMoreButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -inset),
        ])
    }
}
