//
//  ViewController.swift
//  recipe
//
//  Created by chia on 2021/3/9.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var visualEffectView: UIVisualEffectView!
    @IBOutlet var addListView: UIView!
    var effect: UIVisualEffect!
    override func viewDidLoad() {
       
        effect = visualEffectView.effect
        visualEffectView.effect = nil
        //addListView.layer.cornerRadius = 10
       
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func animatedIn() {
        self.view.addSubview(addListView)
        addListView.center = self.view.center
        addListView.transform = CGAffineTransform.init(scaleX: 2, y: 2)
        addListView.alpha = 0
        UIView.animate(withDuration: 0.3) {
            self.visualEffectView.effect = self.effect
            self.addListView.alpha = 1 //alpha是不透明度（不透明）
            self.addListView.transform = CGAffineTransform.identity
        }
    }
    func animatedOut() {
        UIView.animate(withDuration: 0.3, animations: {
            self.addListView.transform = CGAffineTransform.init(scaleX: 2, y: 2)
            self.addListView.alpha = 0//透明
            self.visualEffectView.effect = nil
        }) { (success: Bool) in
            self.addListView.removeFromSuperview()
        }
    }
    @IBAction func addList(_ sender: Any) {
        animatedIn()
    }
    @IBAction func dissmissPopup(_ sender: Any) {
        animatedOut()
    }


}

