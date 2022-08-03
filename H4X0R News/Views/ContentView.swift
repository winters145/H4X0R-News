//
//  ContentView.swift
//  H4X0R News
//
//  Created by Jack Winterschladen on 03/08/2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        
        
        NavigationView {
            List(networkManager.posts) { post in
                if let url = post.url {
                    
                    Link(destination: URL(string: url)!) {
                        HStack {
                            Text(String(post.points))
                                .foregroundColor(Color("TextColour"))
                            Text(post.title).foregroundColor(Color("TextColour"))
                            Spacer()
                            Text(">")
                                .fontWeight(.bold)
                                .foregroundColor(Color.blue)
                        }
                    }
                    .foregroundColor(.black)
                }
            }
            .navigationTitle("H4X0R NEWS")
        }
        .onAppear {
            networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
