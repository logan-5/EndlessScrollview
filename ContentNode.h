//
//  ContentNode.h
//  EndlessScrollView
//
//  Created by Logan Smith on 2/16/16.
//  Copyright © 2016 Apportable. All rights reserved.
//

#import "CCLayoutBox.h"

@interface ContentNode : CCLayoutBox

@property (weak, nonatomic) CCScrollView *scrollView;
@property (readonly, nonatomic) int numberOfChildren;

@end
