import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    let ToDoListBonus = [
        "MonkeyType",
        "MonkeyType",
        "MonkeyType",
        "MonkeyType",
        "MonkeyType",
        "MonkeyType",
        "MonkeyType",
        "MonkeyType",
        "MonkeyType",
        "MonkeyType"
    ]
    
    var toDoView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.layer.cornerRadius = 16
        return view
    }()
    
    var toDoLabel: UILabel = {
        let label = UILabel()
        label.text = "TO DO (10)"
        label.textColor = .white
        return label
    }()
    
    var navBar = UIView()
    
    var navTitle: UILabel = {
        let label = UILabel()
        label.text = "Buy groceries"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    var complete: UILabel = {
        let label = UILabel()
        label.text = "COMPLETE (0)"
        label.textColor = .gray
        return label
    }()
    
    var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
   
    
    var Description: UILabel = {
        let label = UILabel()
        label.text = "Created on Sep 16th @ 9:23"
        label.textColor = .systemGray
        return label
    }()
    
    var Cart: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "cart.badge.plus"))
        image.layer.cornerRadius = 8
        image.backgroundColor = .systemBlue
        image.tintColor = .white
        return image
    }()
    
    var Trash: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "trash"))
        image.tintColor = .black
        return image
    }()
    
    var collection : UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray5
        return view
    }()
    
 
}

extension ViewController{
    private func setUI(){
        view.backgroundColor = .white
        tableView.register(BonusCell.self, forCellReuseIdentifier: "BonusCell")
        tableView.dataSource = self
        tableView.delegate = self
        setViews()
        setContrains()
    }
    
    private func setViews(){
       
        view.addSubview(navBar)
        view.addSubview(tableView)
navBar.addSubview(Description)
        navBar.addSubview(Trash)
        navBar.addSubview(Cart)
        navBar.addSubview(navTitle)
        view.addSubview(collection)
        toDoView.addSubview(toDoLabel)
        collection.addSubview(complete)
        collection.addSubview(toDoView)
   
    }
    
    private func setContrains(){
        navBar.backgroundColor = .systemMint
        
        Trash.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-16)
            make.centerY.equalToSuperview().offset(30)
            make.width.height.equalTo(30)
        }
        
        navBar.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(120)
            make.top.equalToSuperview()
        }
        
        Cart.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview().offset(30)
            make.width.height.equalTo(30)
        }
        
        navTitle.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(15)
            make.leading.equalTo(Cart.snp.trailing).offset(20)
        }
        
        Description.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(40)
            make.leading.equalTo(Cart.snp.trailing).offset(20)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(collection.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        collection.snp.makeConstraints { make in
            make.top.equalTo(navBar.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(60)
        }
        
        toDoView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(30)
            make.width.equalTo(140)
            make.height.equalTo(40)
            make.centerY.equalToSuperview()
        }
        
        toDoLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        complete.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-50)
            make.centerY.equalToSuperview()
        }
        
       
        
      
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ToDoListBonus.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
  
        let cell = tableView.dequeueReusableCell(withIdentifier: "BonusCell", for: indexPath) as! BonusCell

            if indexPath.row < ToDoListBonus.count {
     
                let post = ToDoListBonus[indexPath.row]
             
                cell.configurView(title: post)
            }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 60
    }
}
