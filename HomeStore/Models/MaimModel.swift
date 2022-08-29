//
//  MaimModel.swift
//  HomeStore
//
//  Created by Vlad Ralovich on 27.08.2022.
//

import Foundation
import UIKit

struct MaimModel: Hashable, Decodable {
    let home_store: [HomeStoreModel]
    let best_seller: [BestSellerModel]
}

struct BestSellerModel: Hashable, Decodable {
    let title, picture: String
    let id, price_without_discount, discount_price: Int
    let is_favorites: Bool
}

struct HomeStoreModel: Hashable, Decodable {
    let id: Int
    let is_new, is_buy: Bool?
    let title, subtitle, picture: String
}
