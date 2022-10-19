//
//  WebService.swift
//  CryptoSUI
//
//  Created by Tunay Toksöz on 21.09.2022.
//

import Foundation

class WebService {
    
    
    func dowloadCurrenciesAsync(url: URL) async throws -> [CryptoCurrency]{
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let currencies = try? JSONDecoder().decode([CryptoCurrency].self, from: data)
        return currencies ?? []
    }
    
    /*
    func downloadCurrencies(url : URL, completion: @escaping (Result<[CryptoCurrency]?, DownloadError>) -> Void) {
        
        URLSession.shared.dataTask(with: url) { data, response , error in
            if let error = error {
                print(error.localizedDescription)
                completion(.failure(.badUrl))
            }
            
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            
            guard let currencies = try? JSONDecoder().decode([CryptoCurrency].self, from: data) else {
                return completion(.failure(DownloadError.dataParseError))
            }
            
            completion(.success(currencies))
            
        }.resume()
        
        
    }
     */
    
    
    enum DownloadError : Error {
        case badUrl
        case noData
        case dataParseError
    }
    
}
