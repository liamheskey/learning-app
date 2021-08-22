//
//  ContentView.swift
//  Learning App
//
//  Created by Liam Heskey on 19/08/2021.
//

import SwiftUI

struct HomeView: View {
    
   @EnvironmentObject var model: ContentModel
    
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
