//
//  ContentView.swift
//  Learning App
//
//  Created by Liam Heskey on 22/08/2021.
//

import SwiftUI

struct ContentView: View {
   
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        ScrollView{
            
            LazyVStack {
                // Confirm that currentModule is set
                if model.currentModule != nil {
                    ForEach(0..<model.currentModule!.content.lessons.count) { index in
                        
                      ContentViewRow(index: index)
                    
                    
                  }
                }
                
            }
            .padding()
            .navigationTitle("Learn \(model.currentModule?.category ?? "")")
        }
    }
}


