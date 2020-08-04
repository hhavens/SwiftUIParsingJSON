//
//  ContentView.swift
//  SwiftUIParsingJSON
//
//  Created by Henry Havens on 8/4/20.
//  Copyright © 2020 Henry Havens. All rights reserved.
//

import SwiftUI

struct Country: Decodable {
    var country: String
    var code:String
}

struct ContentView: View {
    
    @State private var countryData = [Country]()
    
    var body: some View {
        NavigationView {
        List(countryData, id: \.code) { item in
            NavigationLink(destination: CountryDetail(country: item)) {
            HStack() {
                Text(item.country)
                    .font(.headline)
                Text(item.code)
                    .font(.footnote)
                }
            }.navigationBarTitle("Country List")
            
        }.onAppear(perform: loadData)
        }
    }
}

extension ContentView {
    func loadData() {
        guard let url = URL(string: "https://kaleidosblog.s3-eu-west-1.amazonaws.com/json/tutorial.json") else {
            return
        }
        
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response,error in
            if let data = data {
                if let response_obj = try?
                    JSONDecoder().decode([Country].self, from: data) {
                    DispatchQueue.main.async {
                        self.countryData = response_obj
                    }
                }
            }
        }.resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
