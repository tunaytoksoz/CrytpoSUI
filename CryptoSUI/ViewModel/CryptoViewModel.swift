//
//  CryptoViewModel.swift
//  CryptoSUI
//
//  Created by Tunay Toksöz on 21.09.2022.
//

import Foundation


class CryptoListViewModel : ObservableObject {
    
    @Published var cryptoList = [CryptoViewModel]()
    
    let webService = WebService()
    
    func downloadCryptosAsync(url: URL) async{
        do {
            let cryptos = try await webService.dowloadCurrenciesAsync(url: url)
            DispatchQueue.main.async {
                self.cryptoList = cryptos.map(CryptoViewModel.init)
            }
        } catch {
            print(error)
        }
    }
    /*
    func downloadCryptos(url : URL) {
        
        webService.downloadCurrencies(url: url) { result in
            switch result {
                case .failure(let error):
                    print(error)
                case .success(let cryptos):
                    if let cryptos = cryptos {
                        DispatchQueue.main.async {
                            self.cryptoList = cryptos.map(CryptoViewModel.init)
                        }
                    }
            }
        }
    }
    */
    
}


struct CryptoViewModel {
     
    let crypto : CryptoCurrency
    
    var id : UUID? {
        crypto.id
    }
    
    var currency : String {
        crypto.symbol
    }
    
    var price : String {
        String(crypto.current_price)
    }
    
    var logo_url : String {
        crypto.image
    }
    
    var name : String {
        crypto.name
    }
    
}
