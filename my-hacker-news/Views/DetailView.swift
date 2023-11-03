//
//  DetailView.swift
//  my-hacker-news
//
//  Created by Raja Shravan on 2023-11-03.
//

import SwiftUI

struct DetailView: View {
    
    let url: String?
    
    var body: some View {
        WebView(urlString: self.url)
    }
}

#Preview {
    DetailView(url: "https://www.google.com/")
}
