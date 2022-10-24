//
//  CryptoDetailView.swift
//  CryptoSUI
//
//  Created by Tunay Toksöz on 24.10.2022.
//

import SwiftUI

struct CryptoDetailView: View {
    @State var crypto: CryptoCurrency
    
    var body: some View {
        VStack{
            Text(crypto.name).padding()
            Text(crypto.symbol).padding()
            Text(String(crypto.current_price)+" $").padding()
            AsyncImage(url: URL(string: crypto.image)) { image in
                image.resizable().frame(width: 120, height: 120, alignment: .leading)
            } placeholder: {
                ProgressView()
            }.frame(maxWidth: .infinity).padding().padding()
        }
    }
}

struct CryptoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CryptoDetailView(crypto: CryptoCurrency(symbol: "", current_price: 1.0, image: "", name: ""))
    }
}
