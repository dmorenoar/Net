//
//  ViewController.swift
//  Net
//
//  Created by DAM on 14/02/2019.
//  Copyright © 2019 DAM. All rights reserved.
//

import UIKit



class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! TableViewCellCustom
        
        myCell.txt.text = movies[indexPath.row].titulo
        
        tools.getImage(imagenURL: movies[indexPath.row].imagen) { (imgRecovered) -> Void in
            if let imagen = imgRecovered {
                DispatchQueue.main.async {
                    myCell.img.image = imagen
                    return
                }
            }
        }

        return myCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }

    @IBOutlet weak var tableView: UITableView!
    var movies:[Movie] = [Movie]()
    var tools:Tools = Tools()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tools.parseCSVMovie(movies: &movies)
        
        tableView.delegate = self
        tableView.dataSource = self
    }


}

