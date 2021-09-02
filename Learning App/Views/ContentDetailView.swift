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
            CodeTextView()
            
            // Next lesson button
            if model.hasNextLesson() {
                
                Button(action: {
                    
                    model.nextLesson()
                    
                }, label: {
                    
                    ZStack {
                        
                        RectangleCard(color: Color.green)
                            .frame(height: 48)
                        
                        
                        Text("Next Lesson: \(model.currentModule!.content.lessons[model.currentLessonIndex + 1].title)")
                            .bold()
                            .foregroundColor(Color.white)
                    }
                })
                
                
            }
            else {
                
                // Show the complete button instead
                Button(action: {
                    
                    model.currentContentSelected = nil
                    
                }, label: {
                    
                    ZStack {
                        
                        RectangleCard(color: Color.green)
                            .frame(height: 48)
                        
                        Text("Complete")
                            .bold()
                            .foregroundColor(Color.white)
                    }
                })
                
            }
        }
        .padding()
        .navigationBarTitle(lesson?.title ?? "")
    }
}

struct ContentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetailView()
    }
}
