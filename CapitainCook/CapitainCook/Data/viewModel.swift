//
//  viewModel.swift
//  CapitainCook
//
//  Created by Leander Van Aarde on 2022/10/04.
//

import Foundation
import Firebase

class viewModel: ObservableObject{
    @Published var allRecipes: [recipes] = []
    
    func getData(){
        print("Hey hey hey")
        guard let url = URL(string: "https://captaincook.s3.af-south-1.amazonaws.com/AllRecipes.JSON") else { return }
        
        let urlRequest = URLRequest(url: url)
        
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            print("Data Task thing")
            guard let response = response as? HTTPURLResponse else {return}
            print(response.statusCode)
            if response.statusCode == 200 {
                guard let data = data else {return}
                
                DispatchQueue.main.async {
                    do {
                        let decodeItems = try JSONDecoder().decode([recipes].self, from: data)
                        
                        self.allRecipes = decodeItems
    
                        print("Retrieved Recipes")
                        print(decodeItems)
                    } catch let error {
                        print("Shit, it didn't work: \(error)")
                    }
                }
            }
        }
        
        dataTask.resume()
    }
}
