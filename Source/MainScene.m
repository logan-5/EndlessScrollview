#import "MainScene.h"
#import "ContentNode.h"

@implementation MainScene

- (void)onEnter {
    ContentNode* cn = [[ContentNode alloc] init];
    CCScrollView* scrollView = [CCScrollView scrollViewWithContentNode:cn];
    [self addChild:scrollView];

    CGSize screenSize = [CCDirector sharedDirector].viewSize;
    scrollView.positionInPoints = ccp( screenSize.width / 2., screenSize.height / 2. );

    scrollView.verticalScrollEnabled = NO;
    scrollView.pagingEnabled = YES;
    scrollView.bounces = NO;
    scrollView.contentSizeType = CCSizeTypePoints;
    scrollView.contentSize = CGSizeMake( cn.contentSizeInPoints.width / cn.numberOfChildren, cn.contentSizeInPoints.height );
    [scrollView setHorizontalPage:cn.numberOfChildren / 2 animated:NO];
    cn.scrollView = scrollView; // can't do this until after the line above, when the scroll view is set to the "default" page

    CCSprite* outline = [CCSprite spriteWithImageNamed:@"sprites/outline.png"];
    outline.positionInPoints = scrollView.positionInPoints;
    outline.anchorPoint = CGPointZero;
    [self addChild:outline];

    [super onEnter];
}

@end
