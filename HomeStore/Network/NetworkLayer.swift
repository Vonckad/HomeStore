//
//  NetworkLayer.swift
//  HomeStore
//
//  Created by Vlad Ralovich on 27.08.2022.
//

import Foundation

class NetworkLayer {
    static func loadAllData( urlString: String, complition: @escaping (Data) -> ()) {
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if error != nil {
                fatalError()
            }
            guard let data = data else { return }
            complition(data)
        }.resume()
    }
}
