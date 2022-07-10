//
//  ContentView.swift
//  Slots
//
//  Created by Sarah Casagrande on 7/10/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var slot1 = "apple"
    @State var slot2 = "cherry"
    @State var slot3 = "star"
    
    @State var winnerText = ""
    @State var credits = 0
    
    var body: some View {
        ZStack {
            
            Image("background")
                .ignoresSafeArea(.all)
            
            VStack(spacing: 20.0) {
                
                Spacer()
                
                Text("Slots!")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.white)
                
                Text("Credits: " + String(credits))
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                
                Spacer()
                
                HStack {
                    Spacer()
                    Image(slot1)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Image(slot2)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Image(slot3)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Spacer()
                }

                Spacer()
                HStack {
                    Button("Spin!") {
                        
                        if credits == 0 {
                            return winnerText = "You don't have any more coins!"
                        }
                        
                        credits -= 25
                        
                        let slot1Random = Int.random(in: 1...3)
                        let slot2Random = Int.random(in: 1...3)
                        let slot3Random = Int.random(in: 1...3)
                        
                        switch slot1Random {
                            case 1:
                                slot1 = "apple"
                            case 2:
                                slot1 = "cherry"
                            case 3:
                                slot1 = "star"
                            default:
                                slot1 = "apple"
                        }
                        
                        switch slot2Random {
                            case 1:
                                slot2 = "apple"
                            case 2:
                                slot2 = "cherry"
                            case 3:
                                slot2 = "star"
                            default:
                                slot2 = "apple"
                        }
                        
                        switch slot3Random {
                            case 1:
                                slot3 = "apple"
                            case 2:
                                slot3 = "cherry"
                            case 3:
                                slot3 = "star"
                            default:
                                slot3 = "apple"
                        }
                        
                        if slot1 == slot2 && slot2 == slot3 {
                            winnerText = "3 in a row! You win 200 coins."
                            credits += 200
                        } else if slot1 == slot2 || slot2 == slot3 {
                            winnerText = "2 in a row! You win 50 coins."
                            credits += 50
                        } else {
                            winnerText = "Sorry! Try again."
                        }
                    }
                    .padding()
                    // Then adjust the left and right padding to be bigger
                    .padding([.leading, .trailing], 30)
                    .foregroundColor(.white)
                    .background(Color(.systemTeal))
                    .cornerRadius(25)
                .font(.system(size: 18, weight: .bold, design: .default))
                    
                    Button("Reset") {
                        credits = 1000
                        winnerText = ""
                    }
                    .padding()
                    // Then adjust the left and right padding to be bigger
                    .padding([.leading, .trailing], 30.0)
                    .foregroundColor(.white)
                    .background(Color(.systemRed))
                    .cornerRadius(25)
                .font(.system(size: 18, weight: .bold, design: .default))
                    
                }
                
                Text(winnerText)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                
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
