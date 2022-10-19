//
//  ContentView.swift
//  CryptoSUI
//
//  Created by Tunay Toksöz on 21.09.2022.
//

import SwiftUI


struct MainView: View {
    
    
    @ObservedObject var cryptoListViewModel : CryptoListViewModel
  
    init() {
        self.cryptoListViewModel = CryptoListViewModel()
    }
    
    var body: some View {
        
        let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd")
        
        NavigationView {
            List(cryptoListViewModel.cryptoList, id:\.id) { crypto in
                    HStack{
                        VStack{
                            Text(crypto.currency).frame(maxWidth: .infinity, alignment: .leading)
                            Text(crypto.name).frame(maxWidth: .infinity,alignment: .leading)
                            Text(crypto.price).frame(maxWidth: .infinity,alignment: .leading)
                        }
                        AsyncImage(url: URL(string: crypto.logo_url)) { image in
                            image.resizable().frame(width: 40, height: 40, alignment: .leading)
                        } placeholder: {
                            ProgressView()
                        }.frame(maxWidth: .infinity).padding()
                    }
                
                
            }.navigationTitle("Cryptos")
        }.task {
            await cryptoListViewModel.downloadCryptosContinuation(url: url!)
            //await cryptoListViewModel.downloadCryptosAsync(url: url!)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
