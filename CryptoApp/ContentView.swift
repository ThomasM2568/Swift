//
//  ContentView.swift
//  CryptoApp
//
//  Created by devxcode on 24/09/2024.
//

import SwiftUI
struct ContentView: View {
    
    @State private var Convert: Bool = false
    
    var body: some View {
        ZStack {
            Color(.black)
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Text("Crypto App")
                        .font(.largeTitle)
                        .bold()
                        .foregroundStyle(.green)
                    Button {
                        
                    }label: {
                        Image(systemName: "arrow.clockwise.circle")
                            .font(.title)
                            .foregroundStyle(.green)
                    }
                }
                    Date_view(date: "Tuesday September 24, 2024")
                    Spacer()
                    HStack(spacing:20) {
                        Crypto_view(name_crypto: "BIT", image_name: "bitcoin", dollar_value: Convert ? 45 : 51)
                        Crypto_view(name_crypto: "ETH", image_name: "ether", dollar_value: Convert ? 18 : 21)
                        Crypto_view(name_crypto: "XRP", image_name: "xrp", dollar_value: Convert ? 5 : 6)
                        Crypto_view(name_crypto: "XLM", image_name: "xlm", dollar_value: Convert ? 9 : 11)
                    }
                    Spacer()
                    
                    Button {
                        print("Button tapped")
                        Convert.toggle()
                    }label:{
                        Text(Convert ? "Convert in $":"Convert in €")
                            .frame(width: 200, height: 50)
                            .background(.green)
                            .foregroundStyle(.white)
                            .cornerRadius(10)
                    }
                    
                    Spacer()
                }
            }
        }
    }

struct Date_view: View {
    
    var date: String
    
    var body: some View {
        HStack {
            Image(systemName: "calendar.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
                .foregroundStyle(.green)
            Text(date)
                .foregroundStyle(.white)
        }
    }
}
    struct Crypto_view: View {
        var name_crypto: String
        var image_name: String
        var dollar_value: Int
        var Convert: Bool
        
        var body: some View {
            VStack {
                Text(name_crypto)
                    .foregroundStyle(.white)
                Image(image_name)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                Text(Convert ? "€\(dollar_value)k":"$\(dollar_value)k")
                Text("$\(dollar_value)k")
                    .foregroundStyle(.white)
            }
        }
    }
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
