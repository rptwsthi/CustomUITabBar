//
//  CustomTabBarViewController.h
//  CustomTabBar
//
//  Created by medma on 7/11/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TabSectionView.h"

#define k_iPhoneXIB @"CustomTabBarViewController_iPhone"
#define k_iPadXIB  @"CustomTabBarViewController_iPad"

//@class TabSectionView;

@protocol CustomTabBarDelegate <NSObject>
@required

- (int)noOfTabsForTabView;

- (UIButton *) tabView:(UIView *)tabView buttonAtIndex : (NSInteger) index;

- (UITabBarController *) setTabBarController;

@optional
- (float) heightOftabView : (UIView *) customTabView;

//return k_iPhoneXIB or k_iPadXIB
- (NSString *) tabBarControllerForDevice;

@end



@interface CustomTabBarViewController : UIViewController {
	id <CustomTabBarDelegate> delegate;
	UIView *buttonContainerView;
}

@property (nonatomic, strong) id <CustomTabBarDelegate> delegate;
@property (nonatomic, strong) NSString *_nibNameString;
@property (nonatomic, strong) UIView *buttonContainerView;
@property (nonatomic, strong) IBOutlet UIImageView *bgImageView;

- (IBAction) onClick : (id) sender;
- (void) setTabBarDesign;
@end
