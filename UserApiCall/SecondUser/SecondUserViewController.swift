//
//  SecondUserViewController.swift
//  UserApiCall
//
//  Created by R86 on 30/05/23.
//

import UIKit
import Alamofire

class SecondUserViewController: UIViewController {

   
       
        @IBOutlet weak var tebalview: UITableView!
        var arrUser2: [User] = []
        override func viewDidLoad() {
            super.viewDidLoad()
            api()
            register()
        }
        
        func register(){
            tebalview.register(UINib(nibName: "SecondTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        }
        
        private func api(){
            AF.request("https://gorest.co.in/public/v2/users", method: .get)
                .responseData { response in
                
                    guard let apiData = response.data
                    else {return}
                    
                    if response.response?.statusCode == 200{
                    do {
                        let apiVal = try JSONDecoder().decode([User].self, from: apiData)
                        print(apiVal)
                        self.arrUser2 = apiVal
                        self.tebalview.reloadData()
                            
                    }catch{
                        
                        print(error.localizedDescription)
                    }
                }else{
                    print("Error")
                }
        }
    }
}
struct User: Decodable{
    var id: Int
    var name: String
    var email: String
    var gender: String
    var status: String
}

extension SecondUserViewController: UITableViewDelegate , UITableViewDataSource{
        
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrUser2.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SecondTableViewCell
        cell.idLabel.text = "\(arrUser2[indexPath.row].id)"
        cell.nameLabel.text = "\(arrUser2[indexPath.row].name)"
        cell.emailLabel.text = "\(arrUser2[indexPath.row].email)"
        cell.statusLabel.text = "\(arrUser2[indexPath.row].status)"

        return cell
    }
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
        
      
}


