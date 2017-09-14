//
//  ViewController.swift
//  proje
//
//  Created by MacMini on 5.09.2017.
//  Copyright © 2017 MacMini. All rights reserved.
//

import UIKit
import RevealingSplashView

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    //outlets
    @IBOutlet weak var tamambtn: UIButton!
    @IBOutlet weak var butonLabel: UIButton!
    @IBOutlet weak var tableview: UITableView!
    
    
    //variable
    var telMarka=["Samsung","Apple","Nokia","Sony","Huwawei"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let revealingSplashView = RevealingSplashView(iconImage: UIImage(named: "294700-32")!,iconInitialSize: CGSize(width: 80, height: 80), backgroundColor: UIColor(red:0.11, green:0.56, blue:0.95, alpha:1.0))
        
        revealingSplashView.animationType = SplashAnimationType.squeezeAndZoomOut
        
        self.view.addSubview(revealingSplashView)
        revealingSplashView.startAnimation(){
            print("Completed")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
    
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return telMarka.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell=tableView.dequeueReusableCell(withIdentifier: "mycell", for: indexPath)
        cell.textLabel?.text=telMarka[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell=tableView.cellForRow(at: indexPath)
        butonLabel.setTitle(cell?.textLabel?.text, for: .normal)
        self.tableview.isHidden=true
        self.tamambtn.isHidden=false
        
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        self.tableview.isHidden = !self.tableview.isHidden
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let gidendeger : AnaViewController=segue.destination as! AnaViewController
        
        gidendeger.labelText = butonLabel.currentTitle!  }
    
    

}

