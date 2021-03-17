//
//  recipeViewController.swift
//  recipe
//
//  Created by chia on 2021/3/10.
//

import UIKit
import WebKit

class recipeViewController: UIViewController {

    @IBOutlet weak var myRecipe: WKWebView!
    @IBOutlet weak var Reload: UIActivityIndicatorView!
    let Str1 = "https://www.goodhousekeeping.com/food-recipes/easy/g871/quick-breakfasts/"
    let Str2 = "https://www.allrecipes.com/recipe/279909/broiled-paprika-and-lemon-pepper-chicken-breasts/"
    let Str3 = "https://www.allrecipes.com/gallery/fancy-casseroles/"
   
    
    
    @IBAction func mySegmentedAction(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            Reload.startAnimating()
            if let url = URL(string: Str1) {
                let request = URLRequest(url: url)
                myRecipe.load(request)
                Reload.stopAnimating()
            }
        } else if sender.selectedSegmentIndex == 1 {
            Reload.startAnimating()
            if let url = URL(string: Str2) {
                let request = URLRequest(url: url)
                myRecipe.load(request)
                Reload.stopAnimating()
            }
        } else if sender.selectedSegmentIndex == 2 {
            Reload.startAnimating()
            if let url = URL(string: Str3) {
                let request = URLRequest(url: url)
                myRecipe.load(request)
                Reload.stopAnimating()
            }
        }
    }
    
    /*func Recipe(_ Recipe: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        Reload.startAnimating()
    }
    
    func Recipe(_ Recipe: WKWebView, didFinish navigation: WKNavigation!) {
        Reload.stopAnimating()
    }*/
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
