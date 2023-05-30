import UIKit
import Alamofire

class FirstUserViewController: UIViewController {
   
    @IBOutlet weak var tebalview: UITableView!
    var arrUser1: [WelcomeElement] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        api()
        register()
    }
    
    func register(){
        tebalview.register(UINib(nibName: "FirstTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    private func api(){
        AF.request("https://jsonplaceholder.typicode.com/posts", method: .get)
            .responseData { response in
            
                guard let apiData = response.data
                else {return}
                
                if response.response?.statusCode == 200{
                    do {
                        let apiVal = try JSONDecoder().decode([WelcomeElement].self, from: apiData)
                        print(apiVal)
                        self.arrUser1 = apiVal
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
struct WelcomeElement: Decodable{
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

extension FirstUserViewController: UITableViewDelegate , UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrUser1.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FirstTableViewCell
        cell.idLabel.text = "\(arrUser1[indexPath.row].id)"
        cell.bodyLabel.text = "\(arrUser1[indexPath.row].body)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
  
}
