//
//  MaimModel.swift
//  HomeStore
//
//  Created by Vlad Ralovich on 27.08.2022.
//

import Foundation
import UIKit

struct MaimModel: Hashable, Decodable {
    let best_seller: [HotSalesModel]
}

struct HotSalesModel: Hashable, Decodable {
    let title, picture: String
    let id, price_without_discount, discount_price: Int
    let is_favorites: Bool
}
