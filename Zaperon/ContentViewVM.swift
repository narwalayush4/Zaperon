//
//  ContentViewVM.swift
//  Zaperon
//
//  Created by Ayush Narwal on 05/11/23.
//

import Foundation

extension ContentView {
    @MainActor class ContentViewVM: ObservableObject {
        
        @Published var countries: [Country] = []
        @Published var cities: [String] = []
        
        
        func fetchCountries(){
            guard let url = URL(string: "https://countriesnow.space/api/v0.1/countries") else {
                print("error in url parsing")
                return
            }
            let decoder = JSONDecoder()
            let task = URLSession.shared.dataTask(with: url){ data, response, error in
                if let data = data{
                    do{
                        let tasks = try decoder.decode(FetchedData.self, from: data)
                        DispatchQueue.main.async {
                            self.countries = tasks.data
                        }
                    }catch{
                        print(error)
                    }
                }
            }
            task.resume()
            //        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            //            if let data = data, let string = String(data: data, encoding: .utf8){
            //                print(string)
            //            }
            //        }
        }
        
        
    }
    
}
