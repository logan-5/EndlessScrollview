//
//  ContentNode.m
//  EndlessScrollView
//
//  Created by Logan Smith on 2/16/16.
//  Copyright © 2016 Apportable. All rights reserved.
//

#import "ContentNode.h"
#import "CCNode_Private.h"

@implementation ContentNode {
    int _oldPage;
    int _maxZOrder, _minZOrder;
    __weak CCScrollView* _scrollView; // also set this as a weak property in the .h file
    BOOL _changedThisFrame;
}

- (instancetype)init {
    if ( self = [super init] ) {
        _maxZOrder = 0, _minZOrder = 0;
        [self addChild:[CCSprite spriteWithImageNamed:@"sprites/1.png"]];
        [self addChild:[CCSprite spriteWithImageNamed:@"sprites/2.png"]];
        [self addChild:[CCSprite spriteWithImageNamed:@"sprites/3.png"]];
    }
    return self;
}

- (int)numberOfChildren {
    return (int)[self.children count];
}

- (void)setScrollView:(CCScrollView *)scrollView {
    _scrollView = scrollView;
    _oldPage = scrollView.horizontalPage;
}

- (void)update:(CCTime)delta {
    if ( !_scrollView ) return;

    // check if view page changed
    int diff = _scrollView.horizontalPage - _oldPage;
    if ( diff > 0 ) {
        // swiped right
        for ( int i = 0; i < diff; ++i ) {
            ((CCNode*)self.children[i]).zOrder = ++_maxZOrder;
        }
    } else if ( diff < 0 ) {
        // swiped left
        int absDiff = abs( diff );
        int childrenCount = [self numberOfChildren];
        for ( int i = 0; i < absDiff; ++i ) {
            ((CCNode*)self.children[childrenCount - i - 1]).zOrder = --_minZOrder;
        }
    }
    if ( diff != 0 ) {
        [self sortAllChildren];
        [self layout];
        [_scrollView setHorizontalPage:_scrollView.horizontalPage - diff animated:NO];
    }

    _oldPage = _scrollView.horizontalPage;
}

@end
