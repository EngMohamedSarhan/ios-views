//
//  SlotsView.swift
//  screens
//
//  Created by Mohamed Sarhan on 28/07/2022.
//

import SwiftUI

let shapes = ["apple", "cherry", "star"]

@objc(SlotsViewManager)
@available(iOS 14.0, *)
class SlotsViewManager: RCTViewManager {
  private var vc = UIHostingController(rootView: SlotsView())

  override func view() -> UIView {
    return vc.view
  }
}

@available(iOS 14.0, *)
struct SlotsView: View {
    @State var credits = 1000
    @State var slots = shapes

    func getRandomShape() -> String {
        return shapes[Int.random(in: 0...2)]
    }
    
    func getIsWin() -> Bool {
        var isWin = true
        
        for i in 1...2 {
            if slots[i] != slots[i - 1] {
                isWin = false
                break
            }
        }
        
        return isWin
    }
    
    func handleSpin() {
        for i in 0...2 {
            let slot = getRandomShape()
            slots[i] = slot
        }
        
        if getIsWin() {
            credits += 100
        }
        else {
            credits -= 10
        }
    }
    
    var body: some View {
        VStack() {
            Text("SwiftUI Slots!")
                .font(.largeTitle)
            Spacer()
            Text("Credits: " + String(credits))
            Spacer()
            HStack() {
                Spacer()
                Image(slots[0]).resizable()
                    .aspectRatio(contentMode: .fit)
                Spacer()
                Image(slots[1]).resizable()
                    .aspectRatio(contentMode: .fit)
                Spacer()
                Image(slots[2]).resizable()
                    .aspectRatio(contentMode: .fit)
                Spacer()
            }
            Spacer()
            Button("Spin", action: handleSpin).padding(.horizontal, 30).padding(.vertical, 8).background(Color.pink).foregroundColor(Color.white).cornerRadius(25)
            Spacer()
        }

    }
}

@available(iOS 14.0, *)
struct SlotsView_Previews: PreviewProvider {
    static var previews: some View {
        SlotsView()
    }
}
