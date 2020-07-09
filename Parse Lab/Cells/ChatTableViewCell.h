//
//  ChatTableViewCell.h
//  Parse Lab
//
//  Created by Ian Andre Aragon Saenz on 06/07/20.
//  Copyright © 2020 IanAragon. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ChatTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *usernameText;
@property (weak, nonatomic) IBOutlet UILabel *messageText;

@end

NS_ASSUME_NONNULL_END