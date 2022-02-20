//
//  ContentView.swift
//  Slots Game
//
//  Created by Eugene on 26.11.21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var symbols = ["apple", "star", "cherry"]
    @State private var numbers = [0, 0, 0]
    @State private var backgrounds = [Color.white, Color.white, Color.white]
    @State private var credits = 1000
    private var betAmount = 5
    
    var body: some View {
        
        ZStack {
            
            // Background
            Rectangle()
                .foregroundColor(Color(red: 200/255, green: 143/255, blue: 32/255))
                .edgesIgnoringSafeArea(.all)
            
            Rectangle()
                .foregroundColor(Color(red: 228/255, green: 195/255, blue: 76/255))
                .rotationEffect(Angle(degrees: 45))
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Spacer()
                // Title
                HStack{
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    
                    Text("Lucky Slots")
                        .bold()
                        .foregroundColor(.white)
                    
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                } .scaleEffect(2)
                
                Spacer()
                // Credits counter
                Text("Credits: " + String(credits))
                    .foregroundColor(.black)
                    .padding(.all, 10)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(20)
                
                Spacer()
                
                // Cards
                HStack{
                    
                    Spacer()
                    
                    CardView(symbol: $symbols[numbers[0]], background: $backgrounds[0])
                    
                    CardView(symbol: $symbols[numbers[1]], background: $backgrounds[1])
                    
                    CardView(symbol: $symbols[numbers[2]], background: $backgrounds[2])
                    
                    Spacer()
                }
                
                Spacer()
                
                // Button
                Button {
                    
                    // Set the backgrounds back to white
                    self.backgrounds[0] = Color.white
                    self.backgrounds[1] = Color.white
                    self.backgrounds[2] = Color.white
                    
                    // Chenge the images
                    
                    self.numbers[0] = Int.random(in: 0...symbols.count - 1)
                    
                    self.numbers[1] = Int.random(in: 0...symbols.count - 1)
                    
                    self.numbers[2] = Int.random(in: 0...symbols.count - 1)
                    
                    
                    // Check winnings
                    
                    if self.numbers[0] == self.numbers[1] && self.numbers[1] == self.numbers [2] {
                        
                        // Won
                        
                        self.credits += self.betAmount * 10
                        
                        // Update backgrounds to green
                        self.backgrounds[0] = Color.green
                        self.backgrounds[1] = Color.green
                        self.backgrounds[2] = Color.green
                        
                    } else {
                        self.credits -= self.betAmount
                    }
                    
                } label: {
                    Text("Spin")
                        .bold()
                        .foregroundColor(.white)
                        .padding(.all, 10)
                        .padding([.leading, .trailing], 30)
                        .background(Color.pink)
                        .cornerRadius(20)
                }
                
                Spacer()
                
            }
            
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
