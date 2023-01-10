 @IBOutlet weak var tableView: UIView!
    
    var adressData: [AdressModel] = [
        AdressModel(name: "Main Street12", price: 1500, image: "1"),
        AdressModel(name: "Toctogula 115", price: 1580, image: "2"),
        AdressModel(name: "Isanova 188", price: 2460, image: "3"),
        AdressModel(name: "Sovetskaya 100", price: 500, image: "4"),
        AdressModel(name: "Jibek jolu 330", price: 300, image: "5"),
        AdressModel(name: "Ahynbaeva 134", price: 850, image: "6"),
        
        ]
    var  floatingButton = UIButton()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        floatingButton.setTitle("Корзина", for: .normal)
                floatingButton.backgroundColor = .systemYellow
                floatingButton.layer.cornerRadius = 20
                
                view.addSubview(floatingButton)
                floatingButton.addTarget(self, action: #selector(goToCart), for: .touchUpInside)
                
                floatingButton.translatesAutoresizingMaskIntoConstraints = false
                floatingButton.centerXAnchor.constraint(equalTo: view.centerXAnchor,constant: 0).isActive = true
                floatingButton.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -50).isActive = true
                
                floatingButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
                floatingButton.widthAnchor.constraint(equalToConstant:  300).isActive = true

    }
    @objc func goToCart() {
            let cartScreen = SecondViewController()
            present(cartScreen, animated: false)
        }
    }




extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return adressData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AdressTableViewCell", for: indexPath) as! AdressTableViewCell
        let adress = adressData[indexPath.row]
        cell.adressImageView.image = UIImage(named: adress.image)
        cell.adressNameLabel.text = adress.name
        cell.priceLabel.text = "\(adress.price)"
        return cell
    }
    
}
    
extension ViewController: UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
            let addressDetailedVC = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
            navigationController?.pushViewController(addressDetailedVC, animated: true)
        }
    
    
}

