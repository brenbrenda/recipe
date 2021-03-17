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
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var TurnOnOff: UISwitch!
    @IBOutlet weak var Slider: UISlider!
    var effect: UIVisualEffect!
    override func viewDidLoad() {
        effect = visualEffectView.effect
        visualEffectView.effect = nil
        visualEffectView.isHidden = true
        //addListView.layer.cornerRadius = 10
       
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    


    @IBAction func OPEN(_ sender: UISwitch) {
        if sender.isOn == true {
            view.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        } else
        {
            view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
    
    
 

    @IBOutlet weak var labell: UILabel!
    var fontSize: Float = 0.0
    @IBAction func SliderValue(_ sender: UISlider) {
        let senderValue = CGFloat(sender.value)
        labell.font = UIFont(name: labell.font.fontName, size: senderValue)
    }
    @IBAction func changePage(_ sender: UIPageControl) {
        let point = CGPoint(x: scrollView.bounds.width * CGFloat(sender.currentPage), y :0)
        scrollView.setContentOffset(point, animated: true)
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
        visualEffectView.isHidden = false
        animatedIn()
    }
    @IBAction func dissmissPopup(_ sender: Any) {
        animatedOut()
        visualEffectView.isHidden = true
    }
}
extension ViewController: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView:UIScrollView) {
        let page = scrollView.contentOffset.x / scrollView.bounds.width
        pageControl.currentPage = Int(page)
        
    }
}

