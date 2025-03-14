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
//    @State private var down = false
    @State private var isPlaying = false
    @State private var isDayTime = true
    @State private var color = Color.red
    @State private var isLiked = false
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
                            .contentTransition(.numericText(value: Double(number)))
                        HStack {
                            Button {
//                                down = true
                                number -= 1
                            } label: {
                                Image(systemName: "minus")
                                    .frame(width: 30, height: 30)
                            }
                            Button {
//                                down = false
                                number += 1
                            } label: {
                                Image(systemName: "plus")
                                    .frame(width: 30, height: 30)
                            }
                        }
                        .font(.largeTitle)
                        .buttonStyle(.borderedProminent)
                    }
                    .animation(.default, value: number)
                }
                GroupBox(".symbolEffect"){
                    Image(systemName: isPlaying ? "pause.circle" : "play.circle")
                        .font(.largeTitle)
                        .onTapGesture {
                            withAnimation {
                                isPlaying.toggle()
                            }
                        }
                        .contentTransition(.symbolEffect(.replace))
                }
                GroupBox(".opacity"){
                    Image(systemName: isDayTime ? "sun.max.fill" : "moon.fill")
                        .font(.largeTitle)
                        .foregroundStyle(isDayTime ? .orange : .yellow)
                        .frame(height: 40)
                        .onTapGesture {
                            withAnimation(.linear(duration: 1)) {
                                isDayTime.toggle()
                            }
                        }
                        .contentTransition(.opacity)
                }
                GroupBox(".interpolate"){
                    Text("Tap to animate")
                        .foregroundStyle(color)
                        .font(.system(size: color == .red ? 36 : 40))
                        .onTapGesture {
                            withAnimation(.easeIn(duration: 2.0)) {
                                color = color == .red ? .blue : .red
                            }
                        }
                        .contentTransition(.interpolate)
                }
                GroupBox(".symbolEffect with options"){
                    Image(systemName: isLiked ? "heart.fill" : "heart")
                        .foregroundStyle(isLiked ? .red : .gray)
                        .font(.system(size: 80))
                        .padding()
                        .symbolEffect(.bounce, value: isLiked)
                        .onTapGesture {
                            withAnimation {
                                isLiked.toggle()
                            }
                        }
                        .contentTransition(.symbolEffect(.replace, options: .speed(2.0)))
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
