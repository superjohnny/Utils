//
//  TabBarViewController.m
//  Utils
//
//  Created by Jonathan Green on 15/10/2014.
//  Copyright (c) 2014 AngryYak Ltd. All rights reserved.
//

#import "TabBarViewController.h"
#import "CGGeometry+Helper.h"
#import "UIColor+Colors.h"
#import "BadgeView.h"
#import "UIView+FrameHelper.h"
#import "AppDelegate.h"
#import "DeviceUtils.h"
#import "UIView+UIHelper.h"
#import "Stylist.h"
#import "TabBarItemWithSegue.h"

//Vanguard
#import <Vanguard/Vanguard.h>

@interface TabBarViewController()

@property (nonatomic, strong) BadgeView *historyBadge;
@property (nonatomic, strong) BadgeView *inboxBadge;

@property (weak, nonatomic) IBOutlet UITabBar *tabBar;

@end


@implementation TabBarViewController {
    NSInteger _previousJourneysRequiringAttention;
}


- (void) awakeFromNib {
    
    //tab bar item appearance. Set it here, AppDelegate didLaunch is too early for the font to be set correctly on the tab items
    [Stylist setTabBarItemAppearance];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateBadges) name:VGDUserStatsDidUpdate object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateBadges) name:VGDBulkProcessingDidFinishProcessing object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateBadges) name:NotificationUpdageBadges object:nil];
    
    //self.navigationItem.title = ((UITabBarItem *)[self.tabBar.items firstObject]).title; //localize?
    
    //add the swoosh on top of the tab bar
    UIImageView * tabSwoosh = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Img_swoosh_image"]];
    
    tabSwoosh.frame = CGRectOffsetY(tabSwoosh.frame, tabSwoosh.frame.size.height * -1);
    tabSwoosh.frame = CGRectUpdateWidth(tabSwoosh.frame, self.view.frame.size.width);
    [self.tabBar addSubview:tabSwoosh];
    
    //setup the icons correctly on the tab bar
    //home
    [self loadTabBarItem:self.tabBar.items[0] withImages:@"ic_home_active" andSelectedImage:@"ic_home_inactive"];
    
    //history
    [self loadTabBarItem:self.tabBar.items[1] withImages:@"ic_history_active" andSelectedImage:@"ic_history_inactive"];
    
    //inbox
    [self loadTabBarItem:self.tabBar.items[2] withImages:@"ic_inbox_active" andSelectedImage:@"ic_inbox_inactive"];
    
    //share
    [self loadTabBarItem:self.tabBar.items[3] withImages:@"ic_share_active" andSelectedImage:@"ic_share_inactive"];
    
    //ensure the first screen is shown
    TabBarItemWithSegue *item = [self.tabBar.items firstObject];
    self.tabBar.selectedItem = item;
    [self tabBar:self.tabBar didSelectItem:item];

    
    [self updateBadges];
}

- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Methods
/** @name Methods */


- (void)updateBadges {
    
    NSInteger journeysRequiringAttention =  [VGDJourney countJourneysWithUnknownRoleStatus];
    
    //TODO: how do we know about the inbox?
    
    if (!_historyBadge) {
        _historyBadge = [[BadgeView alloc] initWithImageNamed:@"ic_history_notification"];

        _historyBadge.hidden = YES;
        [self.tabBar addSubview:_historyBadge];
        
    }

    [_historyBadge setPositionX:((self.tabBar.frame.size.width / 4) * 2) -_historyBadge.width
                           andY:5];
    
    
    //if the journeysRequiringAttention changes
    if (_previousJourneysRequiringAttention != journeysRequiringAttention) {
    
        if ((BOOL)_previousJourneysRequiringAttention != (BOOL)journeysRequiringAttention) {
            
            //update with animation if the value crosses zero
            if (journeysRequiringAttention > 0) {
                [_historyBadge bounceInWithCompletion:^{
                    self.historyBadge.badgeValue = journeysRequiringAttention;
                }];
            } else {
                [_historyBadge bounceOutWithCompletion:^{
                    self.historyBadge.badgeValue = journeysRequiringAttention;
                }];
            }
        } else {
            
            //update without animation
            self.historyBadge.badgeValue = journeysRequiringAttention;
        }
        
        _previousJourneysRequiringAttention = journeysRequiringAttention;
    }
    
    
    AppDelegate * appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    BOOL inboxHidden = !appDelegate.newPosts;

    
    if (!_inboxBadge) {
        _inboxBadge = [[BadgeView alloc] initWithImageNamed:@"ic_inbox_notification"];
        
        _inboxBadge.hidden = YES;
        [self.tabBar addSubview:_inboxBadge];
        
    }
    
    [_inboxBadge setPositionX:((self.tabBar.frame.size.width / 4) * 3) -_inboxBadge.width
                         andY:5];
    
    if (_inboxBadge.hidden != inboxHidden) {
        if (_inboxBadge.hidden) {
            [_inboxBadge bounceInWithCompletion:^{
                self.inboxBadge.hidden = inboxHidden;
            }];
        } else {
            [_inboxBadge bounceOutWithCompletion:^{
                self.inboxBadge.hidden = inboxHidden;
            }];
        }
    }
}


- (void) loadTabBarItem:(UITabBarItem * ) tabBarItem withImages:(NSString*) imageName andSelectedImage:(NSString *) selectedImageName {
    
    tabBarItem.image = [self loadScaledImageNamed:imageName];
    tabBarItem.selectedImage = [self loadScaledImageNamed:selectedImageName];
}

- (UIImage *) loadScaledImageNamed:(NSString *) imageName {
    UIImage * image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

    float scale = [DeviceUtils deviceHasFourPointSevenInchScreen] | [DeviceUtils deviceHasFivePointFiveInchScreen] ? 1.2 : 1.5;

    return [[UIImage imageWithCGImage:[image CGImage] scale:image.scale * scale orientation:image.imageOrientation] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}


#pragma mark - UITabBarDelegate methods
/** @name UITabBarDelegate methods */

/**
 *  Performs the segue for tab bar item.
 *
 *  Watch the cast of the tab bar item!
 *
 *  @param tabBar UITabBar containing the tab bar item selected
 *  @param item   TabBarItemWithSegue item selected with segue identifier to perform
 */
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(TabBarItemWithSegue *)item {
    self.navigationItem.title = item.title;
    
    [self performSegueWithIdentifier:item.segueIdentifier sender:self];
    
}


@end
