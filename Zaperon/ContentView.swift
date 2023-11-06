//
//  ContentView.swift
//  Zaperon
//
//  Created by Ayush Narwal on 05/11/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewVM()

    @State var selectedCountry = Country(iso2: "", iso3: "", country: "", cities: [])
    @State var selectedCity = ""
    
    var body: some View {
        VStack (spacing: 20){
            Spacer()
            Text("COUNTRY")
                .fontDesign(.monospaced)
                .fontWeight(.bold)
                .font(.largeTitle)
                .foregroundStyle(Color.white)
            Picker("Select a country", selection: $selectedCountry) {
                Text("Select Country")
                ForEach(viewModel.countries, id: \.iso2) {country in
                    Text(country.country)
                        .tag(country)
                }
            }
            .onChange(of: selectedCountry, {
                selectedCity = ""
            })
            Text("Selected Country: \(selectedCountry.country)")
                .font(.title)
                .fontDesign(.rounded)
                .foregroundStyle(Color.white)
            Spacer()
            Text("CITY")
                .fontDesign(.monospaced)
                .fontWeight(.bold)
                .font(.largeTitle)
                .foregroundStyle(Color.white)
            Picker("Select a city", selection: $selectedCity) {
                Text("Select City")
                ForEach(selectedCountry.cities, id: \.self) {
                    Text($0)
                }
            }
            Text("Selected City: \(selectedCity)")
                .font(.title)
                .fontDesign(.rounded)
                .foregroundStyle(Color.white)
            Spacer()
        }
        .onAppear(perform: viewModel.fetchCountries)
        .frame(maxWidth: .infinity)
        .background(LinearGradient(colors: [.red, .yellow], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
    
}

#Preview {
    ContentView()
}
