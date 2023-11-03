//
//  ContentView.swift
//  my-hacker-news
//
//  Created by Raja Shravan on 2023-11-02.
//

import SwiftUI

struct ContentView: View {
    
    // observer design pattern
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(self.networkManager.posts) { post in
                HStack {
                    Text(String(post.points))
                    Text(post.title)
                }
                
            } 
            .navigationTitle("Hacker News")
        }
        .onAppear {
            self.networkManager.fetchData()
        }
    }
}
//
//let posts = [
//    Post(id: "1", title: "Hello"),
//    Post(id: "2", title: "Bonjour"),
//    Post(id: "3", title: "Hola")
//]

#Preview {
    ContentView()
}
