//
//  CustomTabBarViewController.m
//  CustomTabBar
//
//  Created by Arpit on 7/11/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "CustomTabBarViewController.h"
#import "TabSectionView.h"

@implementation CustomTabBarViewController
@synthesize _nibNameString, bgImageView,buttonContainerView;

#pragma mark -
#pragma mark VIEW LIFE CYCLE

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  self._nibNameString = nibNameOrNil;
    if (self) {
        // Custom initialization.
		//[self performSelector:@selector(setTabBarDesign)];		
    }
    return self;
}

/*
 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
 - (void)viewDidLoad {
 [super viewDidLoad];
 }
 */


// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return YES;
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}




#pragma mark -
#pragma mark TAB BAR DESIGN
/*struct  {
	NSInteger noOfTabs : 2;
	UITabBarController *tabBarController;
	NSString *deviceType;
} delegateResponse;
*/
@synthesize delegate;
UITabBarController *tabBarController;

- (void) setTabBarDesign{

	
	NSInteger noOfTabs = [delegate noOfTabsForTabView];
	tabBarController  = [delegate setTabBarController];
	buttonContainerView = [[UIView alloc] initWithFrame:CGRectMake(0,
																   0,
																   0,
																   0)];
	float width = 0.0f;
	for (int i = 0; i < noOfTabs ; i++) {
		//NSLog(@"%d", i);
		UIButton *tabSection = [delegate tabView:self.view buttonAtIndex:i];
		CGRect frame = tabSection.frame;
		[tabSection setFrame:CGRectMake(i*frame.size.width, 
										0,
										frame.size.width,
										self.view.frame.size.height)];
		width = width + frame.size.width;
		//NSLog(@"tabSection.frame = %@ ---- tag =%d",NSStringFromCGRect(tabSection.frame), tabSection.tag);
		[tabSection setUserInteractionEnabled:YES];
		tabSection.tag = i+1;
		[tabSection addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];		
		[tabSection setAutoresizingMask:UIViewAutoresizingNone];
		if (i < noOfTabs) {
			UIImageView *sepratorStrip = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bottom Line.png"]];
			[sepratorStrip setFrame:CGRectMake(tabSection.frame.origin.x + tabSection.frame.size.width + 1,
											   0,
											   1,
											   self.view.frame.size.height)];
			[buttonContainerView addSubview:sepratorStrip];
		}
		[buttonContainerView addSubview:tabSection];
	}	
	
	[buttonContainerView setBackgroundColor:[UIColor clearColor]];
	[buttonContainerView setFrame:CGRectMake(0, 0, width, self.view.frame.size.height)];
	[buttonContainerView setCenter:CGPointMake(self.view.frame.size.width / 2,
											   self.view.frame.size.height / 2)];
	[buttonContainerView setAutoresizingMask:UIViewAutoresizingFlexibleTopMargin |
	 UIViewAutoresizingFlexibleBottomMargin | 
	 UIViewAutoresizingFlexibleRightMargin |
	 UIViewAutoresizingFlexibleLeftMargin];
	[self.view addSubview:buttonContainerView];
	[self.view setAutoresizingMask: UIViewAutoresizingFlexibleWidth |		 
	 UIViewAutoresizingFlexibleTopMargin |
	 UIViewAutoresizingFlexibleBottomMargin | 
	 UIViewAutoresizingFlexibleRightMargin |
	 UIViewAutoresizingFlexibleLeftMargin];	
}

- (void) onClick : (id) sender{
	[self performSelector:@selector(deselectAll)];
	[((UIButton *) sender) setSelected:YES];
	[tabBarController setSelectedIndex:((UIButton *) sender).tag - 1];

	if ([tabBarController.selectedViewController isKindOfClass:[UINavigationController class]]) {
		[(UINavigationController*)tabBarController.selectedViewController popToRootViewControllerAnimated:YES];
	}
	
}

- (void) deselectAll{
	NSArray *views = [buttonContainerView subviews];
	for (UIView *v in views) {
		if ([v isKindOfClass:[UIButton class]]) {
			[((UIButton *)v) setSelected:NO];
		}
	}
}
/*
 - (void) setDelegate:(id <CustomTabBarDelegate>) theDelegate{
 
 }
 */

- (void) setTabBarDesignWith : (UIImage *) backGroundImage 
					noOfTabs : (int) noOfTabs 
			    tabsOnImages : (NSArray *) tabsOnImages
			  tabsOverImages : (NSArray *) tabsOverImages  
		tabsBackGroundImages : (NSArray *) tabsBackGroundImages 
				   tabTitles : (NSArray *) tabTitles{
	UIImageView *backGroundImageView = [[UIImageView alloc] initWithImage:backGroundImage];
	[backGroundImageView setFrame:self.view.frame];
	[self.view addSubview:backGroundImageView];
}


@end
