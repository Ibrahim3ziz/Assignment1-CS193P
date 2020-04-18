//
//  ThemeChooserVC.swift
//  Assignment-1
//
//  Created by Ibrahim Abdul Aziz on 4/17/20.
//  Copyright © 2020 Ibrahim Abdul Aziz. All rights reserved.
//

import UIKit

class ThemeChooserVC: UIViewController, UISplitViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func awakeFromNib() {
        splitViewController?.delegate = self
    }
    
    // making it open at theme chooser first
    func splitViewController(
        _ splitViewController: UISplitViewController,
        collapseSecondary secondaryViewController: UIViewController,
        onto primaryViewController: UIViewController
    ) -> Bool {
        if let concentrationVC = secondaryViewController as? ConcentrationVC {
            if concentrationVC.currentTheme == nil {
                return false
                //don't collapse secondaryVC onto the primary
            }
        }
           return true
    }
    
    // MARK: - Navigation

   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let identifier = segue.identifier else {return}
        
        switch identifier {
            
        case "Choose Sport Theme":
            if let concentrationVC = segue.destination as? ConcentrationVC  {
                let sportsTheme = themes.sport
                concentrationVC.currentTheme = sportsTheme
            }
            
        case "Choose Hallowen Theme":
            if let concentrationVC = segue.destination as? ConcentrationVC{
                let hallowenTheme = themes.hallowen
                concentrationVC.currentTheme = hallowenTheme
            }
            
        case "Choose Flag Theme":
            if let concentrationVC = segue.destination as? ConcentrationVC {
                let flagTheme = themes.flag
                concentrationVC.currentTheme = flagTheme
            }
            
        case "Choose Vehicle Theme":
            if let concentrationVC = segue.destination as? ConcentrationVC {
                let vehicleTheme = themes.vehicle
                concentrationVC.currentTheme = vehicleTheme
            }

        default:
            break
        }

    }

}


