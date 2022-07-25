//
//  ContentView.swift
//  Memorize
//
//  Created by Tenzin wangyal on 7/23/22.
//

import SwiftUI

struct ContentView: View {
    @State var emojis = ["🚲","🚗", "✈️" , "🚀","🚁","🚂","🛳","🛸","🛶","🚒","🚑","🚌","🏍","🚤","🛵","🚜","🚛","🦼","🚔","🛻","⛵️","🚐","🛺","🚠"]
    @State var emojiCount = 23 //starts from 0, so there 24 elements
    
    var body: some View {
        VStack{
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]){
            ForEach (emojis[0...emojiCount],id: \.self) { emoji in
                CardView(cardIcon: emoji)
                    .aspectRatio(2/3,contentMode: .fill)
                    
            }
        }
    }
            .foregroundColor(.red)
            Spacer()
            HStack{
                removeButton
                Spacer()
                addButton
            }
            .font(.largeTitle)
            .padding(.horizontal)
            
    }
        
        .padding()
        
        
}
        
    var addButton: some View{
        Button{
            if emojiCount < emojis.count - 1 {//cant add more than array
            emojiCount += 1
            }
        }label: {
            Image(systemName: "plus.circle")
                .foregroundColor(.blue)
        }
    }
    var removeButton: some View{
        Button {
            if emojiCount > 1{ // cant subtract lower than 1
            emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
                .foregroundColor(.red)
                
                        
        }
    }
        
    
}

struct CardView:View{
    @State var isFaceUp: Bool = true
    var cardIcon: String
    
    
    var body: some View {
     ZStack {
         let shape = RoundedRectangle(cornerRadius: 25)
         if isFaceUp{
             shape.fill().foregroundColor(.white)
             shape.stroke(lineWidth: 5)
             Text(cardIcon).font(.largeTitle)
     }
            else{
                
                shape.fill()
                
            }
       }
     .onTapGesture {
         isFaceUp = !isFaceUp
             
     }
    }
}







struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
       
            
    }
}
