//
//  ContentModel.swift
//  Learning App
//
//  Created by Liam Heskey on 19/08/2021.
//

import Foundation

class ContentModel: ObservableObject {
    
    @Published var modules = [Module]()
    
    var styleData: Data?
    
    init() {
        
        getLocalData()
        
    }
    func getLocalData() {
        
       // Get a URL to the json file
        let jsonUrl = Bundle.main.url(forResource: "data", withExtension: "json")
        
        do {
        // Read the file in to a data object
        let jsonData = try Data(contentsOf: jsonUrl!)
            // Try to decode the json file into an array of modules
            let jsonDecoder = JSONDecoder()
            let modules = try jsonDecoder.decode([Module].self, from: jsonData)
        
            // Assign parsed modules to modules property
            self.modules = modules
        }
        catch {
            
            print("Couldnt parse json data")
            
        }
        
       // Parse the style data
        let styleUrl = Bundle.main.url(forResource: "style", withExtension: "html")
        
        do{
            
           let styleData = try Data(contentsOf: styleUrl!)
            
            self.styleData = styleData 
            
        }
        catch {
           
            // Log error
            print("Couldn't parse style data")
            
        }
    }
}
