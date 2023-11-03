//
//  PostData.swift
//  my-hacker-news
//
//  Created by Raja Shravan on 2023-11-02.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    // computed props
    // alias
    var id: String {
        return self.objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}
