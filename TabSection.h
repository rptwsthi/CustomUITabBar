//
//  TabSectionView.h
//  CustomTabBar
//
//  Created by medma on 7/11/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface TabSectionView : UIView{
  

}
@property (nonatomic, strong) IBOutlet UIImageView *tabBackground;
@property (nonatomic, strong) IBOutlet UIImageView *tabIcon;
@property (nonatomic, strong) IBOutlet UILabel	   *tabLabel;
@property (nonatomic, strong) IBOutlet UIButton	   *tabTouch;

- (id) initWithFrame:(CGRect)frame;

@end
