//
//----------------------------------------------
// Original project: ContentTransitionDemo
// by  Stewart Lynch on 2025-03-12
//
// Follow me on Mastodon: https://iosdev.space/@StewartLynch
// Follow me on Threads: https://www.threads.net/@stewartlynch
// Follow me on Bluesky: https://bsky.app/profile/stewartlynch.bsky.social
// Follow me on X: https://x.com/StewartLynch
// Follow me on LinkedIn: https://linkedin.com/in/StewartLynch
// Email: slynch@createchsol.com
// Subscribe on YouTube: https://youTube.com/@StewartLynch
// Buy me a ko-fi:  https://ko-fi.com/StewartLynch
//----------------------------------------------
// Copyright © 2025 CreaTECH Solutions. All rights reserved.


import SwiftUI

struct ContentView: View {
    @State private var number = 0
    var body: some View {
        NavigationStack {
            VStack{
                GroupBox(".numericText"){
                    HStack {
                        Text("\(number)")
                            .font(.system(size: 50))
                            .monospacedDigit()
                            .frame(width: 100, height: 100)
                            .background(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1))
                        HStack {
                            Button {
                                number -= 1
                            } label: {
                                Image(systemName: "minus")
                                    .frame(width: 30, height: 30)
                            }
                            Button {
                                number += 1
                            } label: {
                                Image(systemName: "plus")
                                    .frame(width: 30, height: 30)
                            }
                        }
                        .font(.largeTitle)
                        .buttonStyle(.borderedProminent)
                    }
                }
                GroupBox(".symbolEffect"){
                    
                }
                GroupBox(".opacity"){
                    
                }
                GroupBox(".interpolate"){
                    
                }
                GroupBox(".symbolEffect with options"){
                    
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("ContentTransition")
        }
    }
}

#Preview {
    ContentView()
}
