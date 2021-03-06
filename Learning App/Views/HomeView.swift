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
        
        NavigationView {
            VStack(alignment: .leading) {
                
                Text("What do you want to do today?")
                    .padding(.leading, 20)
                
                ScrollView {
                    
                    LazyVStack {
                        
                        ForEach(model.modules) { module in
                            
                            VStack(spacing: 20) {
                                
                                NavigationLink(
                                    destination: ContentView()
                                        .onAppear(perform: {
                                            model.beginModule(module.id)
                                          
                                        }),
                                    tag: module.id,
                                    selection: $model.currentContentSelected,
                                    label: {
                                        HomeViewRow(image: module.content.image, title: "Learn \(module.category)", description: module.content.description, count: " \(module.content.lessons.count) lessons", time: module.content.time)
                                    })
                                
                                NavigationLink(destination: TestView().onAppear(perform: {
                                    model.beginTest(moduleid: module.id)
                                }), tag: module.id, selection: $model.currentTestSelection) {
                                    HomeViewRow(image: module.test.image, title: "\(module.category) Test", description: module.test.description, count: " \(module.test.questions.count) lessons", time: module.test.time)
                                    
                                }
                                NavigationLink(destination: EmptyView()) {
                                    
                                    EmptyView()
                                }
                            }
                        }
                    }
                    .padding()
                    .accentColor(.black)
                    
                }
            }
            .navigationTitle("Get Started")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ContentModel())
    }
}
