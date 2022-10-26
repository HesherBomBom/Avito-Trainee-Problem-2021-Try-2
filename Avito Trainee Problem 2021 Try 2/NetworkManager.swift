//
//  NetworkManager.swift
//  Avito Trainee Problem 2021 Try 2
//
//  Created by Pavel Zykov on 26.10.2022.
//

import Foundation
import UIKit

class NetworkManager {
    
    var onCompletion: ((Api) -> Void)?
    
    func fetchCurrent() {
        let urlString = "https://run.mocky.io/v3/1d1cb4ec-73db-4762-8c4b-0b8aa3cecd4c"
        
        performRequest(with: urlString)
    }
    
    fileprivate func performRequest(with urlString: String) {
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let data = data {
                if let api = self.parseJSON(withData: data) {
                    print("Fetch done!")
                    self.onCompletion?(api)
                }
            }
        }
        task.resume()
    }
    
    fileprivate func parseJSON(withData data: Data) -> Api? {
        let decoder = JSONDecoder()
        do {
            let apiData = try decoder.decode(ApiData.self, from: data)
            guard let api = Api(apiData: apiData) else { return nil }
            return api
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
}
