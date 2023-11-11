import UIKit
import SnapKit

class BonusCell: UITableViewCell {
    
    var titleView = UILabel()
    var iconView = UIImageView(image: UIImage(systemName: "rectangle"))
    var containerView = UIView()
    
    func configurView(title: String) {
        titleView.text = title
        iconView.tintColor = .black
        setUI()
    }
    
    private func setUI() {
        addSubview(containerView)
        
        containerView.addSubview(iconView)
        iconView.snp.makeConstraints { make in
            make.leading.equalTo(containerView).offset(16)
            make.centerY.equalTo(containerView)
        }
        
        containerView.addSubview(titleView)
        titleView.snp.makeConstraints { make in
            make.leading.equalTo(iconView.snp.trailing).offset(20)
            make.centerY.equalTo(containerView)
            make.trailing.lessThanOrEqualTo(containerView).offset(-16)
        }
        
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(60)
        }
    }
}

