//
//  ContentDetailView.swift
//  Learning App
//
//  Created by Liam Heskey on 22/08/2021.
//

import SwiftUI
import AVKit

struct ContentDetailView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        let lesson = model.currentLesson
        let url = URL(string: Constants.videoHostURL + (lesson?.video ?? ""))
        
        VStack{
            
            if url != nil {
                VideoPlayer(player:AVPlayer(url: url!))
                    .cornerRadius(10)
            }
            
            // Description
            
            // Next lesson button
            if model.hasNextLesson() {
                
                Button(action: {
                    
                    model.nextLesson()
                    
                }, label: {
                    
                    ZStack {
                        
                        Rectangle()
                            .foregroundColor(Color.green)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            .frame(height: 48)
                        
                        
                        Text("Next Lesson: \(model.currentModule!.content.lessons[model.currentLessonIndex + 1].title)")
                            .bold()
                            .foregroundColor(Color.white)
                    }
                })
                
                
            }
        }
        .padding()
    }
}

struct ContentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetailView()
    }
}
