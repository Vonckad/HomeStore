//
//  TitleSupplementaryView.swift
//  HomeStore
//
//  Created by Vlad Ralovich on 27.08.2022.
//

import UIKit

class TitleSupplementaryView: UICollectionReusableView {
    let label = UILabel()
    let seeMoreButton = UIButton()
    static let reuseIdentifier = "title-supplementary-reuse-identifier"

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
}

extension TitleSupplementaryView {
    func configure() {
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .systemFont(ofSize: 25, weight: .bold)
        addSubview(seeMoreButton)
        seeMoreButton.translatesAutoresizingMaskIntoConstraints = false
        seeMoreButton.setTitleColor(UIColor(hexString: "#FF6E4E"), for: .normal)
        seeMoreButton.titleLabel?.font = .systemFont(ofSize: 15)
        
        let inset = CGFloat(10)
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: inset),
            label.topAnchor.constraint(equalTo: topAnchor, constant: inset),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -inset),
            
            seeMoreButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -inset),
            seeMoreButton.topAnchor.constraint(equalTo: topAnchor, constant: inset),
            seeMoreButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -inset),
            
        ])
    }
}
