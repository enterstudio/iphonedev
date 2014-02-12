//
//  SlideOutMenuController.h
//  GamerSocial
//
//  Created by mike.tihonchik on 9/20/13.
//  Copyright (c) 2013 mike.tihonchik. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SlideOutMenuControllerDelegate <NSObject>

@optional
- (void)imageSelected:(UIImage *)image withTitle:(NSString *)imageTitle withCreator:(NSString *)imageCreator;
@end

@interface SlideOutMenuController : UIViewController

@property (nonatomic, assign) id<SlideOutMenuControllerDelegate> delegate;

@end
