//
//  WarView.swift
//  screens
//
//  Created by Mohamed Sarhan on 28/07/2022.
//

import SwiftUI

@objc(WarViewManager)
@available(iOS 14.0, *)
class WarViewManager: RCTViewManager {
  private var vc = UIHostingController(rootView: WarView())

  override func view() -> UIView {
    return vc.view
  }
}



@available(iOS 14.0, *)
struct WarView: View {
  @State var playerCard = "card3"
  @State var cpuCard = "card9"
  @State var playerScore = 0
  @State var cpuScore = 0
  
  var body: some View {
      VStack {
          Spacer()
          Image("logo")
          Spacer()
          HStack {
              Spacer()
              Image(playerCard)
              Spacer()
              Image(cpuCard)
              Spacer()
          }
          Spacer()
          Button(
              action: {
                  let playerRand = Int.random(in: 2...14)
                  let cpuRand = Int.random(in: 2...14)

                  playerCard = "card" + String(playerRand)
                  cpuCard = "card" + String(cpuRand)
                  
                  if cpuRand > playerRand {
                      cpuScore += 1
                  } else if cpuRand < playerRand {
                      playerScore += 1
                  }
              },
              label: {
                  Image("dealbutton")
          })
          Spacer()
          HStack {
              Spacer()
              VStack {
                  Text("Player").padding().foregroundColor(Color.white).font(.headline)
                  Text(String(playerScore)).foregroundColor(Color.white).font(.largeTitle)
              }
              Spacer()
              VStack {
                  Text("CPU").padding().foregroundColor(Color.white).font(.headline)
                  Text(String(cpuScore)).foregroundColor(Color.white).font(.largeTitle)
              }
              Spacer()
          }
          Spacer()
      }.background(Image("background").ignoresSafeArea())
  }
}

@available(iOS 14.0, *)
struct WarView_Previews: PreviewProvider {
    static var previews: some View {
        WarView()
    }
}
