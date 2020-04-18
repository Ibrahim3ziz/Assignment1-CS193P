//
//  Theme.swift
//  Assignment-1
//
//  Created by Ibrahim Abdul Aziz on 4/11/20.
//  Copyright © 2020 Ibrahim Abdul Aziz. All rights reserved.
//

import Foundation
import UIKit

struct Theme {
      var themeName: String
      var backgroundColor: UIColor
      var cardColor: UIColor
      var emoji: [String]
}


let sportTheme = Theme(themeName: "SPORTS", backgroundColor: #colorLiteral(red: 0, green: 0.5603182912, blue: 0, alpha: 1), cardColor: UIColor.green, emoji: ["🏓", "🎱", "🏀", "⚽️", "🏈", "🏐", "🎾", "🥎", "🥏", "🏑", "🏏", "🥅", "🥊", "🏂", "🏊‍♂️", "🧗‍♂️", "🚴‍♀️", "🎮"])

let hallowenTheme = Theme(themeName: "HALLOWEN", backgroundColor: #colorLiteral(red: 0.1921568662, green: 0.007843137719, blue: 0.09019608051, alpha: 1), cardColor: #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1), emoji: ["💀", "👻", "👽", "🧙", "🧛", "🧟", "🦇", "🕷", "🕸", "🛸", "🎃", "🎭",
"🗡", "⚰"])

let flagTheme = Theme(themeName: "FLAGS", backgroundColor:  #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), cardColor: #colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 1), emoji: ["🇦🇺", "🇦🇷", "🇩🇿", "🏳️", "🏴", "🇪🇬", "🎌", "🇯🇵", "🇱🇧", "🇧🇩", "🇧🇪", "🏴‍☠️", "🇨🇿", "🇳🇫"])

let vehicleTheme = Theme(themeName: "VEHICLES", backgroundColor: #colorLiteral(red: 0, green: 0.9914394021, blue: 1, alpha: 1), cardColor: UIColor.blue, emoji: ["🚗", "🚕", "🚛", "🚒", "🚜", "🚔", "🚍", "🚅", "🚝", "✈️", "🚂", "🚀", "🛳", "⛴", "🚢"])

let defaultTheme = Theme(themeName: "DEFAULT", backgroundColor: #colorLiteral(red: 0.9959731026, green: 1, blue: 0.8252459694, alpha: 1), cardColor: #colorLiteral(red: 0.8265820312, green: 0.7249050135, blue: 0.4632316118, alpha: 1), emoji: ["😀", "😁", "😂", "🤣", "😃", "😄", "😅",
"😍", "😘", "😗", "😙", "😚", "🙂", "🤗", "🤩", "🤔", "🤨", "😐",
"😑", "😶", "🙄", "😏", "😣", "😥", "😮", "🤐", "😯", "😪", "😫", "😴"]) 




 enum themes {
    case sport, hallowen, flag, vehicle, default_Theme
    
    var theme: Theme  {
        switch self {
        case .sport:
            return sportTheme
        case .hallowen:
            return hallowenTheme
        case .flag:
            return flagTheme
        case .vehicle:
            return vehicleTheme
        case .default_Theme:
            return defaultTheme
        }
        
    }
}



